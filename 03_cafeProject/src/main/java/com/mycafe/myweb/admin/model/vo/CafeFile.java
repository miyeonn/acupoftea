package com.mycafe.myweb.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CafeFile {

	private int cf_no;
	private int cafe_no;
	private String file_Path;
	private String file_Name;
	
}
