package com.mycafe.myweb.user.model.dao;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;

import com.mycafe.myweb.user.model.vo.BookMarkCafe;

public interface BookMarkDao {

	int insertBookMark(BookMarkCafe bk, SqlSessionTemplate session);

	BookMarkCafe selectBookmark(BookMarkCafe bk, SqlSessionTemplate session);

}
