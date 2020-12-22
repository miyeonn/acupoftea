<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/user/sidebar_myPage.jsp" />
<section>
	<div class="container-fluid">
		<div class="row">
			<!-- 사이드바로 분리 -->
			<div class="col-sm-2 content"></div>
			<div class="col-sm-8 content d-flex flex-column justify-content-center ">			
			 	<div class="row align-items-center   mt-5 mb-5"  >
			 		<div class="col-sm-4"></div>
			 		<div class="col-sm-4">
				 		<div class="d-flex justify-content-center">
				 			<h3><b>회원정보수정</b></h3>
				 		</div>	
				 		<form action="${path }/user/myInfoModify" id="loginform" method="post" >
							 <div id="loginBox" class="d-flex flex-column align-self-center mt-3" >
								<div class="" >					 				
				 					<h6>
				                    	<i class="icon fas fa-user"></i>&nbsp;아이디
				                    </h6>
					                <input style=" border: none; border-bottom: solid 1px #FFE3E3; border-radius:0;" 
					                        		type="text" class="form-control" value="${id }">	
					                 <input type="hidden" 	name="userId" id="userId" value="${u.member_id }"/>		
					 			</div>
					 			<div class="">	
									<h6><i class="icon fas fa-unlock-alt"></i>&nbsp;비밀번호</h6>            
			                        <input style=" border: none; border-bottom: solid 1px #FFE3E3; border-radius:0;" 
			                        		type="password" class="form-control" size="30" name="userPw" id="userPw" >
	      
					 	 		</div>	
							 </div>
							 <div class="d-flex  justify-content-center mt-3">
							  	<button type="submit" class="mr-2 btn btn-primary" >확인</button>
				 			 	<button type="button" class="btn btn-warning">취소</button>
							 </div>
						</form>
					</div>
					<div class="col-sm-4"></div>
			 	</div>
			 	
			 	
			</div>
			<!-- 오른쪽여백으로 분리 -->
			<jsp:include page="/WEB-INF/views/common/rightSide.jsp" />
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

