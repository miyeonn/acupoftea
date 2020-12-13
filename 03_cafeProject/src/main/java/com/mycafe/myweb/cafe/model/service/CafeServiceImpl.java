package com.mycafe.myweb.cafe.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycafe.myweb.cafe.model.dao.CafeDao;
import com.mycafe.myweb.cafe.model.vo.Cafe;
import com.mycafe.myweb.cafe.model.vo.CafeAndFile;

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

	@Override
	public List<Cafe> selectCafeAll() {
		// TODO Auto-generated method stub
		return dao.selectCafeAll(session);
	}

	@Override
	public CafeAndFile cafeDetail(int cafeNo) {
		// TODO Auto-generated method stub
		CafeAndFile cf=dao.cafeDetail(session,cafeNo);
		List<String> files=dao.cafeFiles(session,cafeNo);
		cf.setFile_Names(files);
		System.out.println("파일명:"+files);
		
		return cf;
	}

	@Override
	public List<Cafe> resentCafe() {
		// TODO Auto-generated method stub
		return dao.resentCafe(session);
	}
}
