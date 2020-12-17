package com.mycafe.myweb.order.controller;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycafe.myweb.common.PaymentCheck;
import com.mycafe.myweb.order.model.service.OrderService;
import com.mycafe.myweb.order.model.vo.Cart;
import com.mycafe.myweb.order.model.vo.CartList;
import com.mycafe.myweb.order.model.vo.OrderList;
import com.mycafe.myweb.order.model.vo.Payment;
import com.mycafe.myweb.user.model.service.UserService;
import com.mycafe.myweb.user.model.vo.JoinUser;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService service;
	
	@Autowired
	private UserService uService;
	
	
	@Autowired
	private PaymentCheck paycheck;
	

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
	
	@RequestMapping("/order/getToken")
	public @ResponseBody String getToken(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		// 아임포트 토큰생성 
		
		String imp_key 		=	URLEncoder.encode("1691411943881289", "UTF-8");
		String imp_secret	=	URLEncoder.encode("viv7heutRrAgzMfY56MdnCbuxuGrvLP03l8lzCOq4pHDcWCh3pvq1GVzbB0GnQHrbPMLsBcw0TacQNuT", "UTF-8");
		
		JSONObject json = new JSONObject();

		json.put("imp_key", imp_key);
		json.put("imp_secret", imp_secret);

		String token = PaymentCheck.getToken(request, response, json); 
		return token;
	}
	
	
	  @RequestMapping("/order/addOrder") 
	  public ModelAndView addOrder(HttpServletRequest request) {
		  ModelAndView mv=new ModelAndView();
	  //카트에서 넘어온 정보로 결제하기 
		  System.out.println("addOrder:"+request.getParameter("checkArr"));
		  String[] checkArr=request.getParameter("checkArr").split(",");
		  String[] selectArr=request.getParameter("selectArr").split(",");
		  int[] goodsNo=Arrays.stream(checkArr).mapToInt(Integer::parseInt).toArray();
		  int[] qty =Arrays.stream(selectArr).mapToInt(Integer::parseInt).toArray();
		  int memberNo=Integer.parseInt(request.getParameter("member_no"));
		  //member번호로 주소랑 이름 ,핸드폰번호 가져오기
		  	
		  JoinUser user=uService.getUserByNo(memberNo);
		  
		  System.out.println("user가져옴:"+user);
		  
		//goods번호로 cart번호랑 goods_title 가져오기
		  List<CartList> lists =service.selectCartBygoodsNo(goodsNo);
		  
		 for(int i=0;i<lists.size();i++) {
			 lists.get(i).setGoods_qty(qty[i]);
			 
		 }
		 mv.addObject("user", user);
		 mv.addObject("list",lists);
		 mv.setViewName("order/order");
		  
		 
		 return mv;
		  
	  }
	  @RequestMapping("/order/paymentEnd")
	  public @ResponseBody boolean paymentEnd(HttpServletRequest request) {
		  
		  // 주문번호 생성하기
		  Date now = new Date();
		  SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		  
		  String orderNo= format.format(now);
		  System.out.println("주문번호:"+orderNo);
		//order테이블에 넣기
		  List<OrderList> list=new ArrayList<OrderList>();
		  
		  int[] goodsNo=Arrays.stream(request.getParameterValues("goodsNos[]")).mapToInt(Integer::parseInt).toArray();
		  int[] qty =Arrays.stream(request.getParameterValues("orderQtys[]")).mapToInt(Integer::parseInt).toArray();
		  
		  for(int i=0;i<goodsNo.length;i++) {
			  OrderList order=new OrderList();
			  order.setOrder_no(orderNo);
			  order.setMember_no(Integer.parseInt(request.getParameter("memberNo")));
			  order.setGoods_no(goodsNo[i]);
			  order.setOrder_qty(qty[i]);
			  order.setOrder_receiver(request.getParameter("receiver"));
			  order.setOrder_tel(request.getParameter("receiver_tel"));
			  order.setOrder_address(request.getParameter("address"));
			  order.setOrder_sender(request.getParameter("sender"));
			  order.setSender_tel(request.getParameter("sender_tel"));
			  order.setSender_memo(request.getParameter("memo"));
			  list.add(order);
			 
		  	}
		  int result=service.insertOrder(list);
		    
		  
		  
		  //payment테이블에 넣기
		  Payment pay=new Payment();
		  pay.setOrder_no(orderNo);
		  pay.setPayment_price(Integer.parseInt(request.getParameter("payment")));
		  pay.setImp_id(request.getParameter("imp_uid"));
		  pay.setApply_num(request.getParameter("applyNum"));
		  pay.setMerchant_id(request.getParameter("merchant_uid"));
		  System.out.println(pay);
		  result=service.insertPayment(pay);
		  
		  
		  boolean flag=true;
		  if(result>0) {
			  flag=true;
		  }else {
			  flag=false;
		  }
		  
		  return flag;
		  
		  
	  }
	 
	
	

}
