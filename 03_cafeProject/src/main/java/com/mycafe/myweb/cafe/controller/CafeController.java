package com.mycafe.myweb.cafe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycafe.myweb.cafe.model.service.CafeService;

@Controller
public class CafeController {

	@Autowired
	private CafeService service;
	
	@RequestMapping("/cafe/searchCafe")
	public String searchCafe() {
		
		
		return "cafe/searchCafe";
	}
	

	@RequestMapping("/cafe/searchCafeByColor")
	public ModelAndView searchColor(ModelAndView mv,String color) {
		
		List list=service.searchColor();
		System.out.println("출력:"+list);
		mv.addObject("list",list);
		mv.setViewName("/cafe/searchCafe");
		return mv;
	}
	
	
	@RequestMapping("/cafe/cafeDetail")
	public String cafeDetail() {
		
		return "cafe/cafeDetail";
	}
	

	
}
