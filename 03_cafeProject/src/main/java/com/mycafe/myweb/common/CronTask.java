package com.mycafe.myweb.common;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;



@Component
public class CronTask {
	
	@Autowired
	private SendOrderMail sendMail;
	
	
	@Scheduled  (cron="0 12 15 10 * *")//매일 -일 - 시 - 분-//매일 오후 3시 관리자 메일로 발송@Scheduled(cron="0 0/2 * * * *")
	public void scheduleRun() {
	    Calendar calendar = Calendar.getInstance();
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM/dd");
	    String today=dateFormat.format(calendar.getTime());
	    System.out.println("스케줄 실행 : " + today);
	    sendMail.mailSend(today);
	    
	}
	

}
