package com.mycafe.myweb.goods.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mycafe.myweb.goods.model.vo.GoodsFile;

public interface GoodsDao {

	int enrollCafeEnd(Map param, SqlSessionTemplate session);

	int enrollCafeFiles(GoodsFile gf, SqlSessionTemplate session);

}
