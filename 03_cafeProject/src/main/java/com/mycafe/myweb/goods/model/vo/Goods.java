package com.mycafe.myweb.goods.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Goods {

	private int goods_no;
	private String category;
	private int goods_stock;
	
}
