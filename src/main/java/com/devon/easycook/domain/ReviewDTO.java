package com.devon.easycook.domain;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class ReviewDTO {

	private int reviewNo;
	private int productNo;
	private String id;
	private String reviewTitle;
	private String reviewContent;
	private Timestamp reviewDate;
	private int reviewScore;
}
