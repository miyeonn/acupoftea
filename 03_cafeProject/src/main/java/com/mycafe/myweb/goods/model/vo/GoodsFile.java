package com.mycafe.myweb.goods.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GoodsFile {

	private int gf_no;
	private int goods_no;
	private String file_path;
	private String file_name;
	
	
}
