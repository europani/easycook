package com.devon.easycook.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.devon.easycook.domain.CartDTO;
import com.devon.easycook.domain.MemberDTO;
import com.devon.easycook.service.CartService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	CartService cartService;
	
	// 1. 장바구니에 추가하기
	@PostMapping("/cart/insert")
	public String insert(@ModelAttribute CartDTO dto, HttpSession session) {
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String id = member.getId();
		System.out.println(id);
		// 기존 장바구니에 있는지 검사
		if(id == null) {
			return "redirect:/member/login";
		}
		
		dto.setId(id);
		cartService.cartInsert(dto); // 장바구니 테이블에 아이디 저장
		return "redirect:/order/cart"; // 장바구니 목록으로 이동
	}
	
	// 2. 장바구니 목록보기
	@GetMapping("/cart")
	public ModelAndView list(HttpSession session, ModelAndView mv) {
		 Map<String, Object> map = new HashMap<>();
		 String Id = (String) session.getAttribute("Id");
		 if(Id != null) {
				// 로그인한 상태에서 실행
			 List<CartDTO> list = cartService.cartList(Id); // 장바구니 목록
			 int sumMoney=cartService.sumMoney(Id); // 상품금액합계
			 int fee = sumMoney >= 50000 ? 0 : 2500;
			 
			 // HashMap에 값들 저장
			 map.put("sumMoney", sumMoney); // 상품금액합계
			 map.put("fee", fee); // 배송비
			 map.put("sum", sumMoney + fee); // 총 금액
			 map.put("list", list); // 장바구니 목록
			 map.put("count", list.size()); // 레코드 개수
			
			 // 모델엔 뷰에 이동할 페이지의 이름과 데이터 저장
			 mv.setViewName("order/cart");
			 mv.addObject("map",map);
			 return mv;
			}
		 else {
			 return new ModelAndView("member/login","",null);
		 }
	}
	
	
	
	
	  
	  
		/*
		 * // 3. 장바구니 수정하기 - 수량덮어쓰기
		 * 
		 * @RequestMapping("/cart/update") public String update(@RequestParam int[]
		 * cartQty, @RequestParam int[] productNo, HttpSession session) { String Id =
		 * (String) session.getAttribute("Id"); // 상품 갯수만큼 반복 for(int i=0;
		 * i<productNo.length; i++) { CartDTO cart = new CartDTO(); cart.setId(Id);
		 * cart.setCartQty(cartQty[i]); cart.setProductNo(productNo[i]);
		 * cartService.cartModify(cart); } return "redirect:/mypage/cart"; }
		 * 
		 * 
		 * 
		 * // 4. 장바구니 삭제하기
		 * 
		 * @RequestMapping("/cart/delete") public String delete(@RequestParam int
		 * cartNo) {
		 * 
		 * cartService.cartDelete(cartNo); return "redirect:/mypage/cart"; }
		 * 
		 */
	
	
}
