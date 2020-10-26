package com.devon.easycook.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data 
public class CartDTO {

	private int cartNo;
	private String Id;
	private int productNo;
	private int cartQty;
//	private int cartStatus;
	
	private String Name;
	private String productName;
	
}
