package com.mycafe.myweb.order.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mycafe.myweb.coffee.model.vo.Coffee;
import com.mycafe.myweb.order.model.vo.Cart;
import com.mycafe.myweb.order.model.vo.CartList;
import com.mycafe.myweb.order.model.vo.OrderList;
import com.mycafe.myweb.order.model.vo.OrderState;
import com.mycafe.myweb.order.model.vo.OrderSum;
import com.mycafe.myweb.order.model.vo.Payment;

public interface OrderDao {

	int addCart(Cart cart, SqlSessionTemplate session);

	List<CartList> selectCart(int memberNo, SqlSessionTemplate session);

	CartList selectCart(Cart cart, SqlSessionTemplate session);

	int addCountcart(Cart cart, SqlSessionTemplate session);

	CartList selectCartBygoodsNo(int goodsNo, SqlSessionTemplate session);

	int insertPayment(Payment pay, SqlSessionTemplate session);
	
	int insertOrder(OrderList orderList, SqlSessionTemplate session);

	int deleteCart(int i, SqlSessionTemplate session);

	List<OrderList> selectMyOrder(Map<String, Object> map,int cPage, int numPerpage, SqlSessionTemplate session);

	int selectMyOrderCount(Map<String, Object> map, SqlSessionTemplate session);

	OrderState countOrderState(int memberNo, SqlSessionTemplate session);

	int cancelOrder(Map<String, Object> map, SqlSessionTemplate session);

	Payment cancelPort(String orderNo, SqlSessionTemplate session);

	OrderSum checkOrderToday(String today, SqlSessionTemplate session);

	int updateSt(String merchant_id, SqlSessionTemplate session);

	int updateOrderSt(String merchant_id, SqlSessionTemplate session);

	Coffee selectgoods(int goodsNo, SqlSessionTemplate session);


}
