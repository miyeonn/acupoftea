package com.mycafe.myweb.order.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderList {

	private int order_no;
	private int member_no;
	private int goods_no;
	private String order_date;
	private String order_state;
	private int order_qty;
	private String order_receiver;
	private String order_tel;
	private String order_address;
	private String order_canceled;
	private String order_ship;
	private String order_cfm;
	
}
