package com.mycafe.myweb.order.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycafe.myweb.order.model.vo.Cart;
import com.mycafe.myweb.order.model.vo.CartList;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Override
	public int addCart(Cart cart, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.insert("cart.addCart", cart);
	}

	@Override
	public List<CartList> selectCart(int memberNo, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("cart.selectCart",memberNo);
	}

}
