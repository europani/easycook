package com.devon.easycook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devon.easycook.domain.CartDTO;
import com.devon.easycook.domain.OrdersDTO;
import com.devon.easycook.repository.OrderDAO;
import com.devon.easycook.util.PagingVO;

@Service
public class OrderService {

	@Autowired 
	private OrderDAO orderDao;
	
	
	// 1. 장바구니에 추가하기
	public void cartInsert(CartDTO cart) {
		orderDao.cartInsert(cart);
	}
	
	// 2. 장바구니 목록보기
	public List<CartDTO> cartList(String Id) { 
		return orderDao.cartList(Id); 
	}
	 /* 
	 * // 5. 장바구니 합계구하기 public int sumMoney(String Id) { return
	 * cartDao.sumMoney(Id); }
	 */
	/*
	 * // 3. 장바구니 수정하기 - 수량덮어쓰기 public void cartModify(CartDTO cart) {
	 * cartDao.cartModify(cart); }
	 * 
	 * // 4. 장바구니 삭제하기 public void cartDelete(int cartNo) {
	 * cartDao.cartDelete(cartNo); }
	 * 
	 * // 5. 장바구니 합계구하기
	 * 
	 * 
	 * // 6. 장바구니 동일 상품 확인 public int countCart(int productNo, String Id) { return
	 * cartDao.cartCount(productNo, Id); }
	 * 
	 * // 7. 장바구니에 같은상품있으면 수량합산 public void cartUpdate(CartDTO cart) {
	 * cartDao.cartUpdate(cart); }
	 */
	 



	// ADMIN
	
	public int countOrder() {
		return orderDao.countOrder();
	}

	public List<OrdersDTO> getFullInfo(PagingVO vo) {
		return orderDao.getFullInfo(vo);
	}

	public OrdersDTO getOrder(int orderNo) {
		return orderDao.getOrder(orderNo);
	}
	
	
	
}
