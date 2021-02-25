package com.mycafe.myweb.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class KakaoApi {

	public static final String kakaoAuthUrl = "https://kauth.kakao.com"; 
	public static final String kakaoApiKey = "cf5b9fd1cb60e6993fa30f26c72a8478";
	public static final String redirectUrl="http://localhost:8080/myweb/kakaologin";
	
	@RequestMapping("/login/getKakaoAuthUrl")
	public static String getKakaoAuthUrl(HttpSession session) {
		//사용자의 인증코드 받기
		String reqUrl =kakaoAuthUrl+"/oauth/authorize?client_id="+kakaoApiKey+"&redirect_uri="+redirectUrl+"&response_type=code";
										
		System.out.println(reqUrl);
		return reqUrl;
		
	}
	
	//토큰값 받기
	public static JsonNode getAccessToken(String autorize_code) { 
		
		final String RequestUrl = "https://kauth.kakao.com/oauth/token"; 
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>(); 
		
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code")); 
		postParams.add(new BasicNameValuePair("client_id", kakaoApiKey)); // REST API KEY 
		postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:8080/myweb/kakaologin")); // 리다이렉트 URI
		postParams.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정중 얻은 code 값 
		
		final HttpClient client = HttpClientBuilder.create().build(); 
		final HttpPost post = new HttpPost(RequestUrl); 
		JsonNode returnNode = null; 
			try { 
				
				post.setEntity(new UrlEncodedFormEntity(postParams)); 
				final HttpResponse response = client.execute(post); // JSON 형태 반환값 처리
				ObjectMapper mapper = new ObjectMapper(); 
				returnNode = mapper.readTree(response.getEntity().getContent()); 
				
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace(); 
			} catch (ClientProtocolException e) { 
				e.printStackTrace(); 
			} catch (IOException e) { 
				e.printStackTrace(); } 
			finally { 
			// clear resources 
				} 
			return returnNode; 
		}
		
	
	public static JsonNode getKakaoUserInfo(JsonNode accessToken) { 
		final String RequestUrl = "https://kapi.kakao.com/v2/user/me"; 
		final HttpClient client = HttpClientBuilder.create().build(); 
		final HttpPost post = new HttpPost(RequestUrl); 
		// add header 
		post.addHeader("Authorization", "Bearer " + accessToken); 
		JsonNode returnNode = null; 
		  try { 
			final HttpResponse response = client.execute(post); // JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper(); 
			returnNode = mapper.readTree(response.getEntity().getContent()); 
			} catch (ClientProtocolException e) { 
				e.printStackTrace(); 
			} catch (IOException e) { 
				e.printStackTrace(); 
				} finally {
					// clear resources 
					} 
			return returnNode; 
				
		}
	



	
	
	
	
	
	
	
	
}
