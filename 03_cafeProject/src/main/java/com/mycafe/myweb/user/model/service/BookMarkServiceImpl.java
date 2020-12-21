package com.mycafe.myweb.user.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycafe.myweb.user.model.dao.BookMarkDao;

import com.mycafe.myweb.user.model.vo.BookMarkList;
import com.mycafe.myweb.user.model.vo.Bookmark;

@Service
public class BookMarkServiceImpl implements BookMarkService {

	@Autowired
	private BookMarkDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertBookMark(Bookmark bk) {
		// TODO Auto-generated method stub
		return dao.insertBookMark(bk, session);
	}




	@Override
	public Bookmark selectBookMark(Bookmark bk) {
		// TODO Auto-generated method stub
		return dao.selectBookmark(bk,session);
	}


	@Override
	public List<BookMarkList> selectMyBookmark(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectMyBookmark(session,memberNo);
	}




}
