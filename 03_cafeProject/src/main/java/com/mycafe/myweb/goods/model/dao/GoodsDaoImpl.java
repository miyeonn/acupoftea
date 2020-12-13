package com.mycafe.myweb.goods.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycafe.myweb.goods.model.vo.GoodsFile;

@Repository
public class GoodsDaoImpl implements GoodsDao {

	@Override
	public int enrollCafeEnd(Map param, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.insert("goods.enrollGoods",param);
	}

	@Override
	public int enrollCafeFiles(GoodsFile gf, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.insert("goods.enrollGoodsFiles", gf);
	}

}
