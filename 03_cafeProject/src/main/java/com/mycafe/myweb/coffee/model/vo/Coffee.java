package com.mycafe.myweb.coffee.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Coffee {

	private int coffee_no;
	private int goods_no;
	private String coffee_title;
	private String coffee_brand;
	private int coffee_price;
	private String coffee_com;
	private String coffee_machine;
	private String coffee_origin;
	private String coffee_flavor;
	private String coffee_taste;
	private String main_image;
}
