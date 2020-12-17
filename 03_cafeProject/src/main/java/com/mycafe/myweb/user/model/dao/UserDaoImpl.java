package com.mycafe.myweb.user.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycafe.myweb.user.model.vo.JoinUser;

@Repository
public class UserDaoImpl implements UserDao {

	@Override
	public int joinUserEnd(Map param,SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.insert("user.insertUser", param);
	}

	@Override
	public JoinUser checkUserId(String userId, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("user.checkId",userId);
	}

	@Override
	public JoinUser selectUser(String id, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("user.selectUser",id);
	}

	@Override
	public String selectAdmin(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("user.selectAdmin");
	}

	@Override
	public JoinUser getUserByNo(SqlSessionTemplate session, int memberNo) {
		// TODO Auto-generated method stub
		return session.selectOne("user.selectByNo", memberNo);
	}

	

}
