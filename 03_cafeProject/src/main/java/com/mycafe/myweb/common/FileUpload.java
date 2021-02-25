package com.mycafe.myweb.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileUpload {

	public static List<String> FileUpload(Map param, MultipartHttpServletRequest request, MultipartFile[] file) {
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/img/cafe");//실제업로드할 경로
		String fileOriginName = "";
		List<String> fileMultiName = new ArrayList<String>(); 
		for(int i=0; i<file.length; i++) {
			
				 fileOriginName = file[i].getOriginalFilename(); 
				 System.out.println("기존 파일명 : "+fileOriginName);
				 SimpleDateFormat formatter = new SimpleDateFormat("YYYYMMDD_HHMMSS_"+i);
				 Calendar now = Calendar.getInstance(); 
				 //확장자명		 
				 String extension = fileOriginName.split("\\.")[1];
				 //fileOriginName에 날짜+.+확장자명으로 저장시킴. 
				 fileOriginName = formatter.format(now.getTime())+"."+extension; 
				 System.out.println("변경된 파일명 : "+fileOriginName);
				 System.out.println("저장경로:"+uploadPath+fileOriginName);
				 
				 File f = new File(uploadPath,fileOriginName);	
				System.out.println(f);
				 try {
					//업로드 파일 저장
					file[i].transferTo(f);
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				 
				 fileMultiName.add(fileOriginName);
			}
		param.put("filePath", uploadPath);
	
		System.out.println("파일이름:"+fileMultiName);
		
		
		return fileMultiName;
	}
	
	
	
}
