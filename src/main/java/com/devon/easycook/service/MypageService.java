package com.devon.easycook.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devon.easycook.domain.CouponDTO;
import com.devon.easycook.domain.OrdersDTO;
import com.devon.easycook.domain.ProductDTO;
import com.devon.easycook.domain.RefundDTO;
import com.devon.easycook.domain.ReviewDTO;
import com.devon.easycook.domain.UcouponDTO;
import com.devon.easycook.domain.WishlistDTO;
import com.devon.easycook.repository.MypageDAO;
import com.devon.easycook.repository.OrderDAO;

@Service
public class MypageService {

   @Autowired
   private MypageDAO mypageDAO;
   
   public List<OrdersDTO> orders(Map<String, Object> map) {
      return mypageDAO.orders(map);
      
   }
   
   public List<OrdersDTO> ordersDetail(int ordersNo) {
		return mypageDAO.ordersDetail(ordersNo);
   }

   
   public List<OrdersDTO> ordersDaySearch(Map<String, Object> dateMap) {
	  return mypageDAO.ordersDaySearch(dateMap);
	      
   }
  
   // 주문내역 페이징용
   public int countUserOrder(String id) {
		return mypageDAO.countUserOrder(id);
   }
   
   
   public List<UcouponDTO> coupon(String id) {
      return mypageDAO.coupon(id); 
   }
   
   public List<UcouponDTO> couponDaySearch(Map<String, Object> dateMap) {
		return mypageDAO.couponDaySearch(dateMap);
	}
   
   public int couponCount(String id) {
	   return mypageDAO.couponCount(id); 
   }
   
   public int myPoint(String id) {
		return mypageDAO.myPoint(id);
	} 
   
   public void wishlistInput(Map<String, Object> wishlistMap) {	   
	   mypageDAO.wishlistInput(wishlistMap);
   }
   
   public List<WishlistDTO> wishlist(String id) {	   
	   return mypageDAO.wishlist(id);
   }
   
   public void wishlistDelete(int productNo) {
	   mypageDAO.wishlistDelete(productNo);
   }
   
   public OrdersDTO cancelRequire(Map<String, Object> refundCheckMap) {
      return mypageDAO.cancelRequire(refundCheckMap);
      
   }
   
   public RefundDTO checkRefund(Map<String, Object> refundCheckMap) {
	      return mypageDAO.checkRefund(refundCheckMap);
	      
   }
   
   public int orderPerProduct(int ordersNo) {
	   return mypageDAO.orderPerProduct(ordersNo);
   }
   
   
   
   public List<RefundDTO> refund(String id){
	   return mypageDAO.refund(id);
   }

   public List<RefundDTO> refundDaySearch(Map<String, Object> dateMap){
	   return mypageDAO.refundDaySearch(dateMap);
   }
   

   

   
   
   
   
   
   
   
   public void writeReview(ReviewDTO review) {
		int result = mypageDAO.writeReview(review);
		if (result != 0) {
			new OrderDAO().updateReviewCheck(review);
		}
	}
   
   
   // ADMIN
   public List<OrdersDTO> getOrder(int orderNo) {
		return mypageDAO.getOrder(orderNo);
	}




   
}