package com.mycafe.myweb.user.model.service;

import java.util.ArrayList;
import java.util.List;

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
		List<BookMarkList> list=new ArrayList<BookMarkList>(); 
		List<BookMarkList> bklist=new ArrayList<BookMarkList>(); 
		
		list=dao.selectMyBookmark(session,memberNo);
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getCafe_no()==0) {
				//goods가서 join
				bklist.addAll(dao.selectGoodsList(session,memberNo));
			}else {
				//cafe가서 join
				bklist.addAll(dao.selectCafeList(session,memberNo));
			}
		}
		
		return bklist;
		
	}




	@Override
	public int deleteBookMark(Bookmark bk) {
		// TODO Auto-generated method stub
		return dao.deleteBookMark(session,bk);
	}




}
