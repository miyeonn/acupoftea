package com.mycafe.myweb.user.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;


import com.mycafe.myweb.user.model.vo.BookMarkList;
import com.mycafe.myweb.user.model.vo.Bookmark;

public interface BookMarkService {

	int insertBookMark(Bookmark bk);

	Bookmark selectBookMark(Bookmark bk);

	List<BookMarkList> selectMyBookmark(int memberNo);



}
