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
import com.devon.easycook.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
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
		if (passMatch) {
			return "loginOk";
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
		System.out.println(member);
		String pwd = member.getPwd();
		String CypPwd = passEncoder.encode(pwd);
		member.setPwd(CypPwd);
		
		memberService.signup(member);
		
		return "signupOk";
	}
}
