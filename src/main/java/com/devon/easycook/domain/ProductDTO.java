package com.devon.easycook.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("product")
@Data
public class ProductDTO {

	private int productNo;
	private String category;
	private String productName;
	private String productDetail;
	private String productImage;
	private int productPrice;
	private int productStock;
	private int productAmount;
	private int productTime;
}
