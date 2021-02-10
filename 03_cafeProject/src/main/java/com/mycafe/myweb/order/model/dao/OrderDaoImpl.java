package com.mycafe.myweb.order.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycafe.myweb.coffee.model.vo.Coffee;
import com.mycafe.myweb.order.model.vo.Cart;
import com.mycafe.myweb.order.model.vo.CartList;
import com.mycafe.myweb.order.model.vo.OrderList;
import com.mycafe.myweb.order.model.vo.OrderState;
import com.mycafe.myweb.order.model.vo.OrderSum;
import com.mycafe.myweb.order.model.vo.Payment;

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

	@Override
	public CartList selectCart(Cart cart, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("cart.selectCartNo",cart);
	}

	@Override
	public int addCountcart(Cart cart, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.update("cart.addCountcart",cart);
	}

	@Override
	public CartList selectCartBygoodsNo(int goodsNo,int memberNo, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		Map map=new HashMap();
		map.put("goodsNo", goodsNo);
		map.put("memberNo",memberNo);
		System.out.println("goodsNo:"+goodsNo);
		return session.selectOne("cart.selectByGoodsNo",map);
	}


	@Override
	public int insertPayment(Payment pay, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.insert("order.insertPayment", pay);
	}

	@Override
	public int insertOrder(OrderList orderList, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.insert("order.insertOrder", orderList);
	}

	@Override
	public int deleteCart(int cartNo, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.delete("cart.deleteCart", cartNo);
	}

	@Override
	public List<OrderList> selectMyOrder(Map<String, Object> map,int cPage, int numPerpage, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		
		return session.selectList("order.selectMyOrder",map,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int selectMyOrderCount(Map<String, Object> map, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("order.selectMyOrderCount", map);
	}

	@Override
	public OrderState countOrderState(int memberNo, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("order.countOrderState",memberNo);
	}

	@Override
	public int cancelOrder(Map<String, Object> map, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.update("order.cancelOrder", map);
	}

	@Override
	public Payment cancelPort(String orderNo, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("order.cancelPort",orderNo);
	}

	@Override
	public OrderSum checkOrderToday(String today, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("order.checkOrder", today);
	}

	@Override
	public int updateSt(String merchant_id, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.update("order.updateSt", merchant_id);
	}

	@Override
	public int updateOrderSt(String orderNo, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.update("order.updateOrderSt",orderNo );
	}

	@Override
	public Coffee selectgoods(int goodsNo, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("coffee.selectHots",goodsNo);
	}

	@Override
	public int updateCart(Map<String, Object> map, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.update("cart.updateCart",map);
	}

}
