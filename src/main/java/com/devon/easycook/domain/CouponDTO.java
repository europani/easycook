package com.devon.easycook.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CouponDTO {

	private int couponNo;
	private String couponTitle;
	private int couponDiscount;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date couponSdate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date couponEdate;
	
	private UcouponDTO ucoupon;
	private MemberDTO member;
	
	
}
