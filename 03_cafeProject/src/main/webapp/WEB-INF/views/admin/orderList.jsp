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

	
//환불요청
function fn_cancelPort(str){
	$.ajax({
		//먼저 해당 오더번호로 paymenttable의 정보를 가져옴
		url:"${path}/order/cancelPort",
		data:{orderNo:str},
		success:function(data){
			console.log(data.pay)
			
		
				    
		}
		
	})
		
}




</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
