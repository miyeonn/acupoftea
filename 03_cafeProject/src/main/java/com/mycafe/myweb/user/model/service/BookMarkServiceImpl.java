package com.mycafe.myweb.user.model.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycafe.myweb.user.model.dao.BookMarkDao;
import com.mycafe.myweb.user.model.vo.BookMarkCafe;

@Service
public class BookMarkServiceImpl implements BookMarkService {

	@Autowired
	private BookMarkDao dao;
	
	@Autowired
	private SqlSessionTemplate session;


	@Override
	public int insertBookMark(BookMarkCafe bk) {
		// TODO Auto-generated method stub
		return dao.insertBookMark(bk,session);
	}


	@Override
	public BookMarkCafe selectBookMark(BookMarkCafe bk) {
		// TODO Auto-generated method stub
		return dao.selectBookmark(bk,session);
	}

}
