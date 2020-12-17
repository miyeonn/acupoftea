package com.mycafe.myweb.user.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycafe.myweb.user.model.dao.UserDao;
import com.mycafe.myweb.user.model.vo.JoinUser;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	
	@Override
	public int joinUserEnd(Map param) {
		// TODO Auto-generated method stub
		return dao.joinUserEnd(param,session);
	}


	@Override
	public JoinUser checkUserId(String userId) {
		// TODO Auto-generated method stub
		return dao.checkUserId(userId,session);
	}


	@Override
	public JoinUser selectUser(String id) {
		// TODO Auto-generated method stub
		return dao.selectUser(id,session);
	}


	@Override
	public String selectAdmin() {
		// TODO Auto-generated method stub
		return dao.selectAdmin(session);
	}


	@Override
	public JoinUser getUserByNo(int memberNo) {
		// TODO Auto-generated method stub
		return dao.getUserByNo(session,memberNo);
	}

}
