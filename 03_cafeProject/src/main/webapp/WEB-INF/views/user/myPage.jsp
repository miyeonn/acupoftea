<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/user/sidebar_myPage.jsp" />
<section>
	<div class="container-fluid">
		<div class="row">
			<!-- 사이드바로 분리 -->
			<div class="col-sm-2 content"></div>
			
			<!-- 컨텐츠섹션으로 분리 -->
			<div class="col-sm-8 content">
			 	<div class=" row-vh d-flex flex-column justify-content-center ">
			 		<div class="col-sm-6">
			 			<h3><b>회원정보확인</b></h3>
			 		</div>
			 		<h6>이름님의 정보를 안전하게 보호하기위해 비밀번호를 다시 한번 확인합니다.</h6>
			 		<form action="" method="post">
			 		<div>
			 			<table>
			 				<tr>
			 					<td>
			 					아이디
			 					</td>
			 					<td>
			 					</td>
			 				</tr>
			 				<tr>
			 					<td>
			 					비밀번호
			 					</td>
			 					<td>
			 					<input type="password" />
			 					</td>
			 				</tr>
			 				
			 			</table>
			 		</div>
			 		</form>
			 		<div class="d-flex">
			 			<button type="submit">확인</button>
			 			<button>취소</button>
			 		</div>
			 	</div>
			 
			</div>
			<!-- 오른쪽여백으로 분리 -->
			<jsp:include page="/WEB-INF/views/common/rightSide.jsp" />
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

