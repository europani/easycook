package com.devon.easycook.domain;

import lombok.Data;

@Data
public class UcouponDTO {

	private int ucouponNo;
	private String id;
	private int couponUsed;
	private int couponNo;
	

	private CouponDTO coupon;

	
}
