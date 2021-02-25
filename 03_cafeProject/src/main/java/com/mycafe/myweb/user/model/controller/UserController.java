package com.mycafe.myweb.user.model.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.mycafe.myweb.common.KakaoApi;
import com.mycafe.myweb.user.model.service.BookMarkService;
import com.mycafe.myweb.user.model.service.UserService;
import com.mycafe.myweb.user.model.vo.BookMarkList;
import com.mycafe.myweb.user.model.vo.Bookmark;
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
	private ModelAndView loginPage(HttpSession session) {
		ModelAndView mv=new ModelAndView();
		
		//카카오 로그인 url가져오기
		String kakaoUrl=KakaoApi.getKakaoAuthUrl(session);
		
		
		mv.addObject("kakaoUrl",kakaoUrl);
		mv.setViewName("user/login");
	
		return mv;
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
	@RequestMapping("/user/joinSuccess")
	public String joinSuccess() {
		
		return "user/joinSuccess";
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
			m.addAttribute("loc", "/user/joinSuccess");
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
		
		//System.out.println("pw:"+password+"dbPw:"+login.getPassword());
		
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
	public ModelAndView enterMyInfo(int memberNo) {
		ModelAndView mv=new ModelAndView();
		JoinUser u=service.getUserByNo(memberNo);
		String id=u.getMember_id();
		id=id.substring(0,id.length()-4)+"***";
		
		//뒷자리 세자리 *로 가리고 출력
		System.out.println(id);
		
		mv.addObject("user",u);
		mv.addObject("id",id);
		mv.setViewName("user/myInfo");
		
		return mv;
	}
	
	@RequestMapping("/user/myBookmark")
	public ModelAndView selectMyBookmark(int memberNo) {
		ModelAndView mv=new ModelAndView();
		List<BookMarkList> list=bkService.selectMyBookmark(memberNo);
		System.out.println(list);
		mv.addObject("list", list);
		mv.setViewName("user/myBookmark");
		  return mv;
	}

	//회원정보 변경
	@RequestMapping("/user/myInfoModify")
	public String entermyInfoModify(String pw) {
		
		
		  return "user/myInfoModify";
	}
	//북마크에 넣기
	
	  @RequestMapping("/user/insertBookMark") 
	  public @ResponseBody int insertBookMark(HttpServletRequest request){
	  
	
	  Bookmark bk=new Bookmark();
	 
	  System.out.println("카페번호:"+request.getParameter("cafeNo"));
	  String cafeNo=request.getParameter("cafeNo");
	  int result=0;
		  if(cafeNo!=null) {
	
			  bk.setCafe_no(Integer.parseInt(request.getParameter("cafeNo")));
			  bk.setMember_no(Integer.parseInt(request.getParameter("userNo")));
			  result=bkService.insertBookMark(bk);
		  }else {
			  System.out.println("커피상품 북마크 등록");
			  bk.setGoods_no(Integer.parseInt(request.getParameter("goodsNo")));
			  bk.setMember_no(Integer.parseInt(request.getParameter("userNo")));
		
			  result=bkService.insertBookMark(bk);
			  
		  }
	  
	  	ModelAndView mv=new ModelAndView();
		
		mv.setViewName("jsonView"); 
	  	return result;
	  }
	 
	
	
	
	
	
	//북마크에 있는지 찾기
	
	 @RequestMapping("/user/selectBookMark") 
	 public @ResponseBody ModelAndView selectBookMark(HttpServletRequest request){
	  
	  Bookmark bk=new Bookmark();
	  Bookmark bks=new Bookmark();
	  ModelAndView mv=new ModelAndView();
	  String cafeNo=request.getParameter("cafeNo");
	  String userNo=request.getParameter("userNo");
	  System.out.println("유저no"+userNo);
	  if(userNo!=null||userNo!=" "){
			  if(cafeNo!=null) {
				  //카페 북마크 등록
				  System.out.println("카페실행");
			  bk.setCafe_no(Integer.parseInt(request.getParameter("cafeNo")));
			  bk.setMember_no(Integer.parseInt(request.getParameter("userNo")));
			  
			  bks=bkService.selectBookMark(bk);
			  }else {
				  //상품 북마크 등록
				  System.out.println("굿즈실행");
				  bk.setGoods_no(Integer.parseInt(request.getParameter("goodsNo")));
				  bk.setMember_no(Integer.parseInt(request.getParameter("userNo")));
				  
				  bks=bkService.selectBookMark(bk);
			  }
			    
	  }
	  System.out.println(bks);
	  
	  
	  boolean flag=bks!=null?true:false; System.out.println("flag:"+flag);
	  
	  
	  mv.addObject("flag", flag); 
	  mv.setViewName("jsonView"); 
	  return mv; 
	  }
	 
	 @RequestMapping("/user/deleteBookMark")
	 public @ResponseBody int deleteBookMark(HttpServletRequest request) {
		
		 
		 //제품 북마크 삭제
		 Bookmark bk=new Bookmark();
		 bk.setGoods_no(Integer.parseInt(request.getParameter("goodsNo")));
		 bk.setMember_no(Integer.parseInt(request.getParameter("userNo")));
		 
		 int result=bkService.deleteBookMark(bk);
		 
		 
		 return result;
		 
		 
	 }
	 
	 @RequestMapping("/kakaologin") 
		public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest request, HttpServletResponse response, HttpSession session)throws Exception {
			System.out.println("들어옴");
		 	ModelAndView mav = new ModelAndView(); // 결과값을 node에 담아줌 
			JsonNode node = KakaoApi.getAccessToken(code); // accessToken에 사용자의 로그인한 모든 정보가 들어있음
			System.out.println("로그인후 코드얻음:"+code);
			System.out.println(node);
			JsonNode accessToken = node.get("access_token"); // 사용자의 정보 
			System.out.println("토큰:"+accessToken);
			JsonNode userInfo = KakaoApi.getKakaoUserInfo(accessToken); 
			System.out.println(userInfo);
			
			String kname = null; 
			String kemail=null;

			// 유저정보 카카오에서 가져오기 Get properties 
			
			JsonNode kakao_account = userInfo.path("kakao_account"); 
			JsonNode profile=kakao_account.path("profile");
			kname = profile.path("nickname").asText(); //이름 
			kemail = kakao_account.path("email").asText(); //이메일
			
			System.out.println("이름,이메일:"+kname+kemail);
			//일단member_tb에서 찾는다.
			//있으면 반환, 없으면 insert
			JoinUser u=new JoinUser();
			u.setMember_id(kemail);
			u.setUsername(kname);
			JoinUser loginUser=service.kakaoLogin(u);
			
			session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			
			
			mav.addObject("loginUser",loginUser);
			mav.addObject("msg", "환영합니다!");
			mav.addObject("loc", "/");
			
			String page = "common/msg";
			
			return page; 
			
		}



}
