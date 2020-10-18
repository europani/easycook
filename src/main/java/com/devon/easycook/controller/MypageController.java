package com.devon.easycook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.devon.easycook.service.MemberService;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@GetMapping("/mypage")
	public String mypage() {
		return "mypage";
	} 
	@GetMapping("/cart")
	public String cart() {
		return "cart";
	} 
	@GetMapping("/wishlist")
	public String wishlist() {
		return "wishlist";
	} 
	
	
}
