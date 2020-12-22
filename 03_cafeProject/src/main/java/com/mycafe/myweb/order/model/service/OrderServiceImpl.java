package com.mycafe.myweb.order.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycafe.myweb.order.model.dao.OrderDao;
import com.mycafe.myweb.order.model.vo.Cart;
import com.mycafe.myweb.order.model.vo.CartList;
import com.mycafe.myweb.order.model.vo.OrderList;
import com.mycafe.myweb.order.model.vo.OrderState;
import com.mycafe.myweb.order.model.vo.Payment;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	



	@Override
	public List<CartList> selectCart(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectCart(memberNo,session);
	}
	
	@Override
	public int addCart(Cart cart) {
		//이미 같은 상품이 존재할경우 goods_qty만 올려줌
		//없을경우 업데이트
		int result=0;
		CartList list=dao.selectCart(cart,session);
		System.out.println("존재하는값:"+list);
		if(list!=null) {
			result=dao.addCountcart(cart,session);
		}else {
			result=dao.addCart(cart,session);
		}
		return result;
	}

	@Override
	public List<CartList> selectCartBygoodsNo(int[] goodsNo) {
		// TODO Auto-generated method stub
		List<CartList> lists=new ArrayList<CartList>();	
	
		for(int i=0;i<goodsNo.length;i++) {
			lists.add(dao.selectCartBygoodsNo(goodsNo[i],session));
			
		}
		
		
		return lists;
	}

	@Override
	public int insertPayment(Payment pay) {
		// TODO Auto-generated method stub
		return dao.insertPayment(pay,session);
	}

	@Override
	public int insertOrder(List<OrderList> list) {
		// TODO Auto-generated method stub
		int result=0;
		for(int i=0;i<list.size();i++) {
			result=dao.insertOrder(list.get(i), session);
		
		}
	
		
		return result;
	}

	@Override
	public int deleteCart(int i) {
		// TODO Auto-generated method stub
		return dao.deleteCart(i,session);
	}

	@Override
	public List<OrderList> selectMyOrder(Map<String, Object> map,int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.selectMyOrder(map,cPage,numPerpage,session);
	}

	@Override
	public int selectMyOrderCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectMyOrderCount(map,session);
	}

	@Override
	public OrderState countOrderState(int memberNo) {
		// TODO Auto-generated method stub
		return dao.countOrderState(memberNo,session);
	}

	@Override
	public int cancelOrder(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.cancelOrder(map,session);
	}


}
