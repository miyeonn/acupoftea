package com.mycafe.myweb.cafe.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycafe.myweb.cafe.model.dao.CafeDao;
import com.mycafe.myweb.cafe.model.vo.Cafe;

@Service
public class CafeServiceImpl implements CafeService {
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private CafeDao dao;

	@Override
	public List searchColor() {
		// TODO Auto-generated method stub
		return dao.searchColor(session);
	}
}
