package com.mycafe.myweb.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {

	@RequestMapping("/order/enterOrder")
	public String enterOrder() {
		
		
		return "order/order";
	}
	@RequestMapping("/order/cart")
	public String entercart() {
		
		
		return "order/cart";
	}
	@RequestMapping("/order/myOrder")
	public String enterMyOrder() {
		
		
		return "order/myOrder";
	}

}
