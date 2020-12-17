package com.mycafe.myweb.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Component;

@Component
public class PaymentCheck {

	public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
	public static final String IMPORT_PAYMENTINFO_URL = "https://api.iamport.kr/payments/find/";
	public static final String IMPORT_CANCEL_URL = "https://api.iamport.kr/payments/cancel";
	public static final String IMPORT_PREPARE_URL = "https://api.iamport.kr/payments/prepare";
	
	public static final String KEY = "아임포트 Rest Api key";
	public static final String SECRET = "아임포트 Rest Api Secret";
	
	public static String getToken(HttpServletRequest request,HttpServletResponse response,JSONObject json) throws Exception{
		// requestURL은 아임포트 고유키, 시크릿 키 정보를 포함하는 url 정보 

		String _token = "";

		try{

			String requestString = "";

			URL url = new URL(IMPORT_TOKEN_URL);

			HttpURLConnection connection = (HttpURLConnection) url.openConnection();//해당 url로 페이지 정보 가져옴

			connection.setDoOutput(true); //url연결이 출력용인경우 outputtrue -입력용인경우 input true	

			connection.setInstanceFollowRedirects(false);  

			connection.setRequestMethod("POST");//post형식 요청방식

			connection.setRequestProperty("Content-Type", "application/json"); //json형식으로 전송.

			OutputStream os= connection.getOutputStream(); //출력 스트림 생성

			os.write(json.toString().getBytes()); //string을 byte 코드로 변경

			connection.connect(); //네트워크상의 다른곳과 연결

			StringBuilder sb = new StringBuilder(); 

			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {

				BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));

			

				String line = null;  

				while ((line = br.readLine()) != null) {  

					sb.append(line + "\n");  

				}

				br.close();

				requestString = sb.toString();

			

			}

			os.flush();

			connection.disconnect();

			

			JSONParser jsonParser = new JSONParser();

			JSONObject jsonObj = (JSONObject) jsonParser.parse(requestString);

			

			if((Long)jsonObj.get("code")  == 0){

				JSONObject getToken = (JSONObject) jsonObj.get("response");

				System.out.println("getToken==>>"+getToken.get("access_token") );

				_token = (String)getToken.get("access_token");

			}

			

		}catch(Exception e){

			e.printStackTrace();

			_token = "";

		}

		return _token;

	}
}


