package com.devon.easycook.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class CartDTO {

	private int cartNo ; // 장바구니번호
	private String id; // 회원아이디
	private int productNo; // 상품번호
	private int cartQty; // 수량

	private String productImage; // 상품 이미지파일 이름
	private String name; // 회원 이름
	private String email; // 회원 이메일
	private String tel; // 회원 전화번호
	private int point; // 회원 적립금
	private String productName; // 상품 이름
	private int productPrice; // 상품 가격
	
	private int money; // 수량*상품 - 그상품 총금액
	private int count; //개수
	
}

//	private int cartStatus;