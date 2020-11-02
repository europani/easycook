package com.devon.easycook.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class CartDTO {

	private int cartNo ; // 장바구니번호
	private String id; // 회원아이디
	private int productNo; // 상품번호
	private int cartQty; // 수량
	private ProductDTO product;
	private MemberDTO member;
	
}

