package com.mycafe.myweb.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycafe.myweb.admin.model.dao.AdminDao;
import com.mycafe.myweb.admin.model.vo.CafeFile;
import com.mycafe.myweb.order.model.vo.OrderList;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	

	@Override
	public int enrollCafeEnd(Map param, List<String> fileMultiName) {
		// TODO Auto-generated method stub
		int result=0;
		int cafeResult=dao.enrollCafeEnd(param, session);
		System.out.println("현재 cafeNo:"+param.get("cafeNo"));
		int cafeNo=Integer.parseInt(String.valueOf(param.get("cafeNo")));
		if(cafeResult>0) {
		CafeFile cf=new CafeFile();
		//카페파일 테이블에 들어갈 객체 설정
		cf.setFile_Path((String) param.get("filePath"));
		cf.setCafe_no(cafeNo);
		
		for(int i=0;i<fileMultiName.size();i++) {
			cf.setFile_Name(fileMultiName.get(i));
			result=dao.enrollCafeFiles(cf,session);
			System.out.println("카페파일:"+result);
			}
		}
		return result;
	}


	@Override
	public List<OrderList> checkStock() {
		// TODO Auto-generated method stub
		return dao.checkStock(session);
	}

}
