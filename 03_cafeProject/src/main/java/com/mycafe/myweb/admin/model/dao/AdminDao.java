package com.mycafe.myweb.admin.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mycafe.myweb.admin.model.vo.CafeFile;

public interface AdminDao {

	int enrollCafeEnd(Map param, SqlSessionTemplate session);

	int enrollCafeFiles(CafeFile cf, SqlSessionTemplate session);

}
