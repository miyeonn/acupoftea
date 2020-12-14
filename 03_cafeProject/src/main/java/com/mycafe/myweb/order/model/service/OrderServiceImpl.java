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
	public int addCart(Cart cart) {
		// TODO Auto-generated method stub
		return dao.addCart(cart,session);
	}


	@Override
	public List<CartList> selectCart(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectCart(memberNo,session);
	}

}
