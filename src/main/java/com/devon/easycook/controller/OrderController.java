package com.devon.easycook.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

	// 장바구니에 추가하기
	@PostMapping("/cart/insert")
	public String insert(@ModelAttribute CartDTO dto, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String Id = member.getId();
		dto.setId(Id);
		orderService.cartInsert(dto); // 장바구니 테이블에 아이디 저장
		return "redirect:/order/cart"; // 장바구니 목록으로 이동
	}

	// 장바구니 목록보기
	@GetMapping("/cart")
	public String list(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(true);
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String Id = member.getId();
		List<CartDTO> list = orderService.cartList(Id);
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
		String Id = member.getId();
		List<CartDTO> list = orderService.cartList(Id);
		List<CouponDTO> list2 = orderService.couponList(Id);
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		return "order/order";
	}

	// 결제 후 
	@GetMapping("/paymentComplete") 
	public String insertOrders(@ModelAttribute OrdersDTO dto, HttpServletRequest request, Model model) {
		System.out.println("total : " + dto.getOrdersTotal());
		HttpSession session = request.getSession(true);
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String Id = member.getId();
		dto.setId(Id);
		dto.setOrdersTotal(dto.getOrdersTotal());
		
		if (dto.getCheck()==1) {
			dto.setDiscountCoupon(dto.getDiscountCoupon());
			dto.setDiscountPoint(0);
		} else if (dto.getCheck()==2) {
			dto.setDiscountCoupon(0);
			dto.setDiscountPoint(dto.getDiscountPoint());
		} else {
			dto.setDiscountCoupon(0);
			dto.setDiscountPoint(0);
		}
		orderService.orders(dto);
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Calendar cal = Calendar.getInstance();
		String today = null;
		today = formatter.format(cal.getTime());
		Timestamp ts = Timestamp.valueOf(today);
		
		dto.setOrdersDate(ts);
		dto.setCheck(dto.getCheck());
		model.addAttribute("orders", dto);
		
		return "order/paymentComplete"; 
	}
	
	@PostMapping("/payment")
	public String payment(@ModelAttribute OrdersDTO orders, Model model) {
		model.addAttribute("orders", orders);
		
		return "order/payment";
	}
	
	// 주문취소
	@PostMapping("/returnOrder/{ordersNo}")
	public String returnOrder(@PathVariable("ordersNo") int ordersNo, Model model) {
		orderService.checkCancel(ordersNo);	
		return "mypage/returnOrder";	
	}
	
	// 반품실행창
	@RequestMapping("/doCancel")
	public String doCancel(@ModelAttribute RefundDTO refund, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(true);
		MemberDTO member =(MemberDTO) session.getAttribute("member");
		String id = member.getId();
		
		refund.setId(id);	
		refund.setRefundStatus("반품신청");
		orderService.doCancel(refund);
	    return "order/cancelSuccess";
	}
}