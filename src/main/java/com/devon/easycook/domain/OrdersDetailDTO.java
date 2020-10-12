package com.devon.easycook.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("ordersDetail")
@Data
public class OrdersDetailDTO {

	private int ordersNo;
	private int productNo;
	private int detailQty;
	private int detailSt;
	private int detailRefund;
}
