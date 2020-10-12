package com.devon.easycook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.devon.easycook.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;

	@GetMapping("/memJoin")
	public String memJoin() {
		return "memJoin";
	}
	
	@PostMapping("/memJoin")
	public String memRegister() {
		return "memJoinOk";
	}
}
