package com.mycafe.myweb.order.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Payment {

	private int payment_no;
	private int order_no;
	private int payment_price;
	private String payment_state;
	private String payment_method;
	private String imp_id;//아임포트 접근정보
	private String merchant_id;
	
	
}
