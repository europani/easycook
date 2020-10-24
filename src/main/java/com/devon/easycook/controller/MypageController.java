package com.devon.easycook.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.devon.easycook.domain.OrdersDTO;
import com.devon.easycook.domain.OrdersDetailDTO;
import com.devon.easycook.domain.ProductDTO;
import com.devon.easycook.service.MemberService;
import com.devon.easycook.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	MypageService mypageService;
	
	@GetMapping("/cart")
	public String cart() {
		return "mypage/cart";
	}
	@GetMapping("orders")
	public String orders(Model model) {
		System.out.println("주문내역확인 ㄱㄱ");
		Map<String, String> map = new HashMap<String, String>();
		String id = "haram511";
		map.put("id", id);
		/*
		 * OrdersDTO oDTO = null; OrdersDetailDTO odDTO; ProductDTO pDTO;
		 */
		
		mypageService.Orders(map);
		System.out.println(mypageService.Orders(map));
		List<OrdersDTO> orderList = mypageService.Orders(map);
		
		if (orderList == null) {
			System.out.println("주문내역 없음");
		}
		
		System.out.println("주문내역출력 : " + orderList);
		
		model.addAttribute("orders", orderList);
		return "mypage/orders";
	}

	@GetMapping("/wishlist")
	public String wishlist() {
		return "mypage/wishlist";
	}
	@GetMapping("/cancel")
	public String cancle() {
		return "mypage/cancel";
	}
	@GetMapping("/coupon")
	public String coupon() {
		return "mypage/coupon";
	}
	
	
}
