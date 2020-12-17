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
	
	
	@Scheduled(cron="0 * 10 15 12 *")//매일 오후 3시 관리자 메일로 발송
	public void scheduleRun() {
	    Calendar calendar = Calendar.getInstance();
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    System.out.println("스케줄 실행 : " + dateFormat.format(calendar.getTime()));
	    sendMail.mailSend(dateFormat.format(calendar.getTime()));
	    
	}
}
