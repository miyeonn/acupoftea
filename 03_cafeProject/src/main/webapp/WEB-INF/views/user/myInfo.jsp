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
				<div class="col-sm-8 content">
			 	<div class=" row-vh d-flex flex-column justify-content-center border mt-3">
			 		<div >
			 			<h3><b>회원정보확인</b></h3>
			 		</div>
			 		<h6>이름님의 정보를 안전하게 보호하기위해 비밀번호를 다시 한번 확인합니다.</h6>
			 		<form action="${path }/user/myInfoModify" id="loginform" method="post" >
						 <div id="loginBox" >
						 	<table >
						 		<tr>
						 			<td td colspan="2">
						 			<label>아이디:</label>					 			
						 			</td>
						 		</tr>
						 		<tr>
						 			<td colspan="2">
						 			<label for="password">비밀번호:</label>
						 			<input type="password" name="password" placeholder="비밀번호"/>
						 			</td>
						 		</tr>
						 	</table>	 
						 </div>
						 <div>
						  	<button type="submit" class="btn btn-primary" onclick="location.href='${path}/user/myInfoModify'">확인</button>
			 			 	<button type="button" class="btn btn-warning">취소</button>
						 </div>
					</form>
			 	</div>
			 
			</div>
			<!-- 오른쪽여백으로 분리 -->
			<jsp:include page="/WEB-INF/views/common/rightSide.jsp" />
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

