package com.mycafe.myweb.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class KakaoApi {

	public static final String GET_CODE_URL = "https://kauth.kakao.com/oauth/authorize"; 
	public static final String REST_API_KEY = "cf5b9fd1cb60e6993fa30f26c72a8478";
	//public static final String 
	
	//인증코드를 발급받는 함수
	public static String getCode() throws IOException, ParseException {
		URL url=new URL(GET_CODE_URL);//해당url에연결
		HttpURLConnection conn=(HttpURLConnection)url.openConnection();
		conn.setRequestMethod("POST");
		//url 헤더값 설정
		conn.setRequestProperty("Content-Type","application/x-www-form-urlencoded;charset=UTF-8" );
		conn.setDoInput(true);//값 받아옴
		conn.setDoOutput(true);//값 보냄
		
		// url에 보낼 값 설정
		Map<String,String> param=new HashMap<>();
		
		param.put("client_id", REST_API_KEY);
		param.put("redirect_uri","https://localhost:8080/kakaoLogin");//db에 저장된값 가져옴
		
		String stringParams=new String();
		for(Map.Entry<String, String> str:param.entrySet()) {
			stringParams+=(str.getKey()+"="+str.getValue()+"&");
		}
		
		conn.getOutputStream().write(stringParams.getBytes());
		BufferedReader response=new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		//응답받은것이 json형식이니까 변환해줌
		JSONParser parser=new JSONParser();
		JSONObject obj=(JSONObject)parser.parse(response);
		String code=(String) ((JSONObject)obj.get("response")).get("code");
		
		System.out.println("코드 추출완료:"+code);
		return code; //코드 리턴

	}
	
	
	
	
	
	
	
}
