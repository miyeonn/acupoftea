package com.mycafe.myweb.cafe.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CafeAndFile {

	private int cafe_No;
	private String cafe_title;
	private String cafe_address;
	private String cafe_hours;
	private String cafe_page;
	private String cafe_tel;
	private int cf_no;
	private String file_Path;
	private String file_Name;
	
	
}
