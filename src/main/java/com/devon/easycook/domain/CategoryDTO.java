package com.devon.easycook.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class CategoryDTO {

	private int categoryNo;
	private String category;
}
