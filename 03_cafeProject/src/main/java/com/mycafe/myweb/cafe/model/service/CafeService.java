package com.mycafe.myweb.cafe.model.service;

import java.util.List;


import com.mycafe.myweb.cafe.model.vo.Cafe;
import com.mycafe.myweb.cafe.model.vo.CafeAndFile;

public interface CafeService {

	List searchColor();

	List<Cafe> selectCafeAll();

	CafeAndFile cafeDetail(int cafeNo);

	List<Cafe> resentCafe();

}
