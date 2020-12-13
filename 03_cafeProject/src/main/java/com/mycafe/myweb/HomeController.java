package com.mycafe.myweb;

import java.text.DateFormat;
import java.util.Date;
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

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private CafeService cfService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
	
		List<Cafe> cafeList=cfService.resentCafe();
		System.out.println("리스트 가져옴:"+cafeList);
		model.addAttribute("cafeList",cafeList);
		
		
		return "home";
	}
	@RequestMapping("/home")
	public ModelAndView home(ModelAndView mv) {
		
		

		List<Cafe> cafeList=cfService.resentCafe();
		mv.addObject("cafeList",cafeList);
		mv.setViewName("home");
		
		return mv;
		
	}
	
}
