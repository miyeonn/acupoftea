package com.mycafe.myweb.user.model.vo;

import com.fasterxml.jackson.annotation.JsonAutoDetect;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonAutoDetect
public class JoinUser {

	private int member_no;
	private String member_id;
	private String password;
	private String address;
	private String phone;
	private String username;
	
	
}
