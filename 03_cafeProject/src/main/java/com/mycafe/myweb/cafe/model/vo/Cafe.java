package com.mycafe.myweb.cafe.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cafe {

	private int cafeNo;
	private String cafeTitle;
	private String cafeAddress;
	private String cafeColor;
	
}
