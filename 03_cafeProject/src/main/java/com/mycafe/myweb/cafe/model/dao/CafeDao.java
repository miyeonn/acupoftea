package com.mycafe.myweb.cafe.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.mycafe.myweb.cafe.model.vo.Cafe;

public interface CafeDao {

	List searchColor(SqlSessionTemplate session);

}
