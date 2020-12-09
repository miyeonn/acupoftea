<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<style>
 .label{
 	width:100px;
 	margin-left:10px;
 	margin-right:50px;
 	padding-top:5px;
 }

</style>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<jsp:include page="/WEB-INF/views/user/sidebar_myPage.jsp" />
<section>
	<div class="row bg-light pt-4">
		<div class="col-sm-2 content"></div>
		<div class="col-sm-6">
			<div class="row-vh d-flex flex-column">
				<div class="d-flex form-check ">
					<div>
						<div>
							<input type="checkbox" class="form-check-input">모두선택
						</div>
					</div>
					<div>
					 	<h6>선택삭제</h6>
					</div>
				</div>
				<!-- 내 장바구니 반복구문 -->
				<div class="border d-flex form-check bg-white rounded-lg" >
					
					<input type="checkbox" class="form-check-input"/>
					<img class="orderImg"src="${path }/resources/img/capsule.jpg" width="150px;" height="150px;"/>
					<div>
						<h6>상품명</h6>
						<h6>갯수</h6>
					</div>
				</div>
				<!-- 장바구니 반복 끝 -->
			</div>
		</div>
		<div class="col-sm-2">
		 	<div class="cart-total-container border rounded-lg bg-white mt-4 pl-2">
		 		<div class="d-flex mt-3">
		 			<h6 class="label">총 상품금액</h6>
		 			<h6>10000원</h6>
		 		</div>
		 		<div class="d-flex">
		 			<h6 class="label">총 배송비</h6>
		 			<h6>10000원</h6>
		 		</div>
		 		<div class="d-flex">
		 			<h6 class="label">총 할인금액</h6>
		 			<h6>10000원</h6>
		 		</div>
		 		<br/>
		 		<div class="d-flex">
		 			<h6 class="label"><b>결제금액</b></h6>
		 			<h4><b>10000원</b></h4>
		 		</div>
		 	</div>
		 	<div class="mt-3">
		 		<button class="btn btn-primary btn-block">n개 상품 결제하기</button>
		 	</div>
		</div>
	
		<jsp:include page="/WEB-INF/views/common/rightSide.jsp" />
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
