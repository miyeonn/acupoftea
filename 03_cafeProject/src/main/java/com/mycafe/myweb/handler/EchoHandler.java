package com.mycafe.myweb.handler;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.mycafe.myweb.user.model.vo.JoinUser;

public class EchoHandler extends TextWebSocketHandler {

	// 로그인중인 개별유저
		Map<String, WebSocketSession> users = new HashMap<String, WebSocketSession>();
		
		
		// 클라이언트가 서버로 연결시
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			String senderId=getMemberId(session);//로그인한 아이디 찾음
			users.put(senderId, session);
			
		}
		// db에 order가 insert될경우(웹소켓 서버단에 메시지가 도착했을때
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			String senderId=getMemberId(session);
			//프로토콜: 새로운 주문이 들어왔습니다.
			
			
			String msg=message.getPayload();
			
			if(msg != null) {
				String[] strs = msg.split(",");
				log(strs.toString());
				if(strs != null && strs.length == 3) {
					String type = strs[0];//관리자
					String target = strs[1]; // member_id 저장
					String url = strs[2];
					//String url = strs[3];//주문내역페이지
					WebSocketSession targetSession = users.get(target);  // 메시지를 받을 세션 조회
					
					// 실시간 접속시
					if(targetSession!=null) {
						TextMessage tmpMsg = new TextMessage(type+"<a href='"+ url +"'> 새로운 주문이 들어왔습니다 </a>" );
						targetSession.sendMessage(tmpMsg);
					}
				}
			
			}
		}
		// 웹소켓 연결 해제될 때
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			
			String senderId = getMemberId(session);
			if(senderId!=null) {	// 로그인 값이 있는 경우만
				log(senderId + " 연결 종료됨");
				users.remove(senderId);
			}
			
		}
		// 에러 발생시
		@Override
		public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
			log(session.getId() + " 익셉션 발생: " + exception.getMessage());

		}
		// 로그 메시지
		private void log(String logmsg) {
			System.out.println(new Date() + " : " + logmsg);
		}
		// 웹소켓에 id 가져오기
	    // 접속한 유저의 http세션을 조회하여 id를 가져옴!
		private String getMemberId(WebSocketSession session) {
			//로그인을 했으면 로그인한 유저의 아이디, 안했으면 웹소켓 세션의 아이디를 줌
			Map<String, Object> httpSession = session.getAttributes();
			JoinUser user = (JoinUser) httpSession.get("loginUser"); // 세션에 저장된 m_id 기준 조회
			if(user==null)
				return session.getId();
			else
				return user.getMember_id();
			
		}
}
