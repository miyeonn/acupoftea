package com.mycafe.myweb.order.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycafe.myweb.coffee.model.vo.Coffee;
import com.mycafe.myweb.common.PagingFactory;
import com.mycafe.myweb.common.PaymentCheck2;
import com.mycafe.myweb.order.model.service.OrderService;
import com.mycafe.myweb.order.model.vo.Cart;
import com.mycafe.myweb.order.model.vo.CartList;
import com.mycafe.myweb.order.model.vo.OrderList;
import com.mycafe.myweb.order.model.vo.OrderState;
import com.mycafe.myweb.order.model.vo.Payment;
import com.mycafe.myweb.user.model.service.UserService;
import com.mycafe.myweb.user.model.vo.JoinUser;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService service;
	
	@Autowired
	private UserService uService;
	
	


	@RequestMapping("/order/enterOrder")
	public ModelAndView enterOrder(HttpServletRequest request,HttpSession session) {
		//바로구매 클릭시
		ModelAndView mv=new ModelAndView();
		
		JoinUser u=(JoinUser) session.getAttribute("loginUser");
		
		Coffee cf=service.selectgoods(Integer.parseInt(request.getParameter("goodsNo")));
		
		
		mv.addObject("goods",cf);
		mv.addObject("user",u);
		mv.addObject("goods_qty",Integer.parseInt(request.getParameter("qty")));
		mv.setViewName("order/order");
		return mv;
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
	@RequestMapping("/order/deleteCart")
	public @ResponseBody ModelAndView deleteCart(HttpServletRequest request) {
		//선택삭제로 카트 지우기
	

	
		  int[] cartNo=Arrays.stream(request.getParameterValues("cartNos[]")).mapToInt(Integer::parseInt).toArray();
			 
		  System.out.println("카트번호:"+cartNo[0]);
		  int result=0;
		  //지울 갯수가 여러개이면 반복문(어쨌든 한개이상)
		  for(int i=0;i<cartNo.length;i++) {
			result=service.deleteCart(cartNo[i]);
			System.out.println("실행완료"+result);
			}

		ModelAndView mv=new ModelAndView();
		mv.addObject("result", result);	
		mv.setViewName("jsonView");   
	
		return mv;

	}

	/*
	 * @RequestMapping("/order/getToken") public @ResponseBody String
	 * getToken(HttpServletRequest request,HttpServletResponse response) throws
	 * Exception {
	 * 
	 * // 아임포트 토큰생성
	 * 
	 * String imp_key = URLEncoder.encode("1691411943881289", "UTF-8"); String
	 * imp_secret = URLEncoder.encode(
	 * "viv7heutRrAgzMfY56MdnCbuxuGrvLP03l8lzCOq4pHDcWCh3pvq1GVzbB0GnQHrbPMLsBcw0TacQNuT",
	 * "UTF-8");
	 * 
	 * JSONObject json = new JSONObject();
	 * 
	 * json.put("imp_key", imp_key); json.put("imp_secret", imp_secret);
	 * 
	 * String token = PaymentCheck.getToken(request, response, json); return token;
	 * }
	 */
	
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
		
		  List<CartList> lists=service.selectCartBygoodsNo(goodsNo,user.getMember_no());
		
		 for(int i=0;i<lists.size();i++) {
			 lists.get(i).setGoods_qty(qty[i]);
			 
		 }
		 mv.addObject("user", user);
		 mv.addObject("list",lists);
		 mv.setViewName("order/order");
		  
		 
		 return mv;
		  
	  }
	  @RequestMapping("/order/paymentEnd")
	  public @ResponseBody int paymentEnd(HttpServletRequest request) {
		  
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
		  
		  //주문완료된 것은 장바구니 테이블에서 지우기
		  
		  
		  
		  
		
		  return result;
		  
		  
	  }
	  
	  //마이페이지 결제내역
	  @RequestMapping("/order/myOrder")
	  public ModelAndView selectMyOrder(HttpServletRequest request, @RequestParam(required = false, defaultValue="1") int cPage,
			  							@RequestParam(required = false, defaultValue="4") int numPerpage) {
		  ModelAndView mv=new ModelAndView();
		  
		  String orderState=request.getParameter("orderState");
		  Map<String,Object> map=new HashMap<String,Object>();
		  List<OrderList> list=new ArrayList<OrderList>();
		  int totalData=0;
		  
		  map.put("memberNo",Integer.parseInt(request.getParameter("memberNo")));
		  
		  //orderstate 필터 낄 경우
		  if(orderState!=null) {
			  map.put("orderState",orderState);
			  System.out.println("orderstate필터 실행"+map);
			  list=service.selectMyOrder(map,cPage, numPerpage);
			  totalData=service.selectMyOrderCount(map);
			  
		  }else {
			 //첫화면일경우
			  list=service.selectMyOrder(map,cPage, numPerpage);
			  totalData=service.selectMyOrderCount(map);
		  }
		  //카운트 가져오기
		  
		  OrderState countList=service.countOrderState(Integer.parseInt(request.getParameter("memberNo")));
		  
		  
		  System.out.println("결제내역리스트"+countList);
		  mv.addObject("countList", countList);
		  mv.addObject("list",list);
		  mv.addObject("pageBar", PagingFactory.getPage(totalData, cPage, numPerpage, "/order/myOrder"));
		  mv.setViewName("order/myOrder");
		  
		  
		  return mv;
		  
	  }
	  //결제내역에서 결제취소 요청하기
	  @RequestMapping("/order/cancelOrder")
	  public @ResponseBody int cancelOrder(String orderNo,int goodsNo) {
		  
		  Map<String,Object> map=new HashMap();
		  map.put("orderNo", orderNo);
		  map.put("goodsNo", goodsNo);
		  
		  int result=service.cancelOrder(map);
		  
		  return result;
	  }
	  
	  //아임포트에 취소요청
	  @RequestMapping("/order/cancelPort")
	  public @ResponseBody ModelAndView cancelPort(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ModelAndView mv=new ModelAndView();
		  
		Payment pay=service.cancelPort(request.getParameter("orderNo"));
		
		System.out.println("merchant_id"+pay.getMerchant_id());
		
		String token=PaymentCheck2.getImportToken();
		
		String merchant_id=PaymentCheck2.cancelPayment(token, pay.getImp_id());
		if(merchant_id.equals("환불실패")) {
			mv.addObject("result", merchant_id);
		}else {
			// state 업데이트 order_state:결제취소 payment_state:환불완료
			int resultcnt=service.updateSt(merchant_id);
			if(resultcnt>0) {
				mv.addObject("result", "환불완료");
			}else {
				mv.addObject("result", "환불완료실패");
			}
		}
	
		
		mv.setViewName("jsonView");
		return mv;
		  
	  }
	  
	

}
