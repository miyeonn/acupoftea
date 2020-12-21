package com.mycafe.myweb.coffee.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycafe.myweb.coffee.model.vo.Coffee;
import com.mycafe.myweb.coffee.model.vo.CoffeeAndFile;

@Repository
public class CoffeeDaoImpl implements CoffeeDao {

	@Override
	public List<Coffee> searchAllCoffee(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("coffee.selectCafeAll");
	}

	@Override
	public int enrollGoodsCoffee(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("coffee.enrollGoodsCoffee", param);
	}

	@Override
	public CoffeeAndFile selectCoffee(int coffeeNo,SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("coffee.selectCoffee", coffeeNo);
	}

	@Override
	public List<String> coffeeFiles(SqlSessionTemplate session, int coffeeNo) {
		// TODO Auto-generated method stub
		return session.selectList("coffee.selectFiles",coffeeNo);
	}

	@Override
	public List<Integer> selectHot(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		
			
		return session.selectList("coffee.selectHot");
	}

	@Override
	public Coffee selectHots(SqlSessionTemplate session,int goodsNo) {
		// TODO Auto-generated method stub
		return session.selectOne("coffee.selectHots",goodsNo);
	}

}
