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
 .W-container{
	 min-height:500px;
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
	a{
	color:red;
	text-decoration:none !important;
	}
</style>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<jsp:include page="/WEB-INF/views/user/sidebar_myPage.jsp" />
<section>
	<div class="W-container row bg-light pt-4 pb-5">
		<div class="col-sm-2 content"></div>
		<div class="col-sm-8">
			<!-- 여기는 AJAX로 필터링할 부분! -->
			<div class="d-flex border rounded order-container" style="width:100%">
				<div class="d-flex justify-content-center" style="width:100%">	
					
					<div class="row-vh d-flex flex-column">
						<a class="order-text text-center" href="javascript:fn_orderState('결제완료');">결제완료</a>
						<p class="order-count text-center">${countList.cnt }</p>
					</div>
					<div class="mt-3"><i class="fas fa-angle-right fa-3x"></i></div>
					<div class="row-vh d-flex flex-column">
						<a class="order-text text-center" href="javascript:fn_orderState('배송준비');">배송준비</a>
						<p class="order-count text-center">${countList.cnt2 }</p>
					</div>
					<div class="mt-3"><i class="fas fa-angle-right fa-3x"></i></div>	
					<div class="row-vh d-flex flex-column">
						<a class="order-text text-center" href="javascript:fn_orderState('배송완료');">배송완료</a>
						<p class="order-count text-center">${countList.cnt3 }</p>
					</div>
					<div class="mt-3"><i class="fas fa-angle-right fa-3x"></i></div>
					<div class="row-vh d-flex flex-column">
						<a class="order-text text-center" href="javascript:fn_orderState('구매확정');">구매확정</a>
						<p class="order-count text-center">${countList.cnt4 }</p>
					</div>
					
				</div>	
			</div>
			<div class="row-vh d-flex flex-column border rounded mt-3 bg-white orderlist-container" style="width:100%">
				<!-- <p class="orderlist-text mt-3 ml-3">기간/셀렉트박스</p> -->
				<c:if test="${empty list}">
					<div class="text-center">해당 내역이 없습니다</div>
				</c:if>
				<c:forEach items="${list }" var="l">
				<div class="d-flex border-bottom  mt-3 ml-3" style="width:95%">
					<div>
						<p class="orderlist-text" style="color:#424242;">
							${l.order_no}  |
							<fmt:parseDate value="${l.order_date}" var="noticePostDate" pattern="yy/MM/dd"/>
							<fmt:formatDate value="${noticePostDate}" pattern="yyyy.MM.dd"/> 
							
						</p>
					</div>
					<!-- <div><p class="orderlist-text">상세보기</p></div> -->		
				</div>
					
				<!-- 내 결제내역 반복구문 -->
				<div class="d-flex justify-content-between form-check rounded-lg border-bottom ml-3 pr-3" style="width:95%" >				
					
					<div class="d-flex">
					<img class="orderImg mt-3 mb-2" src="/img/cafe/${l.main_image}" width="150px;" height="150px;"/>
						<div class="d-flex flex-column">
						<h6 class="orderlist-text  mt-5 ml-3" style="color:#424242;">${l.coffee_title }</h6>
						<h4 class="orderlist-text ml-3" style="color:#424242;">${l.order_qty } 개</h4>
						</div>
					</div>
					<div class="mt-5">
						<h5><fmt:formatNumber type="number" maxFractionDigits="3" value="${l.coffee_price }"/> 원</h5>
						<div class="text-center mt-2 mb-2" style="color:#87CEEB;"><h6>${l.order_state }</h6></div>
					</div>
					<div class="mt-5">
						<c:if test="${l.order_state eq '결제완료' }">
						<button class="btn btn-sm btn-primary" onclick="fn_cancelOrder(${l.order_no},${l.goods_no });">결제취소요청</button>
						</c:if>
						<c:if test="${l.order_state eq '취소요청' }">
							<button class="btn  btn-secondary disabled">취소처리중</button>
						</c:if>
					</div>
				
				</div>
				</c:forEach>
			</div>
			<div class="d-flex justify-content-center mt-3">
				<div id="page-container">
					${pageBar}
				</div> 	
			</div>
		</div>
	
		<jsp:include page="/WEB-INF/views/common/rightSide.jsp" />
	</div>
</section>
<script>
function fn_orderState(str){
	
	location.href="${path}/order/myOrder?memberNo="+${loginUser.member_no}+"&orderState="+str;
	
}
function fn_cancelOrder(orderNo,goodsNo){
	
	$.ajax({
		url:"${path}/order/cancelOrder",
		data:{orderNo:orderNo,
			goodsNo:goodsNo},
		success:function(data){
			console.log(data);
			if(data>0){
				alert('결제 취소 요청완료');
				location.reload();
			}
		}
			
		
		
	})
	
	
	
	
}


</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
