package com.mycafe.myweb.admin.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mycafe.myweb.admin.model.service.AdminService;
import com.mycafe.myweb.coffee.model.service.CoffeeService;
import com.mycafe.myweb.common.FileUpload;
import com.mycafe.myweb.goods.model.service.GoodsService;
import com.mycafe.myweb.order.model.vo.OrderList;

@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	
	@Autowired
	private CoffeeService cfService;
	
	
	/*
	 * @Autowired private TeaService tsService;
	 */
	
	@Autowired
	private GoodsService gdService;
	
	
	@RequestMapping("/admin/adminPage")
	public String enterAdminPage(){
		
		
		return "admin/adminPage";
	}
	@RequestMapping("/admin/enrollCafe")
	public String enterEnrollCafe() {
		
		return "admin/enrollCafe";
	}
	@RequestMapping("/admin/enrollgoods")
	public String enterEnrollGoods() {
	
		
		return "/admin/enrollgoods";
	}
	@RequestMapping("/admin/enrollCafeEnd")
	public String enrollCafeEnd(Model m,@RequestParam Map<String, String> param,MultipartHttpServletRequest request, @RequestParam("upFile") MultipartFile[] file) {
		
		System.out.println("파일 들어옴"+file);
		
		List<String> fileMultiName =FileUpload.FileUpload(param,request,file);
		
		param.put("main_image",fileMultiName.get(0));
		int result=service.enrollCafeEnd(param,fileMultiName);
		String page = "common/msg";
		
		if(result==0) {
			m.addAttribute("msg", "카페등록실패. 다시 시도해주세요!");
			m.addAttribute("loc", "/admin/enrollCafe");
		}else {
			m.addAttribute("msg", "카페등록 성공");
			m.addAttribute("loc", "/cafe/searchCafe");
		}
		return page;
	}
	
	@RequestMapping("/admin/enrollGoodsEnd")
	public String enrollGoodsEnd(Model m,@RequestParam Map param,MultipartHttpServletRequest request, @RequestParam("upFile") MultipartFile[] file){
		
		List<String> fileMultiName =FileUpload.FileUpload(param,request,file);
		int result=0;
		
		result=gdService.enrollGoodsEnd(param,fileMultiName);
		
		
		
		/*
		 * else if(param.get("goods-selector").equals("tea")) { result
		 * =teaService.enrollGoodsEnd(); }
		 */
		String page="common/msg";
		
		if(result==0) {
			m.addAttribute("msg", "상품등록실패. 다시 시도해주세요!");
			m.addAttribute("loc", "/admin/enrollgoods");
		}else {
			m.addAttribute("msg", "상품등록 성공");
			m.addAttribute("loc", "/");
		}
		return page;
	}
	
	@RequestMapping("/admin/orderList")
	public ModelAndView checkStock() {
		
		ModelAndView mv=new ModelAndView();
		List<OrderList> list=service.checkStock();
		
		
		mv.addObject("list", list);
		mv.setViewName("admin/orderList");
		
		return mv;
	}
	@RequestMapping("/admin/excelDown")
	public void excelDown(HttpServletResponse response) {
		 //-- 객체선언
			System.out.println("@@@@@@@@@@@@@@@ExcelDown START@@@@@@@@@@@@@@@");
			service.getExcelDown(response);
		
			System.out.println("@@@@@@@@@@@@@@@ExcelDown END@@@@@@@@@@@@@@@");
			
	}
	@RequestMapping("admin/orderByDate")
	public ModelAndView orderByDate(HttpServletRequest request) throws ParseException {
		//주문관리 날짜로 조회
		String startDateStr=request.getParameter("date1");
		String endDateStr=request.getParameter("date2");
		
		SimpleDateFormat stringFormat=new SimpleDateFormat("MM/dd/yyyy");
		
		Date startDated=stringFormat.parse(startDateStr);
		Date endDated=stringFormat.parse(endDateStr);
		SimpleDateFormat dateFormat=new SimpleDateFormat("yy/MM/dd");
		 String startDate=dateFormat.format(startDated);
		 String endDate=dateFormat.format(endDated);
		
		ModelAndView mv=new ModelAndView();
		Map<String,String> dateMap=new HashMap<String,String>();
		dateMap.put("startDate",startDate);
		dateMap.put("endDate",endDate);
		List<OrderList> list=service.orderByDate(dateMap);
		
		System.out.println(dateMap);
		System.out.println(list);
		
		mv.addObject("startDateStr",startDateStr);
		mv.addObject("endDateStr",endDateStr);
		mv.addObject("list", list);
		mv.setViewName("admin/orderList");
		
		return mv;
	}
	
	 

}

