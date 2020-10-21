package com.devon.easycook.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.devon.easycook.domain.MemberDTO;
import com.devon.easycook.service.MailSendService;
import com.devon.easycook.service.MemberService;

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
	public String login(Model model, @RequestParam("id") String id, @RequestParam("pwd") String pwd) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		MemberDTO member = memberService.login(map);
		
		boolean passMatch = passEncoder.matches(pwd, member.getPwd());
		int authKey = member.getEmailAuthCheck();
		if (passMatch && authKey == 1) {
			// 쿠키 or 세션설정
			return "loginOk";
		} else if (passMatch) {
			return "authNotYet";	// 수정예정
		} else {
			return "login";
		}
		
	}
	
	@GetMapping("/signup")
	public String signup() {
		System.out.println("회원가입을 시작합니다.");
		return "signup";
	}
	
	@PostMapping("/signup")
	public String signup(@ModelAttribute MemberDTO member) {
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
}
