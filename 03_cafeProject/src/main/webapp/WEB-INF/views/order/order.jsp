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
		
			<div>
				<!-- 사이드바로 분리 -->
				<div class="mt-5 mb-5">
					<h3><b>주문/결제</b></h3>
				</div>
				<div class="mb-4">
					<h4><b>주문상품</b></h4>
				</div>
				<div class="border rounded">
					<c:forEach items="${list }" var="l">
					<div class="d-flex mt-1 mb-2">
						<input type="hidden" name="goodsNo" value="${l.goods_no }"/>
						<img class="orderImg ml-3" src="/img/cafe/${l.main_image }" width="150px;" height="150px;">
						<div class="ml-3 mt-2">
							<h6><b>${l.coffee_title }</b></h6><br>
							<div><span>${l.coffee_price}</span><span>원 | 수량:</span><span class="qty">${l.goods_qty }</span></div>
						</div>
					</div>
					
					</c:forEach>
				</div>
				<hr/>
				<!-- 배송지정보 -->
				<div class="row-vh d-flex flex-column mb-4">
					<div class="mb-2"><h4><b>배송지</b></h4></div>
					<div class="d-flex input-container">
						<div class="label">받는분</div>
						<div><input type="text" class="form-control" name="receiver" id="receiver" value="${user.username }"></div>
					</div>
					<div class="d-flex input-container">
						<div class="label">우편번호</div>
						<div><input type="text" class="form-control" onclick="goPopup();" name="zipcode" id="zipcode"></div>
					</div>
					<div class="d-flex input-container">
						<div class="label">주소</div>
						<div><input type="text" class="form-control" onclick="goPopup();" name="address" id="address" value="${user.address }"></div>
					</div>
					<div class="d-flex input-container">
						<div class="label">상세주소</div>
						<div><input type="text" class="form-control" name="address2" id="address2"></div>
					</div>
					<div class="d-flex input-container">
						<div class="label">휴대전화</div>
						<div><input type="text" class="form-control" name="receiverTel" id="receiverTel" value="${user.phone }"></div>
					</div>
					<div class="d-flex input-container">
						<div class="label">배송메모</div>
						<div><input type="text" class="form-control" name="memo" id="memo"></div>
					</div>
				</div>
				<hr/>
				<!-- 주문자정보 -->
				<div class="row-vh d-flex flex-column mb-4">
					<div class="d-flex mb-2"><h4 style="width:100px;margin-right:60px;"><b>주문자</b></h4><button class="btn btn-outline-primary btn-sm">배송자 정보와 동일</button></div>
					<div class="d-flex input-container">
						<div class="label">이름</div>
						<div><input type="text" class="form-control" name="sender"  id="sender"></div>
					</div>
					<div class="d-flex input-container">
						<div class="label">휴대전화</div>
						<div><input type="text" class="form-control" name="senderTel" id="senderTel"></div>
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
		<!-- 		<div class="row-vh d-flex flex-column mb-4">
					<div class="mb-2"><h4><b>결제수단</b></h4></div>
					
					<div></div>
					<div></div>
				</div>
				<hr/>  -->
				<div class="row-vh d-flex flex-column mb-4">
					<div><input type="checkbox" onclick="">결제 진행 필수사항 동의</div>
					
				</div>
				<div class="row-vh d-flex flex-column mb-4">
					<div><button class="btn btn-primary btn-block" onclick="payOrder();"><b>결제하기</b></button></div>
					
				</div> 
			</div>
			
		</div>
	
		<jsp:include page="/WEB-INF/views/common/rightSide.jsp" />
	</div>
</section>
<script>
/* function goPopup(){
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
} */
function goPopup(){
new daum.Postcode({
    oncomplete: function(data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
        // 예제를 참고하여 다양한 활용법을 확인해 보세요.
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
        
          document.getElementById('zipcode').value = data.zonecode;
          document.getElementById("address").value = addr;
        
    }
}).open();
}

//post방식으로 데이터 보내기
var goodsNo=document.getElementsByName("goodsNo");
var goodsNos=new Array();
var orderQty=document.getElementsByClassName("qty");
var orderQtys=new Array();
for(var i=0;i<goodsNo.length;i++){
	goodsNos.push(goodsNo[i].value);
	orderQtys.push(orderQty[i].innerHTML);
}

console.log(orderQtys);
/* var receiver=document.getElementById("receiver").value;		
var receiver_tel=document.getElementById("receiverTel").value;
var address=document.getElementById("address").value;
var sender=document.getElementById("sender").value;
var sender_tel=document.getElementById("senderTel").value;
var memo=document.getElementById("memo").value; */

var orderData={
		memberNo:${loginUser.member_no},
		goodsNos:goodsNos,
		orderQtys:orderQtys,
		receiver:document.getElementById("receiver").value,	
	    receiver_tel:document.getElementById("receiverTel").value,
		address:document.getElementById("address").value,
		sender:document.getElementById("sender").value,
		sender_tel:document.getElementById("senderTel").value,
		memo:document.getElementById("memo").value
				
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
function payOrder(){
	var IMP = window.IMP; // 생략가능
	IMP.init('imp19318003');
	// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	IMP.request_pay({ //param   -> request_pay(param,callback);
	pg: 'inicis', // version 1.1.0부터 지원.
	pay_method: 'card',
	merchant_uid: 'merchant_' + new Date().getTime(),
	name: '주문명:결제테스트',
	//결제창에서 보여질 이름
	amount: 100,
	//가격
	buyer_email: 'iamport@siot.do',
	buyer_name: '구매자이름',
	buyer_tel: '010-1234-5678',
	buyer_addr: '서울특별시 강남구 삼성동',
	buyer_postcode: '123-456',
/* 	m_redirect_url: 'https://www.yourdomain.com/payments/complete'
	
	모바일 결제시,
	결제가 끝나고 랜딩되는 URL을 지정
	(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
	 */
	}, function (rsp) {//callback
	
	if (rsp.success) { //결제가 성공할 경우
		
	alert("결제 성공");
	//소켓 호출
	let target="aldus9302@gmail.com";
	let url="${path}/admin/orderList"
	socket.send("관리자님,"+target+","+url);
	
	
 	$.ajax({
		url:'${path}/order/paymentEnd',
		type:'post',
		data:{
			imp_uid:rsp.imp_uid,
			merchant_uid:rsp.merchant_uid,
			payment:rsp.paid_amount,
			applyNum:rsp.apply_num,
			memberNo:${loginUser.member_no},
			goodsNos:goodsNos,//배열
			orderQtys:orderQtys,//배열
			receiver:document.getElementById("receiver").value,	
		    receiver_tel:document.getElementById("receiverTel").value,
			address:document.getElementById("address").value,
			sender:document.getElementById("sender").value,
			sender_tel:document.getElementById("senderTel").value,
			memo:document.getElementById("memo").value
		} ,
		success:function(data){
			if(data.result>0){
				console.log(data.result)
			alert("결제,오더 완료");
			}else{
				alert("결제,오더 실패");
			}
			
			
		}
	}); 
	
	//결제성공후 아임포트 결제완료
	//그리고 order내용들을 order에 저장.
	
	
		
	
	} else {
	var msg = '결제에 실패하였습니다.';
	msg += '에러내용 : ' + rsp.error_msg;
	}
	alert(msg);
	});

}









</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
