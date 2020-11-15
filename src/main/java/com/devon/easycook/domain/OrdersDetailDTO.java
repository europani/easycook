package com.devon.easycook.domain;

import lombok.Data;

@Data
public class OrdersDetailDTO {

	private int ordersNo;
	private int productNo;
	private int detailQty;
	private int detailRefund;
	private int reviewCheck;
	
}
