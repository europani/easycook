package com.devon.easycook.domain;

import lombok.Data;

@Data
public class ProductDTO {

	private int productNo;
	private int category;
	private String productName;
	private String productDetail;
	private String productImage;
	private int productPrice;
	private int productStock;
	private int productAmount;
	private int productTime;
}
