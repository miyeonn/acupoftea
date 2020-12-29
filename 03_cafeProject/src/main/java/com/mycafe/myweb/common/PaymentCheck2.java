package com.mycafe.myweb.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;



public class PaymentCheck2 {

	public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken"; 
	public static final String IMPORT_PAYMENTINFO_URL = "https://api.iamport.kr/payments/find/"; 
	public static final String IMPORT_CANCEL_URL = "https://api.iamport.kr/payments/cancel"; 
	public static final String IMPORT_PREPARE_URL = "https://api.iamport.kr/payments/prepare"; 
	public static final String KEY = "1691411943881289"; 
	public static final String SECRET = "viv7heutRrAgzMfY56MdnCbuxuGrvLP03l8lzCOq4pHDcWCh3pvq1GVzbB0GnQHrbPMLsBcw0TacQNuT"; 
	
	// 아임포트 인증(토큰)을 받아주는 함수 
	public static String getImportToken() throws IOException, ParseException { 
		URL url=new URL(IMPORT_TOKEN_URL);//해당url에연결
		HttpURLConnection conn=(HttpURLConnection)url.openConnection();
		conn.setRequestMethod("POST");
		//url 헤더값 설정
		conn.setRequestProperty("Content-Type","application/x-www-form-urlencoded;charset=UTF-8" );
		conn.setDoInput(true);//값 받아옴
		conn.setDoOutput(true);//값 보냄
		
		// url에 보낼 값 설정
		Map<String,String> param=new HashMap<>();
		
		param.put("imp_key", KEY);
		param.put("imp_secret",SECRET);//db에 저장된값 가져옴
		
		String stringParams=new String();
		for(Map.Entry<String, String> str:param.entrySet()) {
			stringParams+=(str.getKey()+"="+str.getValue()+"&");
		}
		
		conn.getOutputStream().write(stringParams.getBytes());
		BufferedReader response=new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		//응답받은것이 json형식이니까 변환해줌
		JSONParser parser=new JSONParser();
		JSONObject obj=(JSONObject)parser.parse(response);
		String token=(String) ((JSONObject)obj.get("response")).get("access_token");
		
		System.out.println("토큰 추출완료:"+token);
		return token; //토큰 리턴
		}
	
	// 결제취소 
	public static String cancelPayment(String token,String imp_uid) throws IOException, ParseException {
		URL url=new URL(IMPORT_CANCEL_URL);//해당url에연결
		HttpURLConnection conn=(HttpURLConnection)url.openConnection();
		conn.setRequestMethod("POST");
		//url 헤더값 설정
		conn.setRequestProperty("Authorization",token );
		conn.setRequestProperty("Content-Type","application/x-www-form-urlencoded;charset=UTF-8" );
		conn.setDoInput(true);//값 받아옴
		conn.setDoOutput(true);//값 보냄
		
		// url에 보낼 값 설정
		Map<String,String> param=new HashMap<>();
		
		param.put("reason", "테스트 결제 환불");
		param.put("imp_uid",imp_uid);//db에 저장된값 가져옴
		
		String stringParams=new String();
		for(Map.Entry<String, String> str:param.entrySet()) {
			stringParams+=(str.getKey()+"="+str.getValue()+"&");
		}
		
		conn.getOutputStream().write(stringParams.getBytes());
		BufferedReader response=new BufferedReader(new InputStreamReader(conn.getInputStream()));
		//응답받은것이 json형식이니까 변환해줌
		JSONParser parser=new JSONParser();
		JSONObject obj=(JSONObject)parser.parse(response);
		System.out.println("환불요청 응답값:"+obj);
		if((int)obj.get("code")==-1) {
			
			return "환불실패"; 
			
		}else {
		String rsp=(String)((JSONObject)obj.get("response")).get("merchant_uid");
		System.out.println("merchant_uid"+rsp);
		//merchant id 넘겨서
		
			
		
			return rsp;
		}
	}
	
}
