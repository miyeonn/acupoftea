package com.mycafe.myweb.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycafe.myweb.order.model.service.OrderService;
import com.mycafe.myweb.order.model.vo.Cart;
import com.mycafe.myweb.order.model.vo.CartList;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService service;
	
	

	@RequestMapping("/order/enterOrder")
	public String enterOrder() {
		
		
		return "order/order";
	}
	@RequestMapping("/order/cart")
	public ModelAndView enterCart(HttpServletRequest request) {
		
		List<CartList> list=service.selectCart(Integer.parseInt(request.getParameter("memberNo")));
		
		
		ModelAndView mv=new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("order/cart");
		
		return mv;
	}
	
	@RequestMapping("/order/addcart") 
	 public @ResponseBody ModelAndView addCart(HttpServletRequest request){
	  
	  
	  
	  Cart cart=new Cart();
	  cart.setGoods_no(Integer.parseInt(request.getParameter("goodsNo")));
	  cart.setMember_no(Integer.parseInt(request.getParameter("userNo")));
	  cart.setGoods_qty(Integer.parseInt(request.getParameter("goodsQty")));
	 
	  int result=service.addCart(cart);
	  
	  	ModelAndView mv=new ModelAndView();
		mv.addObject("result",result);
		mv.setViewName("jsonView"); 
	  	return mv;
	  }
 
		
	@RequestMapping("/order/myOrder")
	public String enterMyOrder() {
		
		
		return "order/myOrder";
	}

}
