package com.mycafe.myweb.user.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookMarkList {

	
	private int member_no;
	private int cafe_no;
	private int goods_no;
	private String cafe_title;
	private String goods_title;
	private int goods_price;
	private String cafe_addr;
	private String main_image;
	
	
}
