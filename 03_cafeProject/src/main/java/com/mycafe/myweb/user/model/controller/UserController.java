package com.mycafe.myweb.user.model.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.mycafe.myweb.user.model.service.BookMarkService;
import com.mycafe.myweb.user.model.service.UserService;
import com.mycafe.myweb.user.model.vo.BookMarkCafe;
import com.mycafe.myweb.user.model.vo.JoinUser;

@Controller
@SessionAttributes({"loginUser"})
public class UserController {

	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Autowired
	private UserService service;
	
	@Autowired
	private BookMarkService bkService;
	
	@RequestMapping("/user/login")
	private String loginPage() {
		return "user/login";
	}
	
	@RequestMapping("/user/myPage")
	public String myPage() {
		return "user/myPage";
	}
	
	@RequestMapping("/user/joinUser")
	public String joinUser() {
		
		return "user/joinUser";
	}
	@RequestMapping("/user/jusoPopup")
	public String jusoPopup() {
		
		return "user/jusoPopup";
	}

	@RequestMapping("/user/joinUserEnd")
	public String joinUserEnd(@RequestParam Map param,Model m) {
		System.out.println("암호화 전:"+param.get("userPw"));
		System.out.println("모든내용"+param);
		String pw=(String)param.get("userPw");
		pw=encoder.encode(pw);
		param.put("userPw",pw);
		System.out.println("암호화 후:"+param.get("userPw"));
		
		int result=service.joinUserEnd(param);
		
		String page = "common/msg";
		
		if(result==0) {
			m.addAttribute("msg", "회원가입실패! 다시 시도해주세요!");
			m.addAttribute("loc", "/user/joinUser");
		}else {
			m.addAttribute("msg", "회원가입성공!");
			m.addAttribute("loc", "/");
		}
		return page;
		
		
		
	}
	
	//아이디 중복체크
	@RequestMapping("/user/checkId")
	public @ResponseBody Map<String, Object> checkUserId(String userId) {
		
		System.out.println("아이디:"+userId);
		JoinUser u=service.checkUserId(userId);
		
		
		boolean flag=u!=null?false:true;
		System.out.println("flag:"+flag);
		Map<String,Object> map=new HashMap();
		map.put("JoinUser", u);
		map.put("flag",flag);
		
		//mv.addObject("flag", flag);
		//mv.setViewName("jsonView");
		return map;
	}
	
	//로그인 
	@RequestMapping("/user/loginEnd")
	public String login(String id,String password,HttpSession session,HttpServletRequest req,Model m) {
		
		System.out.println("들어옴"+id);
		JoinUser login = service.selectUser(id);
		
		System.out.println("pw:"+password+"dbPw:"+login.getPassword());
		
		String page = "";
		if(login!=null&&encoder.matches(password, login.getPassword())) {	
			/* 세션 생성 */
			session = req.getSession();
			session.setAttribute("loginUser", login);
			page="common/msg";
			m.addAttribute("loginUser",login);
			m.addAttribute("msg", "환영합니다!");
			m.addAttribute("loc", "/");
			
		}else {
			page = "common/msg";
			m.addAttribute("msg", "아이디나 비밀번호가 다릅니다.");
			m.addAttribute("loc", "/user/login");
		}
		return page;
	}
	
	//로그아웃
	
	@RequestMapping("/user/logout")
	public String logout(SessionStatus status, HttpSession session) {
		
		if(!status.isComplete()) {
			status.setComplete();
		}
		
		
		return "redirect:/";
	} 
	
	
	//내정보 관리 비밀번호 입력
	@RequestMapping("/user/myInfo")
	public String enterMyInfo(String pw) {
		
		
		  return "user/myInfo";
	}
	
	@RequestMapping("/user/myBookmark")
	public String enterMyBookmark(String pw) {
		
		
		  return "user/myBookmark";
	}

	
	@RequestMapping("/user/myInfoModify")
	public String entermyInfoModify(String pw) {
		
		
		  return "user/myInfoModify";
	}
	//북마크에 넣기
	
	  @RequestMapping("/user/insertBookMark") 
	  public @ResponseBody int insertBookMark(HttpServletRequest request){
	  
	  System.out.println("카페번호:"+request.getParameter("cafeNo"));
	  
	  BookMarkCafe bk=new BookMarkCafe();
	  bk.setCafe_no(Integer.parseInt(request.getParameter("cafeNo")));
	  bk.setMember_no(Integer.parseInt(request.getParameter("userNo")));
	  
	  
	  int result=bkService.insertBookMark(bk);
	  
	  	ModelAndView mv=new ModelAndView();
		
		mv.setViewName("jsonView"); 
	  	return result;
	  }
	 
	
	
	
	
	
	//북마크에 있는지 찾기
	
	 @RequestMapping("/user/selectBookMark") 
	 public @ResponseBody ModelAndView selectBookMark(HttpServletRequest request){
	  
	  BookMarkCafe bk=new BookMarkCafe();
	  ModelAndView mv=new ModelAndView();
	  bk.setCafe_no(Integer.parseInt(request.getParameter("cafeNo")));
	  bk.setMember_no(Integer.parseInt(request.getParameter("userNo")));
	  
	  bk=bkService.selectBookMark(bk);
	  
	  
	  boolean flag=bk!=null?false:true; System.out.println("flag:"+flag);
	  
	  
	  mv.addObject("flag", flag); 
	  mv.setViewName("jsonView"); 
	  return mv; 
	  }
	 
	
	
	

}
