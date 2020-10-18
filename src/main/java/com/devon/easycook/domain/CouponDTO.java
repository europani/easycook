package com.devon.easycook.domain;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class CouponDTO {

	private int couponNo;
	private String id;
	private int couponType;
	private int couponDiscount;
	private int couponUsed;
	private Timestamp couponSdate;
	private Timestamp couponEdate;
	private String couponTitle;
	private String couponContent;
}
