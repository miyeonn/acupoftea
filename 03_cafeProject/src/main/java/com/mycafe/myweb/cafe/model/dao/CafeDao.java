package com.mycafe.myweb.cafe.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.mycafe.myweb.cafe.model.vo.Cafe;
import com.mycafe.myweb.cafe.model.vo.CafeAndFile;

public interface CafeDao {

	List searchColor(SqlSessionTemplate session);

	List<Cafe> selectCafeAll(SqlSessionTemplate session);

	CafeAndFile cafeDetail(SqlSessionTemplate session, int cafeNo);

	List<String> cafeFiles(SqlSessionTemplate session, int cafeNo);

	List<Cafe> resentCafe(SqlSessionTemplate session);

}
