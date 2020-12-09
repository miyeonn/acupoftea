<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/user/sidebar_myPage.jsp" />
<section>
	<div class="container-fluid pb-3">
			<div class="row">
			<!-- 사이드바로 분리 -->
			<div class="col-sm-2 content"></div>
			
			<!-- 컨텐츠섹션으로 분리 -->
			<div class="col-sm-8 content">
			 	<div class="row">		 		
			 		<div class="container" id="container">

				        <div class="row-vh d-flex flex-row">
				
				            <div class="item mx-auto align-self-center">
				                <br>
				                <h1 class="display-4 text-center pt-4">회원정보 수정</h1>
				                <form action="${path }/user/joinUserEnd" name="joinfrm" method="post" >                   
									<br>
				                    <h6>
				                    	<i class="icon fas fa-user"></i>&nbsp;아이디
				                    </h6>
				                      <div class="mb-3" id="userId-container" style=" border: none; border-bottom: solid 1px #FFE3E3;">       
				                        	아이디 출력
				                      
				                      </div>
			
									<br>
									<h6><i class="icon far fa-grin"></i>&nbsp;이름</h6>
				                      <div class="input-group mb-3" style=" border: none; border-bottom: solid 1px #FFE3E3;">
				                        <input style=" border: none; border-bottom: solid 1px #FFE3E3; border-radius:0;"  
				                        		type="text" class="form-control" placeholder="이름 입력" size="30" name="userName" id="userName" >
				                      </div>
				                      <br>
				                       <h6><i class="icon fas fa-mobile-alt"></i>&nbsp;전화번호</h6>
				                      <div class="input-group mb-3">
				                        <input style=" border: none; border-bottom: solid 1px #FFE3E3; border-radius:0;" 
				                         		type="text" class="form-control" placeholder="-제외 숫자만 입력" size="30" name="phone" id="phone" maxlength="11" >
				                      </div>
				                      <br> 
				                      
				                      <h6><i class="icon fas fa-unlock-alt"></i>&nbsp;비밀번호 변경</h6>
				                      <div class="input-group mb-3">
				                        <input style=" border: none; border-bottom: solid 1px #FFE3E3; border-radius:0;" 
				                        		type="password" class="form-control" placeholder="현재비밀번호 입력" size="30" name="originalPw" id="originalPw" >
				                      </div>
				                      <div class="input-group mb-3">
				                        <input style=" border: none; border-bottom: solid 1px #FFE3E3; border-radius:0;" 
				                        		type="password" class="form-control" placeholder="영문자나 숫자(4~12자 )입력" size="30" name="userPw" id="userPw" >
				                      </div>
				                      <div class="input-group mb-3">
				                        <input style=" border: none; border-bottom: solid 1px #FFE3E3; border-radius:0;" 
				                        		type="password" class="form-control" placeholder="비밀번호 확인" size="30" name="pwck" id="pwck" >
				                      </div>
				                      			<div class="alert alert-success" id="alert-danger2">현재 비밀번호가 일치하지 않습니다.</div>
				                        		<div class="alert alert-success" id="alert-success2">비밀번호가 일치합니다.</div>
				                        		<div class="alert alert-danger" id="alert-danger2">비밀번호가 일치하지 않습니다.</div>
				                      <br>
				                      
				                      <h6><i class="icon far fa-grin"></i>&nbsp;주소</h6>
				                      <div class="input-group mb-3">
				                        <input style="border: none; border-bottom: solid 1px #FFE3E3; border-radius:0;"  
				                        		type="text" class="form-control" placeholder="주소 입력" size="30" name="address" id="address"
												onclick="goPopup();"  >
				                      </div>
									  <br>
				                     <div class="row justify-content-center p-1">
                        				<button class="btn btn-primary btn-block" onclick="btn_click('');">수정완료</button>
                    				  </div> 
				                     
                    				  <div class="row justify-content-center p-1">
                        				<button class="btn btn-warning btn-block" onclick="btn_click('backHome');">돌아가기</button>
                    				  </div>   
				                </form>
				            </div>
						</div>
			 		</div>
			 	</div> 
			</div>
			<!-- 오른쪽여백으로 분리 -->
			<jsp:include page="/WEB-INF/views/common/rightSide.jsp" />
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

