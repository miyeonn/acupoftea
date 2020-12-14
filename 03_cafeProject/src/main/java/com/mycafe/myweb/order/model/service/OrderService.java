package com.mycafe.myweb.order.model.service;

import java.util.List;

import com.mycafe.myweb.order.model.vo.Cart;
import com.mycafe.myweb.order.model.vo.CartList;

public interface OrderService {

	int addCart(Cart cart);

	List<CartList> selectCart(int parseInt);

}
