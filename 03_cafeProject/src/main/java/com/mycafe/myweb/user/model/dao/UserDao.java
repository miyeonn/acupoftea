package com.mycafe.myweb.user.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mycafe.myweb.user.model.vo.JoinUser;

public interface UserDao {

	int joinUserEnd(Map param,SqlSessionTemplate session);

	JoinUser checkUserId(String userId, SqlSessionTemplate session);

	JoinUser selectUser(String id, SqlSessionTemplate session);

	String selectAdmin(SqlSessionTemplate session);

	JoinUser getUserByNo(SqlSessionTemplate session, int memberNo);

	

	int insertKakaoUser(JoinUser u, SqlSessionTemplate session);

}
