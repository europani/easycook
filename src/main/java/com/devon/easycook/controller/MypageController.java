package com.devon.easycook.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.devon.easycook.domain.CouponDTO;
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
   
   @GetMapping("/orders")
   public String orders(Model model) {   
      
      // 나중에 session으로 id 받을것
      String id = "haram511";            
      
      List<OrdersDTO> orderList = mypageService.Orders(id);
      
      model.addAttribute("orderList", orderList);
   
      return "mypage/orders";
   }
   
   @RequestMapping(value = "/ordersTest.action")
   public ModelAndView ordersListTest(HttpServletRequest request, ModelAndView mv) {
	   
	   String fromDate = request.getParameter("fromDate");
	   String toDate = request.getParameter("toDate");
	   System.out.println("날짜 잘들어가라 제발 : " + fromDate + ", 그리고 이것도" + toDate);
	   
	   // 나중에 session으로 id 받을것
	   String id = "haram511";
	   
	   Map<String, String> dateMap = new HashMap<String, String>();
	   dateMap.put("id", id);
	   dateMap.put("fromDate", fromDate);
	   dateMap.put("toDate", toDate);
	   
	   List<OrdersDTO> orderListDate = mypageService.ordersDate(dateMap);
	   
	   mv.addObject("orderListDate", orderListDate);
	   mv.addObject("fromDate", fromDate);
	   mv.addObject("toDate", toDate);
	   mv.setViewName("mypage/orders");
	   return mv;
	   
   }
   
   
   @RequestMapping("/cancelRequire")
   public String cancelRequire(@RequestParam("ordersNo") int ordersNo, Model model) {
      
	  // 나중에 session으로 id 받을것
      String id = "haram511";   

      List<OrdersDTO> cancelRequireList = mypageService.cancelRequire(ordersNo);
      
      
      // 주문번호는 어차피 하나이니, 처음 list만 가져와도 ok
      OrdersDTO orders = cancelRequireList.get(0);
      Date orderDate = orders.getOrdersDate();
      int orderNum = orders.getOrdersNo();
      
      
      List<Integer> qtyList = new ArrayList();
      
      for (int i = 0; i < cancelRequireList.size(); i++) {
    	int qty = cancelRequireList.get(i).getOrdersDetail().getDetailQty();
    	qtyList.add(i, qty);
	  }
      
      System.out.println(qtyList);
      model.addAttribute("ordersDate", orderDate);
      model.addAttribute("orderNum", orderNum);
      model.addAttribute("qtyList", qtyList);
      model.addAttribute("cancelRequire", cancelRequireList);
      return "mypage/cancelRequire";
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
   public String coupon(Model model) {
      System.out.println("쿠폰내역확인 ㄱㄱ");
      
      // 나중에 @RequestParam등으로 id 받을것
      String id = "haram511";      
      
      List<CouponDTO> couponList = mypageService.Coupon(id);
      int couponCount = mypageService.couponCount(id);
      int myPoint = mypageService.myPoint(id);
      
      System.out.println(couponList);
      
    
      model.addAttribute("couponList", couponList);   
      model.addAttribute("couponCount", couponCount);
      model.addAttribute("myPoint", myPoint);
      return "mypage/coupon";
   }
   
   
}