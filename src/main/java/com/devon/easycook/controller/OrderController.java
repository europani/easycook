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
import com.devon.easycook.domain.OrdersDetailDTO;
import com.devon.easycook.domain.RefundDTO;
import com.devon.easycook.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	OrderService orderService;

	// 장바구니에 추가하기
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

	// 장바구니 목록보기

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

	// 장바구니 삭제하기
	@RequestMapping("/cart/delete")
	public String delete(@RequestParam int cartNo) {
		orderService.cartDelete(cartNo);
		return "redirect:/order/cart";
	}
	
	// 주문하기 
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

	
	// 결제 후 
	@PostMapping("/paymentComplete") public String insertOrders(@ModelAttribute OrdersDTO dto,
			@ModelAttribute OrdersDetailDTO dto2, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String Id = member.getId();
		// 1. orders에 insert
		dto.setId(Id);
		dto.setOrdersTotal(dto.getOrdersTotal());
		
		if(dto.getCheck()==1) {
			dto.setDiscountCoupon(dto.getDiscountCoupon());
			dto.setDiscountPoint(0);
		}
		else if(dto.getCheck()==2) {
			dto.setDiscountCoupon(0);
			dto.setDiscountPoint(dto.getDiscountPoint());
		}
		else {
			dto.setDiscountCoupon(0);
			dto.setDiscountPoint(0);
		}
		orderService.ordersInsert(dto);
		
		// 2. ordersDetail에 insert
		int ordersNo = dto.getOrdersNo();
		List<CartDTO> list = orderService.cartList(Id);
		
		for (int i = 0; i < list.size(); i++) {
			
          int productNo = list.get(i).getProductNo();
          int detailQty = list.get(i).getCartQty();
          
          System.out.println(i+" => "+ ordersNo);
          System.out.println(i+" => "+ productNo);
          System.out.println(i+" => "+ detailQty);
          //orderService.ordersDetailInsert(dto);
       }

		
		/* list에서 뽑아오기중 */
		/* dto2 */
		
		return "order/paymentComplete"; 
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
