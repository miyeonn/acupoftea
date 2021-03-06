package com.mycafe.myweb.cafe.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycafe.myweb.cafe.model.service.CafeService;
import com.mycafe.myweb.cafe.model.vo.Cafe;
import com.mycafe.myweb.cafe.model.vo.CafeAndFile;

@Controller
public class CafeController {

	@Autowired
	private CafeService service;
	
	@RequestMapping("/cafe/searchCafe")
	public ModelAndView searchCafe(ModelAndView mv) {
		
		List<Cafe> cafeList=new ArrayList<Cafe>();
		cafeList=service.selectCafeAll();
		
		System.out.println(cafeList.get(0));
		mv.addObject("cafeList", cafeList);
		mv.setViewName("cafe/searchCafe");
		
		return mv;
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
	public ModelAndView cafeDetail(int cafeNo,ModelAndView mv) {
		
		CafeAndFile cf=service.cafeDetail(cafeNo);
		
		System.out.println(cf);
		mv.addObject("cafe",cf);
		mv.setViewName("cafe/cafeDetail");
		
		
		return mv;
	}
	
	


	
}
