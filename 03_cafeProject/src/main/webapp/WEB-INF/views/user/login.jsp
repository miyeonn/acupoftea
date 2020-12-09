<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="651161446279-3rjhjblbrb141lep5kevk9d1mvrtbp74.apps.googleusercontent.com">
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<style>
#loginBox{
	width:500px;

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
			 		<div class="container content ">
						<form action="${path }/user/loginEnd" id="loginform" method="post" >
							 <div id="loginBox" class="border center-block text-center">
							 <h1 id="title" class="text-center">LOGIN</h1>
							 	<table class="text-center">
							 		<tr>
							 			<td colspan="2">
							 			<input type="text" name="id" placeholder="아이디"/>
							 			</td>
							 		</tr>
							 		<tr>
							 			<td colspan="2">
							 			<input type="password" name="password" placeholder="비밀번호"/>
							 			</td>
							 		</tr>
	 								<tr>
	 									<td colspan="2">
	 									<button class="btn btn-primary btn-block" onclick='btn_click("login");'>로그인</button>
	 									</td>
	 								</tr>
	 								<tr>
	 									<td colspan="2">
	 									<div class="g-signin2 align-center" data-onsuccess="onSignIn"></div>
	 									<!-- <a href="#" onclick="signOut();">Sign out</a>로그인 상태일때 -->
	 									</td>
	 								</tr>
							 	</table>	 
							 </div>
						</form>
							<button class="btn btn-primary btn-block" onclick='btn_click("join");'>회원가입</button>
					</div>			
			 	</div>
			</div>
			<!-- 오른쪽여백으로 분리 -->
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
</script>
</body>
</html>