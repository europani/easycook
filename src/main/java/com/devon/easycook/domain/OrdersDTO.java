package com.devon.easycook.domain;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class OrdersDTO {

	private int ordersNo;
	private String id;
	private Timestamp ordersDate;
	private int cartNo;
	private String ordersStatus;
}
