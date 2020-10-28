package com.devon.easycook.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class CartDTO {

	private int cart_no; // 장바구니번호
	private String id; // 회원아이디
	private int product_no; // 상품번호
	private int cart_qty; // 수량

	private String product_image; // 상품 이미지파일 이름
	private String name; // 회원 이름
	private String product_name; // 상품 이름
	private int product_price; // 상품 가격
	private int money; // 수량*상품 - 그상품 총금액
	private int count;
}

//	private int cartStatus;