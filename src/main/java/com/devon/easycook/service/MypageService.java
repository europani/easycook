package com.devon.easycook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devon.easycook.domain.CouponDTO;
import com.devon.easycook.domain.OrdersDTO;
import com.devon.easycook.repository.MypageDAO;

@Service
public class MypageService {

   @Autowired
   private MypageDAO mypageDAO;
   
   public List<OrdersDTO> Orders(String id) {
      System.out.println("서비스 : " + id);
      return mypageDAO.orders(id);
      
   }
   
   public List<CouponDTO> Coupon(String id) {
      System.out.println("쿠폰서비스 : " + id);
      return mypageDAO.coupon(id);
      
   }
   
   public List<OrdersDTO> canCancel(int ordersNo) {
      return mypageDAO.canCancel(ordersNo);
      
   } 
   
   
}