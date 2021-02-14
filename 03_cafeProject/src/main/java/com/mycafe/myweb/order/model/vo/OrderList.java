package com.mycafe.myweb.order.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderList {

	private String order_no;
	private int member_no;
	private int goods_no;
	private String order_date;//db
	private String order_state;//db
	private int order_qty;
	private String order_receiver;
	private String order_tel;
	private String order_address;
	private String order_sender;
	private String sender_tel;
	private String order_canceled;//db
	private String order_ship;//db
	private String order_cfm;//db
	private String sender_memo;
	private String main_image;
	private String coffee_title;
	private int coffee_price;
	private String order_zipcode;
	private String order_address2;
	
}
