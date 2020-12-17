package com.mycafe.myweb.order.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.mycafe.myweb.order.model.vo.Cart;
import com.mycafe.myweb.order.model.vo.CartList;
import com.mycafe.myweb.order.model.vo.OrderList;
import com.mycafe.myweb.order.model.vo.Payment;

public interface OrderDao {

	int addCart(Cart cart, SqlSessionTemplate session);

	List<CartList> selectCart(int memberNo, SqlSessionTemplate session);

	CartList selectCart(Cart cart, SqlSessionTemplate session);

	int addCountcart(Cart cart, SqlSessionTemplate session);

	CartList selectCartBygoodsNo(int goodsNo, SqlSessionTemplate session);

	int insertPayment(Payment pay, SqlSessionTemplate session);
	
	int insertOrder(OrderList orderList, SqlSessionTemplate session);


}
