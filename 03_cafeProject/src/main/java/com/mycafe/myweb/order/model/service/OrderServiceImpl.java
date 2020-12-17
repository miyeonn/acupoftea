package com.mycafe.myweb.order.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycafe.myweb.order.model.dao.OrderDao;
import com.mycafe.myweb.order.model.vo.Cart;
import com.mycafe.myweb.order.model.vo.CartList;

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


}
