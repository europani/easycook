package com.devon.easycook.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.devon.easycook.domain.CartDTO;
import com.devon.easycook.domain.CouponDTO;
import com.devon.easycook.domain.MemberDTO;
import com.devon.easycook.domain.OrdersDTO;
import com.devon.easycook.domain.RefundDTO;
import com.devon.easycook.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	OrderService orderService;

	// 1. 장바구니에 추가하기
	@PostMapping("/cart/insert")
	public String insert(@ModelAttribute CartDTO dto, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		if (member == null) {
			return "redirect:/member/login";
		}
		String Id = member.getId();
		dto.setId(Id);
		System.out.println(Id);
		orderService.cartInsert(dto); // 장바구니 테이블에 아이디 저장
		return "redirect:/order/cart"; // 장바구니 목록으로 이동
	}

	// 2. 장바구니 목록보기

	@GetMapping("/cart")
	public String list(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(true);
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		
		if (member == null) {
			return "redirect:/member/login";
		}
		String Id = member.getId();
		List<CartDTO> list = orderService.cartList(Id);
		System.out.println(list);
		model.addAttribute("list", list);
		return "order/cart";
	}

	// 3. 장바구니 삭제하기
	@RequestMapping("/cart/delete")
	public String delete(@RequestParam int cartNo) {
		orderService.cartDelete(cartNo);
		return "redirect:/order/cart";
	}
	
	// 4. 주문하기 
	@GetMapping("/order")
	public String orderList(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(true);
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		if (member == null) {
			return "redirect:/member/login";
		}
		String Id = member.getId();
		List<CartDTO> list = orderService.cartList(Id);
		List<CouponDTO> list2 = orderService.couponList(Id);
		System.out.println(list2);
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		return "order/order";
	}
	
	/*
	 * @PostMapping("/payment") public String insert(@ModelAttribute CartDTO dto,
	 * HttpServletRequest request) { HttpSession session = request.getSession(true);
	 * MemberDTO member = (MemberDTO) session.getAttribute("member"); if (member ==
	 * null) { return "redirect:/member/login"; } String Id = member.getId();
	 * dto.setId(Id); System.out.println(Id); orderService.cartInsert(dto); // 장바구니
	 * 테이블에 아이디 저장 return "redirect:/order/cart"; // 장바구니 목록으로 이동 }
	 */
	
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
	 * 
	 */

	// 5. 장바구니 결제 마지막단계
	@RequestMapping("/payment")
	public String payment() {
		return "order/payment";
	}

	
	
	   
	
	
	// 주문취소
	@PostMapping("/returnOrder/{ordersNo}")
	public void returnOrder(@PathVariable("ordersNo") int ordersNo, Model model) {
		
		orderService.checkCancel(ordersNo);
		System.out.println("checkCancel 완료");
	}
	
	  // 반품실행창
	   @RequestMapping("/doCancel")
	   public String doCancel(@ModelAttribute RefundDTO refund, HttpServletRequest request, Model model) {
	      
		  // 나중에 session으로 id 받을것
		HttpSession session = request.getSession(true);
		MemberDTO member =(MemberDTO) session.getAttribute("member");
		String id = member.getId();
		
		refund.setId(id);	refund.setRefundStatus("반품신청");
		System.out.println(refund);
		orderService.doCancel(refund);
		System.out.println("doCancel 완료");
	    return "order/cancelSuccess";
	   }
	
	
	
}
