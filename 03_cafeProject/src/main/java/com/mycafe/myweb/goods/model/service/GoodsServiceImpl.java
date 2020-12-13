package com.mycafe.myweb.goods.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycafe.myweb.coffee.model.dao.CoffeeDao;
import com.mycafe.myweb.goods.model.dao.GoodsDao;
import com.mycafe.myweb.goods.model.vo.GoodsFile;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsDao dao;
	
	@Autowired
	private CoffeeDao coffeeDao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int enrollGoodsEnd(Map param, List<String> fileMultiName) {
		// TODO Auto-generated method stub
		int result=0;
		int goodsResult=dao.enrollCafeEnd(param, session);
		System.out.println("현재 goodsNo:"+param.get("goodsNo"));
		int goodsNo=Integer.parseInt(String.valueOf(param.get("goodsNo")));
		if(goodsResult>0) {
		GoodsFile gf=new GoodsFile();
		//상품파일 테이블에 들어갈 객체 설정
		gf.setFile_path((String) param.get("filePath"));
		gf.setGoods_no(goodsNo);
		
		for(int i=0;i<fileMultiName.size();i++) {
			gf.setFile_name(fileMultiName.get(i));
			result=dao.enrollCafeFiles(gf,session);
			System.out.println("상품파일:"+result);
			}
			param.put("mainImage", fileMultiName.get(0));
		}
		if(result>0) {
			coffeeDao.enrollGoodsCoffee(session, param);
			
		}
		
		return result;
	}

}
