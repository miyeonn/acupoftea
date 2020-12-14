package com.mycafe.myweb.order.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {

	private int cart_no;
	private int member_no;
	private int goods_no;
	private String cart_state;
	private int goods_qty;
	
}
