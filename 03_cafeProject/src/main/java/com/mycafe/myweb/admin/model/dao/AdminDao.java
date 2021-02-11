package com.mycafe.myweb.admin.model.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mycafe.myweb.admin.model.vo.CafeFile;
import com.mycafe.myweb.order.model.vo.OrderList;

public interface AdminDao {

	int enrollCafeEnd(Map param, SqlSessionTemplate session);

	int enrollCafeFiles(CafeFile cf, SqlSessionTemplate session);

	List<OrderList> checkStock(SqlSessionTemplate session);

	List<OrderList> orderByDate(Map<String, String> dateMap, SqlSessionTemplate session);

}
