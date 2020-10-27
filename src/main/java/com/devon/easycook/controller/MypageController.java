package com.devon.easycook.controller;

import java.util.ArrayList;
import java.util.Date;
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
//      Map<String, String> map = new HashMap<String, String>();
      
      // 나중에 @RequestParam등으로 id 받을것
      String id = "haram511";            
      
      List<OrdersDTO> orderList = mypageService.Orders(id);
      System.out.println(mypageService.Orders(id));
      System.out.println("컨트롤러" + orderList);
      
      model.addAttribute("orderList", orderList);
   
      return "mypage/orders";
   }
   
   @RequestMapping("/canCancel")
   public String canCancel(@RequestParam("ordersNo") int ordersNo, Model model) {
      
      String id = "haram511";   
      System.out.println("canCancle 도착");
      List<OrdersDTO> canCancelList = mypageService.canCancel(ordersNo);
      
      OrdersDTO x = canCancelList.get(0);
      Date d = x.getOrdersDate();
      int i = x.getOrdersNo();
      
   
      
      System.out.println(mypageService.canCancel(ordersNo));
      System.out.println("컨트롤러" + canCancelList);
      
      
      model.addAttribute("oDate", d);
      model.addAttribute("oNum", i);
      model.addAttribute("canCancelList", canCancelList);
      return "mypage/canCancel";
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
//      Map<String, Object> map = new HashMap<String, Object>();
      
      // 나중에 @RequestParam등으로 id 받을것
      String id = "haram511";      
      
      List<CouponDTO> couponList = mypageService.Coupon(id);
      System.out.println(couponList);
      
      
      model.addAttribute("couponList", couponList);   
      
      return "mypage/coupon";
   }
   
   
}