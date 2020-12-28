package com.mycafe.myweb.common;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import com.mycafe.myweb.order.model.service.OrderService;
import com.mycafe.myweb.order.model.vo.OrderSum;
import com.mycafe.myweb.user.model.service.UserService;

@Component
public class SendOrderMail {

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private OrderService service;
	
	@Autowired
	private UserService uService;
	
	public void mailSend(String today) {

		//db에서 관리자 정보 가져오기
		String tomail =uService.selectAdmin();// 받는 사람 이메일
		 System.out.println(tomail);
		  
		 //db에서 오늘 판매한 
		 Calendar calendar = Calendar.getInstance();
		 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		 String todayTitle=dateFormat.format(calendar.getTime());
		String title = todayTitle+" 판매현황"; // 
		String content = getContent(today); // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true, "UTF-8");

			messageHelper.setFrom(new InternetAddress("aldus9302@naver.com","a cup of tea", "UTF-8")); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content,true); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println("발송완료");
		
	}
	
	public String getContent(String today) {
		//변경되는 변수: 주문일자,주문건수,주문수량,금액. 주문내역관리페이지는 별도로 세팅후 추가할것!
		OrderSum result=service.checkOrderToday(today);
		System.out.println();
		String content="";
		 content+="<h1>A CUP OF TEA</h1>";
		 content+="<h5>안녕하세요 관리자님,</h5>";
		 content+="<p></p><p>"+today+" 판매수량 입니다.</p>";
		 content+="<table class='__se_tbl' border='0' cellpadding='0' cellspacing='1' style='background-color: rgb(199, 199, 199);'><tbody>";
		 content+="<tr><td style='padding: 3px 4px 2px; color: rgb(102, 102, 102); width: 151px; height: 19px; background-color: rgb(255, 255, 255);'>";
		 content+="<p>주문일자</p></td><td style='padding: 3px 4px 2px; color: rgb(102, 102, 102); width: 151px; height: 19px; background-color: rgb(255, 255, 255);'>";
		 content+="<p>주문건수</p></td><td style='padding: 3px 4px 2px; color: rgb(102, 102, 102); width: 152px; height: 19px; background-color: rgb(255, 255, 255);'>";
		 content+="<p>주문수량&nbsp;</p></td>";
		 content+="</tr>";
		 content+="<tr>";
		 content+="<td style='padding: 3px 4px 2px; color: rgb(102, 102, 102); width: 152px; height: 19px; background-color: rgb(255, 255, 255);'>"+result.getOrder_date()+"</td>";
		 content+="<td style='padding: 3px 4px 2px; color: rgb(102, 102, 102); width: 152px; height: 19px; background-color: rgb(255, 255, 255);'>"+result.getOrder_count()+"</td>";
		 content+="<td style='padding: 3px 4px 2px; color: rgb(102, 102, 102); width: 152px; height: 19px; background-color: rgb(255, 255, 255);'>"+result.getOrder_qty()+"</td>";
		 content+="</tbody>";
		 content+="</table><p></p><p><a href='http://localhost:8080/user/login' target='_blank' style='cursor: pointer; white-space: pre;' rel='noreferrer noopener'>홈페이지로 이동</a><span></span></p>";

		return content;
	}


	
}