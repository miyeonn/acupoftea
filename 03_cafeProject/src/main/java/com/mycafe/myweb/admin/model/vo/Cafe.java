package com.mycafe.myweb.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cafe {

	private int cafe_No;
	private String cafe_title;
	private String cafe_address;
	private String cafe_hours;
	private String cafe_page;
	private String cafe_tel;
}
