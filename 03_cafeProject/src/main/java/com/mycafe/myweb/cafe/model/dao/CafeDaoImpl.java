package com.mycafe.myweb.cafe.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycafe.myweb.cafe.model.vo.Cafe;

@Repository
public class CafeDaoImpl implements CafeDao{

	@Override
	public List searchColor(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("cafe.selectColor");
	}

}
