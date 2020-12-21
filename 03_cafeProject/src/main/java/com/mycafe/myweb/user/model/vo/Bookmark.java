package com.mycafe.myweb.user.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Bookmark {
	
	
	private int member_no;
	private int cafe_no;
	private int goods_no;

}
