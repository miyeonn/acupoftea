package com.mycafe.myweb.coffee.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycafe.myweb.coffee.model.dao.CoffeeDao;
import com.mycafe.myweb.coffee.model.vo.Coffee;
import com.mycafe.myweb.coffee.model.vo.CoffeeAndFile;

@Service
public class CoffeeServiceImpl implements CoffeeService {
	
	@Autowired
	private CoffeeDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Coffee> searchAllCoffee() {
		// TODO Auto-generated method stub
		return dao.searchAllCoffee(session);
	}

	@Override
	public CoffeeAndFile selectCoffee(int coffeeNo) {
		// TODO Auto-generated method stub
			CoffeeAndFile cf=dao.selectCoffee(coffeeNo,session);
			cf.setFile_Names(dao.coffeeFiles(session,coffeeNo));
			
		return cf;
	}

	@Override
	public List<Coffee> selectHot() {
		// TODO Auto-generated method stub
		List<Coffee> list=new ArrayList<Coffee>();
		List<Integer> goodsNos=dao.selectHot(session);
		for(int i=0;i<goodsNos.size();i++) {
			
			Coffee c=dao.selectHots(session,goodsNos.get(i));
			list.add(c);
		}
		
		
		return list;
	}






	


}
