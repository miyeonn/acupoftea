package com.mycafe.myweb;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mycafe.myweb.cafe.model.service.CafeService;
import com.mycafe.myweb.cafe.model.vo.Cafe;
import com.mycafe.myweb.coffee.model.service.CoffeeService;
import com.mycafe.myweb.coffee.model.vo.Coffee;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private CafeService cfService;
	@Autowired
	private CoffeeService cService;
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		System.out.println("안타니");
		//최근 추가된 카페
		List<Cafe> cafeList=cfService.resentCafe();
		System.out.println("리스트 가져옴:"+cafeList);
		model.addAttribute("cafeList",cafeList);
		//인기 아이템
		List<Coffee> coffeelist=cService.selectHot();
		System.out.println(coffeelist);
		model.addAttribute("coffeeList", coffeelist);
		return "home";
	}
	@RequestMapping("/home")
	public ModelAndView home(ModelAndView mv) {
		
		System.out.println("안타니2");

		List<Cafe> cafeList=cfService.resentCafe();
		List<Coffee> coffeelist=cService.selectHot();
		
		mv.addObject("coffeeList", coffeelist);
		mv.addObject("cafeList",cafeList);
		mv.setViewName("home");
		
		return mv;
		
	}
	
}
