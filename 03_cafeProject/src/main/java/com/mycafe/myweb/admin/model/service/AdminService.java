package com.mycafe.myweb.admin.model.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.mycafe.myweb.order.model.vo.OrderList;

public interface AdminService {

	int enrollCafeEnd(Map param, List<String> fileMultiName);

	List<OrderList> checkStock();

	void getExcelDown(HttpServletResponse response);

	List<OrderList> orderByDate(Map<String, String> dateMap);

}
