package com.devon.easycook.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("cart")
@Data
public class CartDTO {

	private int cartNo;
	private String id;
	private int productNo;
	private int cartQty;
	private int cartStatus;
}
