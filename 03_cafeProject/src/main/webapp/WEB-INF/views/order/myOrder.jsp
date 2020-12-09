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
 .order-container,.orderlist-container{
 box-shadow: 2px 2px 0 0 #bdbdbd;
     
 }
 .order-container *{
 	margin-left:20px;
 	margin-top:10px;
 	
 
 }
 .order-text{
 	font-size:20px;
 	
 
 }
 .order-text:hover{
 font-weight:bolder;
 }
 .order-count{
 	font-size:20px;
 	font-weight:bolder;
 	color:skyblue;
 	
 }
 .orderlist-text{
 	font-size:20px;
 	font-weight:bolder;
 }

</style>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<jsp:include page="/WEB-INF/views/user/sidebar_myPage.jsp" />
<section>
	<div class="row bg-light pt-4 pb-5">
		<div class="col-sm-2 content"></div>
		<div class="col-sm-8">
			<div class="d-flex border rounded order-container" style="width:100%">
				<div class="row-vh d-flex flex-column">
					<p class="order-text">입금대기</p>
					<p class="order-count">0</p>
				</div>
				<div><i class="fas fa-angle-right fa-3x"></i></div>
				<div class="row-vh d-flex flex-column">
					<p class="order-text">결제완료</p>
					<p class="order-count">0</p>
				</div>
				<div><i class="fas fa-angle-right fa-3x"></i></div>
				<div class="row-vh d-flex flex-column">
					<p class="order-text">배송준비</p>
					<p class="order-count">0</p>
				</div>
				<div><i class="fas fa-angle-right fa-3x"></i></div>	
				<div class="row-vh d-flex flex-column">
					<p class="order-text">배송완료</p>
					<p class="order-count">0</p>
				</div>
				<div><i class="fas fa-angle-right fa-3x"></i></div>
				<div class="row-vh d-flex flex-column">
					<p class="order-text">구매확정</p>
					<p class="order-count">0</p>
				</div>
			</div>
			<div class="row-vh d-flex flex-column border rounded mt-3 bg-white orderlist-container" style="width:100%">
				<p class="orderlist-text">기간/셀렉트박스</p>
				<div class="d-flex border-bottom justify-content-between mt-3 ml-3" style="width:95%">
					<div><p class="orderlist-text">주문번호|주문일자</p></div>
					<div><p class="orderlist-text">상세보기</p></div>		
				</div>
				<hr/>	
				<!-- 내 결제내역 반복구문 -->
				<div class="d-flex form-check rounded-lg border-bottom ml-3" style="width:95%" >
					
					<img class="orderImg"src="${path }/resources/img/capsule.jpg" width="150px;" height="150px;"/>
					<div>
						<p class="orderlist-text">상품명</p>
						<p class="orderlist-text">갯수</p>
					</div>
				</div>
				<!-- 결제내역  반복 끝 -->
				
				
			</div>
		</div>
	
		<jsp:include page="/WEB-INF/views/common/rightSide.jsp" />
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
