package com.devon.easycook.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devon.easycook.domain.CartDTO;
import com.devon.easycook.domain.CouponDTO;
import com.devon.easycook.domain.OrdersDTO;
import com.devon.easycook.domain.OrdersDetailDTO;
import com.devon.easycook.domain.RefundDTO;
import com.devon.easycook.repository.MypageDAO;
import com.devon.easycook.repository.OrderDAO;
import com.devon.easycook.util.PagingVO;

@Service
public class OrderService {

	@Autowired 
	private OrderDAO orderDao;
	
	
	// 장바구니에 추가하기
	public void cartInsert(CartDTO dto) {
		orderDao.cartInsert(dto);
	}
	
	// 장바구니 목록보기
	public List<CartDTO> cartList(String id) { 
		return orderDao.cartList(id); 
	}
	
	// 장바구니 삭제하기
	public void cartDelete(int cartNo) {
		orderDao.cartDelete(cartNo); 
	}
	
	// 장바구니 전체 삭제하기
	public void cartDeleteAll(String id) {
		orderDao.cartDeleteAll(id); 
	}
	
	// 쿠폰 목록보기
	public List<CouponDTO> couponList(String id) { 
		return orderDao.couponList(id); 
	}
	
	// 주문완료 후 주문목록 추가하기
	public void orders(OrdersDTO dto) { 
		
		orderDao.ordersInsert(dto); 
		String id = dto.getId();
		System.out.println(id);
		int ordersNo = orderDao.maxOrdersNo();
		
		System.out.println("아아아아아!!!!!!!!!!!!!!!!"+ordersNo);
		List<CartDTO> cartList = orderDao.getCartItem(id);
		System.out.println("아아아아아@@@@@@@@@@"+cartList);
		
		/*
		 * HashMap<String, Object> map = new HashMap<String, Object>();
		 * map.put("ordersNo", ordersNo);
		 */
		/*
		 * for (int i = 0; i < cartList.size(); i++) { map.put("productNo", ordersNo);
		 * map.put("detailQty", ordersNo); orderDao.ordersDetailInsert(map); }
		 */
		
	}
	
	
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	 


	
	
	
	
	
	public void checkCancel(int ordersNo) {
		int result = orderDao.checkCancel(ordersNo);	
		if (result == 1) {
			orderDao.checkRefund(ordersNo);
		}
	}

	
	public void doCancel(RefundDTO refund) {
		int result = orderDao.makeRefundTable(refund);
		if (result == 1) {
			orderDao.checkRefund(refund.getOrdersNo());
		}
	}
	

	// ADMIN
	
	public int countOrder() {
		return orderDao.countOrder();
	}

	public List<OrdersDTO> getFullInfo(PagingVO vo) {
		return orderDao.getFullInfo(vo);
	}

	public OrdersDTO getOrderInfo(int orderNo) {
		return orderDao.getOrderInfo(orderNo);
	}

	public void changeStatus(HashMap<String, Object> map) {
		orderDao.changeStatus(map);
	}

	public int countCancel() {
		return orderDao.countCancel();
	}

	public List<OrdersDTO> getCancelInfo(PagingVO vo) {
		return orderDao.getCancelInfo(vo);
	}

	public List<OrdersDTO> memberOrderlist(String id) {
		return orderDao.memberOrderlist(id);
	}

	public int memberSum(String id) {
		return orderDao.memberSum(id);
	}

	public Date memberLastest(String id) {
		return orderDao.memberLastest(id);
	}

	public int countRefund() {
		return orderDao.countRefund();
	}

	public List<RefundDTO> getRefundInfo(PagingVO vo) {
		return orderDao.getRefundInfo(vo);
	}

	public void refundStatus(HashMap<String, Object> map) {
		orderDao.refundStatus(map);
	}
	
	
	
}
