package com.mycafe.myweb.coffee.model.service;

import java.util.List;
import java.util.Map;

import com.mycafe.myweb.coffee.model.vo.Coffee;
import com.mycafe.myweb.coffee.model.vo.CoffeeAndFile;

public interface CoffeeService {

	List<Coffee> searchAllCoffee();

	CoffeeAndFile selectCoffee(int coffeeNo);

	

}
