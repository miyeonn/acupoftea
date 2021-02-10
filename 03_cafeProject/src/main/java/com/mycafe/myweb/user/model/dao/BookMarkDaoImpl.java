package com.mycafe.myweb.user.model.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


import com.mycafe.myweb.user.model.vo.BookMarkList;
import com.mycafe.myweb.user.model.vo.Bookmark;

@Repository
public class BookMarkDaoImpl implements BookMarkDao {


	@Override
	public int insertBookMark(Bookmark bk, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		System.out.println(bk);
		return session.insert("bookMark.insertBookMark", bk);
	}

	@Override
	public Bookmark selectBookmark(Bookmark bk, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		
		
		return session.selectOne("bookMark.selectBookMark", bk);
	}

	@Override
	public List<BookMarkList> selectMyBookmark(SqlSessionTemplate session, int memberNo) {
		// TODO Auto-generated method stub
		return session.selectList("bookMark.selectMyBookmark",memberNo);
	}

	@Override
	public int deleteBookMark(SqlSessionTemplate session, Bookmark bk) {
		// TODO Auto-generated method stub
		return session.update("bookMark.deleteBookmark",bk);
	}

	@Override
	public List<BookMarkList> selectGoodsList(SqlSessionTemplate session, int memberNo) {
		// TODO Auto-generated method stub
		return  session.selectList("bookMark.selectGoodsList",memberNo);
	}

	@Override
	public List<BookMarkList> selectCafeList(SqlSessionTemplate session, int memberNo) {
		// TODO Auto-generated method stub
		return session.selectList("bookMark.selectCafeList",memberNo);
	}




}
