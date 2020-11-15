package com.devon.easycook.domain;

import lombok.Data;

@Data
public class WishlistDTO {

	private String id;
	private int productNo;
	
	private ProductDTO product;
}
