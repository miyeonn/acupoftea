package com.mycafe.myweb.coffee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CoffeeController {

	@RequestMapping("/searchCoffee")
	public String searchCoffee() {
		
		return "coffee/searchCoffee";
	} 
	@RequestMapping("/coffee/coffeeDetail")
	public String searchCafe() {
		
		return "coffee/coffeeDetail";
	}
	
	@RequestMapping("/allCoffee")
	public String searchAllCoffee(){
		
		return "coffee/allCoffee";
		
	}
	
}
