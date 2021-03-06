package com.mycafe.myweb.user.model.service;

import java.util.Map;

import com.mycafe.myweb.user.model.vo.JoinUser;

public interface UserService {

	int joinUserEnd(Map param);

	JoinUser checkUserId(String userId);

	JoinUser selectUser(String id);

	String selectAdmin();

	JoinUser getUserByNo(int memberNo);

	JoinUser kakaoLogin(JoinUser u);

}
