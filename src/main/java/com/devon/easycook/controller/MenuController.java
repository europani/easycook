package com.devon.easycook.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.devon.easycook.domain.ProductDTO;
import com.devon.easycook.domain.ReviewDTO;
import com.devon.easycook.service.ProductService;

@Controller
public class MenuController {
	
	@Autowired
	ProductService productService;
	
	@GetMapping("/today")
	public String today(Model model) {
		ProductDTO product = productService.getToday();
		
		int productNo = product.getProductNo();
		List<ReviewDTO> review = productService.getReview(productNo);
		ReviewDTO cal = productService.reviewCal(productNo);
		
		Date today = productService.getDate();
		SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, yyyy", Locale.ENGLISH);
		String endDay = sdf.format(today);
		
		model.addAttribute("detail", product);
		model.addAttribute("review", review);
		model.addAttribute("cal", cal);
		model.addAttribute("endDay", endDay);
		return "today";
	}
	
	@GetMapping("/weatherCheck")
	public String weather() {
		return "weatherCheck";
	}
	
	@GetMapping("/weather")
	public String weather(@RequestParam String weather, Model model) {
		List<ProductDTO> list = productService.getWeather(weather);
		model.addAttribute("list", list);
			
		return "weather";
	}
	
}
