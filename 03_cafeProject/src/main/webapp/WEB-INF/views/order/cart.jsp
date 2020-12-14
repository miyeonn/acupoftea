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
				<div class="d-flex form-check justify-content-between">
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
				<c:forEach items="${list }" var="c">
					<div class="border d-flex form-check bg-white rounded-lg mb-2" >
						
						<input type="checkbox" class="form-check-input"/>
						<img class="orderImg"src="${path }/resources/img/capsule.jpg" width="150px;" height="150px;"/>
						<div>
							<h6>${c.coffee_title }</h6>
							<div id="">
							<select class="form-control qtySelector" onchange="fnQtyChange(${c.goods_no },this)">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
									
							</select>
							</div>
						</div>
					</div>
				</c:forEach>
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
		 		<button id="CartAddOrder"class="btn btn-primary btn-block">n개 상품 결제하기</button>
		 	</div>
		</div>
	
		<jsp:include page="/WEB-INF/views/common/rightSide.jsp" />
	</div>
</section>
<script>
function fnQtyChange(goodsNo,ths){
	console.log(goodsNo+":"+ths.innerText);
	
}
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
	amount: 1000,
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
	if (rsp.success) {
	var msg = '결제가 완료되었습니다.';
	msg += '고유ID : ' + rsp.imp_uid;
	msg += '상점 거래ID : ' + rsp.merchant_uid;
	msg += '결제 금액 : ' + rsp.paid_amount;
	msg += '카드 승인번호 : ' + rsp.apply_num;
	} else {
	var msg = '결제에 실패하였습니다.';
	msg += '에러내용 : ' + rsp.error_msg;
	}
	alert(msg);
	});
	

	
	
	
	
})


</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
