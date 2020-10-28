package com.devon.easycook.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class CartDTO {

	private int cartNo; // 장바구니번호
	private String Id; // 회원아이디
	private int productNo; // 상품번호
	private int cartQty; // 수량
	
	private String name; // 회원 이름
	private String productName; // 상품이름
	private int productPrice; // 상품가격
	private int money; // 상품가격 * 수량

}

//	private int cartStatus;