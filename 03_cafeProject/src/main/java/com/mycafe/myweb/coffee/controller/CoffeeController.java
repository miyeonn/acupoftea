package com.mycafe.myweb.coffee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycafe.myweb.coffee.model.service.CoffeeService;
import com.mycafe.myweb.coffee.model.vo.Coffee;
import com.mycafe.myweb.coffee.model.vo.CoffeeAndFile;

@Controller
public class CoffeeController {

	@Autowired
	private CoffeeService service;
	
	@RequestMapping("/searchCoffee")
	public String searchCoffee() {
		
		
		
		return "coffee/searchCoffee";
	} 
	@RequestMapping("/coffee/coffeeDetail")
	public ModelAndView selectCoffee(int coffeeNo,ModelAndView mv) {
		System.out.println("커피:"+coffeeNo);
		
		CoffeeAndFile cf=service.selectCoffee(coffeeNo);
		mv.addObject("coffee", cf);
		mv.setViewName("coffee/coffeeDetail");
		
		return mv;
	}
	
	@RequestMapping("/coffee/allCoffee")
	public ModelAndView searchAllCoffee(ModelAndView mv){
		
		List<Coffee> coffeeList=service.searchAllCoffee();	
		
		mv.addObject("coffeeList", coffeeList);
		mv.setViewName("coffee/allCoffee");
		
		
		return mv;
		
	}
	
}
