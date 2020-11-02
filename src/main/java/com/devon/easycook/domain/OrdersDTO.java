package com.devon.easycook.domain;

import java.sql.Timestamp;
import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class OrdersDTO {

	private int ordersNo; // 주문번호 시퀀스 써주기
	private String id; 
	private Timestamp ordersDate; // 주문날짜
	private int cartNo; // 장바구니 번호
	private String ordersStatus; // 주문상태
	private int ordersTotal; // 총합계 금액
	private int discountCoupon; // 쿠폰 할인(1)
	private int discountPoint; // 적립금 할인(2)
	private int check; // 쿠폰, 적립금 확인하기
	
	private MemberDTO member;
	private OrdersDetailDTO ordersDetail;
	private ProductDTO product;
	
	
	// 날짜조회용
	private Date fromDate;
	private Date toDate;
	private String ordersDateforString;
	
}
