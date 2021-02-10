<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<style>
 .celebrate{
 	font-family:'Nanum Myeongjo', serif;
 	color:black;
 }
 .W-container{
 	
 	min-height:1000px;
 }
 .celebrate-container{
 margin-top:100px;
 }

</style>

<section>
	
		<div class="row W-container">
			<!-- 사이드바로 분리 -->
			<div class="col-sm-2 content"></div>
			
			<!-- 컨텐츠섹션으로 분리 -->
			<div class="col-sm-8 content">
			 	<div class="row justify-content-center celebrate-container">	
			 	
			 			<div class="row-vh d-flex flex-column  justify-content-center">
				 			<div>
				 				<h3 class="celebrate mb-3">A CUP OF TEA. </h3>
				 			</div>
				 			<div class="mt-2">
				 				<img src="${path }/resources/img/main/creditfail.png"/>
				 			</div>
							<div class="mt-3">
								<h4>결제 오류가 발생하였습니다</h4>
							</div>
							<div class="mt-3">
								<button class="btn btn-primary btn-block" onclick="location.href='${path }order/cart?memberNo=<%=loginUser.getMember_no()%>'">장바구니로 이동</button>
			 				</div>
						</div>
			 		
			 	</div> 
			</div>
			<!-- 오른쪽여백으로 분리 -->
			<jsp:include page="/WEB-INF/views/common/rightSide.jsp" />
		</div>
	
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

