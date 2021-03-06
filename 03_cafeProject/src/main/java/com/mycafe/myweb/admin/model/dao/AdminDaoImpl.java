package com.mycafe.myweb.admin.model.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycafe.myweb.admin.model.vo.CafeFile;
import com.mycafe.myweb.order.model.vo.OrderList;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Override
	public int enrollCafeEnd(Map param, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.insert("admin.enrollCafe", param);
	}

	@Override
	public int enrollCafeFiles(CafeFile cf, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.insert("admin.enrollCafeFiles",cf);
	}

	@Override
	public List<OrderList> checkStock(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.checkStock");
	}

	@Override
	public List<OrderList> orderByDate(Map<String, String> dateMap, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.orderByDate",dateMap);
	}

}
