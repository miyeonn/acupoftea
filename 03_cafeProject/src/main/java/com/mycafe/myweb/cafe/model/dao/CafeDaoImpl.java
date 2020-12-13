package com.mycafe.myweb.cafe.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycafe.myweb.cafe.model.vo.Cafe;
import com.mycafe.myweb.cafe.model.vo.CafeAndFile;

@Repository
public class CafeDaoImpl implements CafeDao{

	@Override
	public List searchColor(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("cafe.selectColor");
	}

	@Override
	public List<Cafe> selectCafeAll(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("cafe.selectCafeAll");
	}

	@Override
	public CafeAndFile cafeDetail(SqlSessionTemplate session, int cafeNo) {
		// TODO Auto-generated method stub
		return session.selectOne("cafe.selectCafeDetail", cafeNo);
	}

	@Override
	public List<String> cafeFiles(SqlSessionTemplate session, int cafeNo) {
		// TODO Auto-generated method stub
		return session.selectList("cafe.selectCafeFiles",cafeNo);
	}

	@Override
	public List<Cafe> resentCafe(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("cafe.selectResentCafe");
	}

}
