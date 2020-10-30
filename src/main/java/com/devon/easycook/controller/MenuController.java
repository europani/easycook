package com.devon.easycook.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.devon.easycook.domain.ProductDTO;
import com.devon.easycook.service.ProductService;

@Controller
public class MenuController {
	
	@Autowired
	ProductService productService;
	
	@GetMapping("/today")
	public String today(Model model) {
		ProductDTO product = productService.getToday();
		Date today = productService.getDate();
		
		SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, yyyy", Locale.ENGLISH);
		String endDay = sdf.format(today);
		model.addAttribute("detail", product);
		model.addAttribute("endDay", endDay);
		return "today";
	}
	
	@GetMapping("/weather")
	public String weather() {
		return "weather";
	}
}
