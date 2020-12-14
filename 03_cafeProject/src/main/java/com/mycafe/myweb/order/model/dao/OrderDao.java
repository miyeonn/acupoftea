package com.mycafe.myweb.order.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.mycafe.myweb.order.model.vo.Cart;
import com.mycafe.myweb.order.model.vo.CartList;

public interface OrderDao {

	int addCart(Cart cart, SqlSessionTemplate session);

	List<CartList> selectCart(int memberNo, SqlSessionTemplate session);

}
