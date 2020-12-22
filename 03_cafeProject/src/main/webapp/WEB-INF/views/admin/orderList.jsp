<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
/* 	.admin-header{
	margin-left:23%;
	} */
	table{
	text-align:center;
	margin-left:auto;
	margin-right:auto;
	margin-top:5%;
	
	}
	
	
</style>
<jsp:include page="/WEB-INF/views/admin/sidebar-admin.jsp" />
<section>
<div class="container-fluid">
		<div class="row">
			<!-- 사이드바로 분리 -->
			<jsp:include page="/WEB-INF/views/common/leftSide.jsp" />			
			<!-- 컨텐츠섹션으로 분리 -->
			<div class="col-sm-8 content">
				<div class="row">
					<div class="admin-header d-flex flex-column justify-content-center align-items-center" width="100%">
					     <div class="d-flex pr-2 justify-content-center align-items-center" width="100%">
							<table class="table table-bordered">
								<tr>
									<td>주문번호</td>
									<td>주문일자</td>
									<td>상품번호</td>
									<td>상품명</td>
									<td>주문수량</td>
									<td>현재재고</td>
									<td>과부족</td>
									<td>현황</td>
								</tr>
								<c:forEach items="${list }" var="l">
								<tr>
									<td>${l.order_no }</td>
									<td>${l.order_date }</td>
									<td>${l.goods_no }</td>
									<td></td>
									<td>${l.order_qty }</td>
									<td> </td>
									<td></td>
									<td>
									${l.order_state }
									<c:if test="${l.order_state eq '취소요청' }">
										<button class="btn btn-primary" onclick="fn_cancelPort(${l.order_no})">취소승인</button>
									</c:if>
									</td>						
								</tr>
								</c:forEach>
							</table>
							
						</div>   
					</div>
				</div>	
			</div>
		
			<!-- 오른쪽여백으로 분리 -->
			<jsp:include page="/WEB-INF/views/common/rightSide.jsp" />
		</div>
</div>
</section>
<script>
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
	

function fn_cancelPort(str){
	$.ajax({
		//먼저 해당 오더번호로 paymenttable의 정보를 가져옴
		success:function(data){
			//또 ajax로 아임포트에 연결.
				 function cancelPay() {
				      jQuery.ajax({
				        "url": "http://www.myservice.com/payments/cancel",
				        "type": "POST",
				        "contentType": "application/json",
				        "data": JSON.stringify({
				          "merchant_uid": "mid_" + new Date().getTime(), // 주문번호
				          "cancel_request_amount": 2000, // 환불금액
				          "reason": "테스트 결제 환불" // 환불사유
				          "refund_holder": "홍길동", // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
				          "refund_bank": "88" // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(ex. KG이니시스의 경우 신한은행은 88번)
				          "refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 수령계좌 번호
				        }),
				        "dataType": "json"
				      });
				    }	
		}
		
		
		
	})
	
	
	
}


</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
