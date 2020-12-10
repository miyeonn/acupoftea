package com.mycafe.myweb.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mycafe.myweb.admin.model.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	
	@RequestMapping("/admin/adminPage")
	public String enterAdminPage(){
		
		
		return "admin/adminPage";
	}
	@RequestMapping("/admin/enrollCafe")
	public String enterEnrollCafe() {
		
		return "admin/enrollCafe";
	}
	@RequestMapping("/admin/enrollgoods")
	public String enterEnrollGoods() {
	
		
		return "/admin/enrollgoods";
	}
	@RequestMapping("/admin/enrollCafeEnd")
	public String enrollCafeEnd(Model m,@RequestParam Map param,MultipartHttpServletRequest request,HttpSession session, @RequestParam("upFile") MultipartFile[] file) {
		
		System.out.println("파일 들어옴"+file);
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/img/cafe");//실제업로드할 경로
		String path=session.getServletContext().getRealPath("/resources/img/cafe");
		System.out.println("세션 주소:"+path);
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
	
		int result=service.enrollCafeEnd(param,fileMultiName);
		String page = "common/msg";
		
		if(result==0) {
			m.addAttribute("msg", "카페등록실패. 다시 시도해주세요!");
			m.addAttribute("loc", "/admin/enrollCafe");
		}else {
			m.addAttribute("msg", "카페등록 성공");
			m.addAttribute("loc", "/cafe/searchCafe");
		}
		return page;
	}


}

