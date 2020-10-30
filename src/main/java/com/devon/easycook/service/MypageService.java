package com.devon.easycook.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devon.easycook.domain.CouponDTO;
import com.devon.easycook.domain.OrdersDTO;
import com.devon.easycook.repository.MypageDAO;

@Service
public class MypageService {

   @Autowired
   private MypageDAO mypageDAO;
   
   public List<OrdersDTO> orders(String id) {
      return mypageDAO.orders(id);
      
   }
   
   public List<OrdersDTO> ordersDetail(int ordersNo) {
		return mypageDAO.ordersDetail(ordersNo);
	}

   
   public List<OrdersDTO> ordersDate(Map<String, String> dateMap) {
	  return mypageDAO.ordersDate(dateMap);
	      
   }
  
   public List<CouponDTO> coupon(String id) {
      return mypageDAO.coupon(id); 
   }
   
   public List<CouponDTO> couponDate(Map<String, String> dateMap) {
		return mypageDAO.couponDate(dateMap);
	}
   
   public int couponCount(String id) {
	   return mypageDAO.couponCount(id); 
   }
   
   public int myPoint(String id) {
		return mypageDAO.myPoint(id);
	} 
   
   public List<OrdersDTO> cancelRequire(int ordersNo) {
      return mypageDAO.cancelRequire(ordersNo);
      
   }

   
   // 주문취소절차
	/*
	 * public void returnTablePlus(int ordersNo) {
	 * mypageDAO.returnTablePlus(ordersNo); }
	 */
   
   
   public void checkCancel(int ordersNo) {
		mypageDAO.checkCancel(ordersNo);		
	}
   

   
   // ADMIN
   public List<OrdersDTO> getOrder(int orderNo) {
		return mypageDAO.getOrder(orderNo);
	}




   
}