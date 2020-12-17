package com.mycafe.myweb.order.model.service;

import java.util.List;

import com.mycafe.myweb.order.model.vo.Cart;
import com.mycafe.myweb.order.model.vo.CartList;
import com.mycafe.myweb.order.model.vo.OrderList;
import com.mycafe.myweb.order.model.vo.Payment;

public interface OrderService {

	int addCart(Cart cart);

	List<CartList> selectCart(int parseInt);

	List<CartList> selectCartBygoodsNo(int[] goodsNo);

	int insertPayment(Payment pay);

	int insertOrder(List<OrderList> list);

}
