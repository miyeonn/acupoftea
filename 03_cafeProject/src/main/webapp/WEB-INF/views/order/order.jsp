<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<style>
 .input-container{
 	margin-bottom:20px;
 }
 .label{
 	width:100px;
 	margin-left:10px;
 	margin-right:50px;
 	padding-top:5px;
 }
 .orderImg{
	 margin-left:10px;
 
 }

</style>
<section>
	<div class="row">
		<div class="col-sm-2 content"></div>
		<div class="col-sm-8">
		<form action="" method="post" name="orderfrm">
			<div>
				<!-- 사이드바로 분리 -->
				<div class="mt-5 mb-5">
					<h3><b>주문/결제</b></h3>
				</div>
				<div class="mb-4">
					<h4><b>주문상품</b></h4>
				</div>
				<div class="d-flex">
					<img class="orderImg" src="${path }/resources/img/capsule.jpg" width="150px;" height="150px;">
					<div>
						<h6>상품이름</h6><br>
						<h6>상품가격|갯수</h6>
					</div>
				</div>
				<hr/>
				<!-- 배송지정보 -->
				<div class="row-vh d-flex flex-column mb-4">
					<div class="mb-2"><h4><b>배송지</b></h4></div>
					<div class="d-flex input-container">
						<div class="label">받는분</div>
						<div><input type="text" class="form-control"></div>
					</div>
					<div class="d-flex input-container">
						<div class="label">우편번호</div>
						<div><input type="text" class="form-control" onclick="goPopup();" name="zipcode" id="zipcode"></div>
					</div>
					<div class="d-flex input-container">
						<div class="label">주소</div>
						<div><input type="text" class="form-control" onclick="goPopup();" name="address" id="address"></div>
					</div>
					<div class="d-flex input-container">
						<div class="label">상세주소</div>
						<div><input type="text" class="form-control" name="address2" id="address2"></div>
					</div>
					<div class="d-flex input-container">
						<div class="label">휴대전화</div>
						<div><input type="text" class="form-control"></div>
					</div>
					<div class="d-flex input-container">
						<div class="label">배송메모</div>
						<div><input type="text" class="form-control"></div>
					</div>
				</div>
				<hr/>
				<!-- 주문자정보 -->
				<div class="row-vh d-flex flex-column mb-4">
					<div class="d-flex mb-2"><h4 style="width:100px;margin-right:60px;"><b>주문자</b></h4><button class="btn btn-outline-primary btn-sm">배송자 정보와 동일</button></div>
					<div class="d-flex input-container">
						<div class="label">이름</div>
						<div><input type="text" class="form-control"></div>
					</div>
					<div class="d-flex input-container">
						<div class="label">휴대전화</div>
						<div><input type="text" class="form-control"></div>
					</div>
				</div>
				<hr/> 
				<!-- 최종결제금액 -->
				<div class="row-vh d-flex flex-column mb-4">
					<div class="mb-2"><h4><b>최종 결제 금액</b></h4></div>
					<div class="d-flex input-container">
						<div class="label">총 상품금액</div>
						<div>10000원</div>
					</div>
					<div class="d-flex input-container">
						<div class="label">배송비</div>
						<div>2500원</div>
					</div>
				</div>
				<hr/> 
				<div class="row-vh d-flex flex-column mb-4">
					<div class="mb-2"><h4><b>결제수단</b></h4></div>
					<div></div>
					<div></div>
				</div>
				<hr/> 
				<div class="row-vh d-flex flex-column mb-4">
					<div><input type="checkbox" onclick="">결제 진행 필수사항 동의</div>
					
				</div>
				<div class="row-vh d-flex flex-column mb-4">
					<div><button class="btn btn-primary btn-block"><b>결제하기</b></button></div>
					
				</div> 
			</div>
			</form>
		</div>
	
		<jsp:include page="/WEB-INF/views/common/rightSide.jsp" />
	</div>
</section>
<script>
function goPopup(){
	var address=document.getElementById("address").value;
	if(address==""){
	var pop = window.open("${path}/user/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr,zipNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.

	document.orderfrm.zipcode.value = zipNo;
	document.orderfrm.address.value = roadFullAddr;		 
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
