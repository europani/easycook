package com.devon.easycook.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CouponDTO {

	private int couponNo;
	private String couponTitle;
	private int couponDiscount;
	private Timestamp couponSdate;
	private Timestamp couponEdate;
	
}
