package com.devon.easycook.domain;

import java.sql.Timestamp;
import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class RefundDTO {

	private int ordersNo;
	private int productNo;
	private String id;
	private int refundQty;
	private Timestamp refundDate;
	private String refundStatus;
	private String refundReason;
	
	private ProductDTO product;
	
	
}
