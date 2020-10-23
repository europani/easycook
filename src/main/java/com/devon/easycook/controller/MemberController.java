package com.devon.easycook.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.devon.easycook.domain.KakaoDTO;
import com.devon.easycook.domain.MemberDTO;
import com.devon.easycook.domain.OAuthToken;
import com.devon.easycook.service.MailSendService;
import com.devon.easycook.service.MemberService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	MailSendService mss;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	@GetMapping("/login")
	public String loginForm() {
		return "login";
	} 
	
	@PostMapping("/login")
	public String login(HttpServletRequest request, 
				@RequestParam("id") String id, @RequestParam("pwd") String pwd) {
		Map<String, String> map = new HashMap<String, String>();
		HttpSession session = request.getSession();
		map.put("id", id);
		map.put("pwd", pwd);
		MemberDTO member = memberService.login(map);
		
		boolean passMatch = passEncoder.matches(pwd, member.getPwd());
		int authKey = member.getEmailAuthCheck();
		if (passMatch && authKey == 1) {	// 로그인
			session.setAttribute("member", member);
			return "redirect:/";
		} else if (passMatch) {
			return "authNotYet";	// 수정예정
		} else {							// 로그인실패
			return "redirect:/member/login";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	} 
	
	@GetMapping("/signup")
	public String signup() {
		System.out.println("회원가입을 시작합니다.");
		return "signup";
	}
	
	@PostMapping("/signup")
	public String signup(@ModelAttribute MemberDTO member) {
		member.setEmail();		member.setTel();		member.setAddress();
		// 암호화
		String pwd = member.getPwd();
		String CypPwd = passEncoder.encode(pwd);
		member.setPwd(CypPwd);
		
		memberService.signup(member);
		
		// email 발송
		String authKey = mss.sendAuthMail(member.getId(), member.getEmail());
		member.setEmailAuthKey(authKey);

        Map<String, String> map = new HashMap<String, String>();
        map.put("id", member.getId());
        map.put("email", member.getEmail());
        map.put("authKey", member.getEmailAuthKey());

        memberService.insertAuthKey(map);
		
		return "signupOk";
	}
	
	@GetMapping("/signupCheck")
	public String signupCheck(@RequestParam("id") String id, @RequestParam("email") String email, 
				@RequestParam("authKey") String authKey) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
        map.put("email", email);
        map.put("authKey", authKey);
        
        boolean result = memberService.checkAuthKey(map);
		if (result) {
			return "authen";
		}
		return "index";
	}
	
	@GetMapping("/seekId")
	public String seekIdForm() {
		return "seekId";
	} 
	@PostMapping("/seekId")
	public String seekId(Model model, @ModelAttribute MemberDTO member) {
		String id = memberService.getId(member);
		model.addAttribute("id", id);
		return "seekIdOk";			// 아이디 알려줌
	} 
	
	@GetMapping("/seekPwd")
	public String seekPwdForm() {
		return "seekPwd";
	} 
	@PostMapping("/seekPwd")
	public String seekPwd(HttpServletResponse response,
			@RequestParam("id") String id, @RequestParam("email") String email) {		// 인증번호 발송
		String dbEmail = memberService.getEmail(id);
		boolean result = dbEmail.equals(email);
		
		if (result) {
			String authKey = mss.sendPwdMail(id, email);
			Cookie cookie = new Cookie("authKey", authKey);
			cookie.setMaxAge(60*10);
			response.addCookie(cookie);
			
			Cookie cookie2 = new Cookie("id", id);
			cookie.setMaxAge(60*10);
			response.addCookie(cookie2);
			
			return "authenPwd";			// 인증번호 입력
		} else {
			return "javascript:history.back()";
		}
	} 
	@PostMapping("/authenPwd")
	public String authenPwd(HttpServletRequest request, @RequestParam("key") String inputKey) {		// 인증번호 일치여부
		Cookie[] cookie = request.getCookies();
		String authKey = null;
		for (Cookie c : cookie) {
			if (c.getName().equals("authKey")) authKey = c.getValue();
		}

		boolean result = inputKey.equals(authKey);
		if (result) {
			return "changePwd";			// 비밀번호 변경
		} else {
			return "javascript:history.back()";
		}
	} 
	
	@GetMapping("/changePwd")
	public String changePwdForm() {
		return "changePwd";
	} 
	@PostMapping("/changePwd")
	public String changePwd(HttpServletRequest request, @RequestParam("pwd") String pwd) {	
		HttpSession session = request.getSession();
		String id = null;
		try {
			id = (String) session.getAttribute("id");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (id == null) {
			Cookie[] cookie = request.getCookies();
			for (Cookie c : cookie) {
				if (c.getName().equals("id")) id = c.getValue();
			}
		}
		
		String CypPwd = passEncoder.encode(pwd);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
        map.put("pwd", CypPwd);
        
        memberService.changePwd(map);
		return "redirect:/";			
	} 

	@GetMapping("/modify")
	public String modifyForm(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("member");
		String id = dto.getId();
		
		MemberDTO member = memberService.getInfo(id);
		String email = member.getEmail();
		String tel = member.getTel();
		String address = member.getAddress();
		
		member.setEmail1(email.substring(0, email.indexOf("@")));
		member.setEmail2(email.substring(email.indexOf("@")+1));
		member.setTel1(tel.substring(0, tel.indexOf("-")));
		member.setTel2(tel.substring(tel.indexOf("-")+1, tel.lastIndexOf("-")));
		member.setTel3(tel.substring(tel.lastIndexOf("-")+1));
		member.setAddress1(address.substring(0, address.indexOf(",")));
		member.setAddress2(address.substring(address.indexOf(",")+1, address.indexOf("(")-1));
		member.setAddress3(address.substring(address.indexOf("(")));
		model.addAttribute("info", member);
		
		return "modify";
	} 
	
	@PostMapping("/modify")
	public String modify(@ModelAttribute MemberDTO member) {
		member.setEmail();		member.setTel();		member.setAddress();
		String dbPwd = memberService.getPwd(member.getId());
		
		boolean passMatch = passEncoder.matches(member.getPwd(), dbPwd);
		if (passMatch) {
			memberService.modify(member);
			
			return "redirect:/";
		} else {
			return "redirect:/member/modify";
		}
	}
	
	@GetMapping("/delete")
	public String delete() {
		return "delete";
	}
	@PostMapping("/delete")
	public String delete(@RequestParam("id") String id, @RequestParam("pwd") String pwd) {
		String dbPwd = memberService.getPwd(id);
		boolean passMatch = passEncoder.matches(pwd, dbPwd);
		if (passMatch) {
			memberService.delete(id);
			return "redirect:/";
		} else {
			return "redirect:/member/delete";
		}
	}

	@GetMapping(value = "/kakaologinCallback", produces="application/json;charset=UTF-8")
	public @ResponseBody String kakaoCallback(String code) {
		
		//POST방식으로 key=value 데이터를 요청 (카카오쪽으로)
		RestTemplate rt = new RestTemplate();
		
		//HttpHeader 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content_type", "application/x-www-form-urlencoded:charset=utf-8");
		
		//HttpBody 오브젝트 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "0e5da3292d8e58d5694244ef5bc3539e");
		params.add("redirect_uri", "http://localhost:8089/easycook/member/kakaologinCallback");
		params.add("code", code);
		
		//HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest =
				new HttpEntity<MultiValueMap<String,String>>(params, headers);
		
		//Http 요청하기 - Post 방식으로 - 그리고 response 변수의 응답을 받음
		ResponseEntity<String> response = rt.exchange(
				"https://kauth.kakao.com/oauth/token",
				HttpMethod.POST,
				kakaoTokenRequest,
				String.class
				);
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		OAuthToken oauthToken = null;
		
		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonMappingException e) {
			
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			
			e.printStackTrace();
		}
		
		
		System.out.println("카카오 액세스 토큰 : " + oauthToken.getAccess_token());
		 
		//POST방식으로 key=value 데이터를 요청 (카카오쪽으로)
		RestTemplate rt2 = new RestTemplate();
				
		//HttpHeader 오브젝트 생성
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + oauthToken.getAccess_token() );
		
		headers2.add("Content_type", "application/x-www-form-urlencoded;charset=utf-8");
		System.out.println("통과1");
		//HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 =
				new HttpEntity<>(headers2);
		
		System.out.println("통과2");
		
		//Http 요청하기 - Post 방식으로 - 그리고 response 변수의 응답을 받음
		
		ResponseEntity<String> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST,
				kakaoProfileRequest2, String.class);
		
		System.out.println(response2.getBody());
		
		System.out.println("통과3");
		
		ObjectMapper objectMapper2 = new ObjectMapper();
		
		KakaoDTO kakaoProfile = null;
		
		System.out.println("통과4");
		
		try {
			kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoDTO.class);
			System.out.println("통과5");
		} catch (JsonMappingException e) {
			
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			
			e.printStackTrace();
		}
		
		System.out.println("카카오 아이디(번호):" + kakaoProfile.getId());
		System.out.println("카카오 닉네임:" + kakaoProfile.getKakao_account().getProfile().nickname);
		
		return response2.getBody();
	}
}
