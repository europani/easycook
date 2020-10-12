package com.devon.easycook.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("category")
@Data
public class CategoryDTO {

	private int categoryNo;
	private String category;
}
