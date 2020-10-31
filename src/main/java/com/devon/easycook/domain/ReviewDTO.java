package com.devon.easycook.domain;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class ReviewDTO {

	private int reviewNo;
	private int productNo;
	private String id;
	private String reviewContent;
	private String reviewImage;
	private Timestamp reviewDate;
	private Double reviewScore;
	
	
	private int ordersNo;
}
