package com.mycafe.myweb.coffee.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mycafe.myweb.coffee.model.vo.Coffee;
import com.mycafe.myweb.coffee.model.vo.CoffeeAndFile;

public interface CoffeeDao {

	List<Coffee> searchAllCoffee(SqlSessionTemplate session);

	int enrollGoodsCoffee(SqlSessionTemplate session, Map param);

	CoffeeAndFile selectCoffee(int coffeeNo,SqlSessionTemplate session);

	List<String> coffeeFiles(SqlSessionTemplate session, int coffeeNo);

	List<Integer> selectHot(SqlSessionTemplate session);

	Coffee selectHots(SqlSessionTemplate session,int i);

}
