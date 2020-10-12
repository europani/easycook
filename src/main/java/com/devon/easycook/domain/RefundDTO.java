package com.devon.easycook.domain;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("refund")
@Data
public class RefundDTO {

	private int ordersNo;
	private int productNo;
	private String id;
	private Timestamp refundDate;
	private String refundStatus;
	private String refundReason;
	
}
