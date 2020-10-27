package com.devon.easycook.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.devon.easycook.domain.CartDTO;
import com.devon.easycook.service.CartService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	CartService cartService;
	
	// 1. 장바구니에 추가하기
	@RequestMapping("/cart/insert")
	public String insert(@ModelAttribute CartDTO cart, HttpSession session) {
		String Id = (String) session.getAttribute("Id");
		cart.setId(Id);
		// 기존 장바구니에 있는지 검사
		int count = cartService.countCart(cart.getProductNo(), Id);
		// 없으면 삽입
		if(count==0) {
			cartService.cartInsert(cart);
		}
		// 있으면 업데이트
		else {
			cartService.cartUpdate(cart);
		}
		return "redirect:/mypage/cart";
	}
	
	// 2. 장바구니 목록보기
	@RequestMapping("/cart")
	public ModelAndView list(HttpSession session, ModelAndView mv) {
		// 세션에 저장된 아이디 값
		String Id = (String) session.getAttribute("Id");
		Map<String, Object> map = new HashMap<String, Object>();
		List<CartDTO> list = cartService.cartList(Id); // 장바구니의 정보
		int sumTotal = cartService.sumTotal(Id); // 장바구니 금액합계
		// 배송비 = 2500원 / 5만원이상은 무료
		int fee = sumTotal >= 50000 ? 0 : 2500;
		map.put("list", list); // map에 장바구니 정보 저장
		map.put("count", list.size()); // 장바구니 상품의 유무
		map.put("sumTotal", sumTotal); // 금액합계
		map.put("fee", fee); // 배송비
		map.put("allSum", sumTotal+fee); // 총 합계 = 금액합계 + 배송비
		
		mv.setViewName("mypage/cart");
		mv.addObject("map", map);
		
		return mv;
	}
	
	
	// 3. 장바구니 수정하기 - 수량덮어쓰기
	@RequestMapping("/cart/update")
	public String update(@RequestParam int[] cartQty, @RequestParam int[] productNo, HttpSession session) {
		String Id = (String) session.getAttribute("Id");
		// 상품 갯수만큼 반복
		for(int i=0; i<productNo.length; i++) {
			CartDTO cart = new CartDTO();
			cart.setId(Id);
			cart.setCartQty(cartQty[i]);
			cart.setProductNo(productNo[i]);
			cartService.cartModify(cart);
		}
		return "redirect:/mypage/cart";
	}

	
	
	//  4. 장바구니 삭제하기
	@RequestMapping("/cart/delete")
	public String delete(@RequestParam int cartNo) {
		
		cartService.cartDelete(cartNo);
		return "redirect:/mypage/cart";
	}	
	
	
	
	
}
