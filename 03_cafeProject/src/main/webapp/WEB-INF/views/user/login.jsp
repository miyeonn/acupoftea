<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="651161446279-3rjhjblbrb141lep5kevk9d1mvrtbp74.apps.googleusercontent.com">
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<style>
 .login-container{
 	margin-top:100px;
 }
 .loginContent{
 	margin-bottom:10px;
 }

</style>
<section>
	<div class="container-fluid">
		<div class="row">
			<!-- 사이드바로 분리 -->
			<div class="col-sm-2 content"></div>
			
			<!-- 컨텐츠섹션으로 분리 -->
			<div class="col-sm-8 content">
			 	<div class="row align-items-center">		 	
			 		
			 		<div class="col-sm-4"></div>
			 		<div class="col-sm-4 container login-container">
						<form action="${path }/user/loginEnd" id="loginform" method="post" >
							 <div id="loginBox" class="d-flex flex-column  justify-content-center">
							 	<h1 id="title" class="text-center mb-3">LOGIN</h1>
					 			<div class="loginContent">
					 				<input type="text" class="form-control" name="id" placeholder="아이디"/>
					 			</div>
					 			<div class="loginContent">
					 				<input type="password" class="form-control" name="password" placeholder="비밀번호"/>
					 			</div>
					 			<div class="loginContent">
									<button class="btn btn-primary btn-block" onclick='btn_click("login");'>로그인</button>
								</div>
								<div class="loginContent">
									<div class="g-signin2 align-center" data-onsuccess="onSignIn"></div>
									<a id="kakao-login-btn"></a>
									<!-- <a href="#" onclick="signOut();">Sign out</a>로그인 상태일때 -->
								</div>
								<hr style="background-color:grey"/>
								<button class="btn btn-primary btn-block" onclick='btn_click("join");'>회원가입</button>	 
							 </div>
						</form>
					</div>	
					<div class="col-sm-4"></div>
							
			 	</div>
			</div>
			<!-- 오른쪽여백으로 분리 -->
			<div class="col-sm-2 content"></div>
		</div>
	</div>
			
</section>
<script>
function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	}
  function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
  }
  //회원가입,로그인 버튼 
 function btn_click(str){
	 if(str=="login")
	 {
		var userId=document.getElementById("id");
		var userPw=document.getElementById("password");
		loginform.submit;
		 
	 }
	 else if(str=="join")
	{
		 location.href="${path}/user/joinUser";
	}
	 
	 
 }
 //카카로 로그인
 
 
   // 사용할 앱의 JavaScript 키를 설정해 주세요.
   Kakao.init('dd85c7c19c3d45f5bedf296de1914e7f');
   
   // 카카오 로그인 버튼을 생성합니다.
   Kakao.Auth.createLoginButton({
     container: '#kakao-login-btn',
     success: function(authObj) {
    alert(JSON.stringify(authObj));
     },
     fail: function(err) {
     alert(JSON.stringify(err));
     }
   });
    //

  
  
  
</script>
</body>
</html>