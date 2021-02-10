package com.mycafe.myweb.user.model.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;


import com.mycafe.myweb.user.model.vo.BookMarkList;
import com.mycafe.myweb.user.model.vo.Bookmark;

public interface BookMarkDao {

	int insertBookMark(Bookmark bk, SqlSessionTemplate session);

	Bookmark selectBookmark(Bookmark bk, SqlSessionTemplate session);

	List<BookMarkList> selectMyBookmark(SqlSessionTemplate session, int memberNo);

	int deleteBookMark(SqlSessionTemplate session, Bookmark bk);

	List<BookMarkList> selectGoodsList(SqlSessionTemplate session, int memberNo);

	List<BookMarkList> selectCafeList(SqlSessionTemplate session, int memberNo);


}
