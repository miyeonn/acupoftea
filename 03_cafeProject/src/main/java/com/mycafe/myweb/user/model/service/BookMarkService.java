package com.mycafe.myweb.user.model.service;

import javax.servlet.http.HttpServletRequest;

import com.mycafe.myweb.user.model.vo.BookMarkCafe;

public interface BookMarkService {

	int insertBookMark(BookMarkCafe bk);

	BookMarkCafe selectBookMark(BookMarkCafe bk);

}
