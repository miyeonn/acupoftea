package com.mycafe.myweb.user.model.dao;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycafe.myweb.user.model.vo.BookMarkCafe;

@Repository
public class BookMarkDaoImpl implements BookMarkDao {


	@Override
	public int insertBookMark(BookMarkCafe bk, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.insert("bookMark.insertBookMark",bk);
	}

	@Override
	public BookMarkCafe selectBookmark(BookMarkCafe bk, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		
		
		
		return session.selectOne("bookMark.selectBookMark", bk);
	}

}
