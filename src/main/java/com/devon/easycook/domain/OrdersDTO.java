package com.devon.easycook.domain;

import java.sql.Timestamp;
import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class OrdersDTO {

	private int ordersNo;
	private String id;
	private Timestamp ordersDate;
	private int cartNo;
	private String ordersStatus;
	private int ordersTotal;
	
	private OrdersDetailDTO ordersDetail;
	private ProductDTO product;
	
	
	// 날짜조회용
	private Date fromDate;
	private Date toDate;
}
