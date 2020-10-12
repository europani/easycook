package com.devon.easycook.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("wishlist")
@Data
public class WishlistDTO {

	private String id;
	private int productNo;
}
