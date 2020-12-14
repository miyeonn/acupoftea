package com.mycafe.myweb.order.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartList {

	
	private int goods_no;
	private int cart_no;
	private int goods_qty;
	private int coffee_no;
	private String coffee_title;
	private int coffee_price;
	private String main_image;
	private String category;
	private int goods_stock;
	
}
