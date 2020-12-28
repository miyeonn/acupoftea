package com.mycafe.myweb.order.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderSum {

	private String order_date;
	private int order_count;
	private int order_qty;
	
}
