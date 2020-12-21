package com.mycafe.myweb.admin.model.service;

import java.util.List;
import java.util.Map;

import com.mycafe.myweb.order.model.vo.OrderList;

public interface AdminService {

	int enrollCafeEnd(Map param, List<String> fileMultiName);

	List<OrderList> checkStock();

}
