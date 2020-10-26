package com.devon.easycook.controller;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.devon.easycook.domain.MemberDTO;
import com.devon.easycook.service.MemberService;
import com.devon.easycook.service.ProductService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	ProductService productService;

	@GetMapping("")
	public String index() {
		return "admin/admin";
	}
	
	@GetMapping("/member")
	public String member(Model model) throws ParseException {
		List<MemberDTO> list = memberService.getFullInfo();
		model.addAttribute("infoList", list);
		return "admin/member";
	}
	
	// 회원별 주문내역
	@GetMapping("/member/${id}")
	public String member(Model model, @PathVariable("id") String id) {
		
		
		return "admin/member";
	}
	
	@GetMapping("/product")
	public String product() {
		return "admin/product";
	}
	
	@GetMapping("/product/write")
	public String productWriteForm() {
		return "admin/productWrite";
	}
	@PostMapping("/product/write")
	public String productWrite() {
		return "admin/productWrite";
	}
	
	@GetMapping("/product/write/count")
	@ResponseBody
	public int countByCategory(@RequestParam("category") String num) {
		return productService.countByCategory(num);
	}
	
	@GetMapping("/orders")
	public String orders() {
		return "admin/orders";
	}
	
	@GetMapping("/board")
	public String board() {
		return "admin/board";
	}
}
