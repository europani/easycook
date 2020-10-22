package com.devon.easycook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.devon.easycook.service.MemberService;

@Controller
@RequestMapping("/food/*")
public class FoodController {
	
	@GetMapping("/best")
	public String best() {
		return "best";
	}
	
}
