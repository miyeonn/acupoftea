package com.mycafe.myweb.order.model.service;

import java.util.List;
import java.util.Map;

import com.mycafe.myweb.coffee.model.vo.Coffee;
import com.mycafe.myweb.order.model.vo.Cart;
import com.mycafe.myweb.order.model.vo.CartList;
import com.mycafe.myweb.order.model.vo.OrderList;
import com.mycafe.myweb.order.model.vo.OrderState;
import com.mycafe.myweb.order.model.vo.OrderSum;
import com.mycafe.myweb.order.model.vo.Payment;

public interface OrderService {

	int addCart(Cart cart);

	List<CartList> selectCart(int parseInt);

	List<CartList> selectCartBygoodsNo(int[] goodsNo, int memeberNo);

	int insertPayment(Payment pay);

	int insertOrder(List<OrderList> list);

	int deleteCart(int i);

	List<OrderList> selectMyOrder(Map<String, Object> map,int cPage, int numPerpage);

	int selectMyOrderCount(Map<String, Object> map);


	OrderState countOrderState(int parseInt);

	int cancelOrder(Map<String, Object> map);

	Payment cancelPort(String orderNo);

	OrderSum checkOrderToday(String today);

	int updateSt(String merchant_id);

	Coffee selectgoods(int goodsNo);

	int updateCart(Map<String, Object> map);

	int updateCancelSt(String orderNo);

}
