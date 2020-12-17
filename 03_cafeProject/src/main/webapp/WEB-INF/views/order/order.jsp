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


//아임포트 토큰 생성
var token;
$.ajax({
	url:"${path}/order/getToken",
	type:'post',
	success:function(data){
		console.log("토큰데이터"+data);
		token=data;
	}
});

//아임포트 연동 api. 결제 및 orderlist에 저장.
var addOrder=document.querySelector("#CartAddOrder");
addOrder.addEventListener("click",function(){
	var IMP = window.IMP; // 생략가능
	IMP.init('imp19318003');
	// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	IMP.request_pay({ //param   -> request_pay(param,callback);
	pg: 'inicis', // version 1.1.0부터 지원.
	/*
	'kakao':카카오페이,
	html5_inicis':이니시스(웹표준결제)
	'nice':나이스페이
	'jtnet':제이티넷
	'uplus':LG유플러스
	'danal':다날
	'payco':페이코
	'syrup':시럽페이
	'paypal':페이팔
	*/
	pay_method: 'card',
	/*
	'samsung':삼성페이,
	'card':신용카드,
	'trans':실시간계좌이체,
	'vbank':가상계좌,
	'phone':휴대폰소액결제
	*/
	merchant_uid: 'merchant_' + new Date().getTime(),
	/*
	merchant_uid에 경우
	https://docs.iamport.kr/implementation/payment
	위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
	참고하세요.
	나중에 포스팅 해볼게요.
	*/
	name: '주문명:결제테스트',
	//결제창에서 보여질 이름
	amount: 100,
	//가격
	buyer_email: 'iamport@siot.do',
	buyer_name: '구매자이름',
	buyer_tel: '010-1234-5678',
	buyer_addr: '서울특별시 강남구 삼성동',
	buyer_postcode: '123-456',
	m_redirect_url: 'https://www.yourdomain.com/payments/complete'
	/*
	모바일 결제시,
	결제가 끝나고 랜딩되는 URL을 지정
	(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
	*/
	}, function (rsp) {//callback
	console.log(rsp);
	if (rsp.success) { //결제가 성공할 경우

	
	$.ajax({
		url:'https://api.iamport.kr/payments/'+rsp.imp_uid,
		type:'post',
		headers: { "Authorization": token } ,
		success:function(data){
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;		
			alert(msg);
		}
	});
	
	
	} else {
	var msg = '결제에 실패하였습니다.';
	msg += '에러내용 : ' + rsp.error_msg;
	}
	alert(msg);
	});
	

	
	
	
	
})
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
