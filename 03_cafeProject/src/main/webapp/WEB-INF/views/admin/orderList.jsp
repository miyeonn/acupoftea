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
			<div class="col-sm-8 content border mt-3 mb-3">				
					<div class="admin-header  d-flex flex-column " >			
						<div class="d-flex  justify-content-end mt-5 mb-0">
							<div class="d-flex">	
								<div class="input-group date mr-2" id="datetimepicker1" data-target-input="nearest"> 
									<input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker1" value="${startDateStr }" id="date1"> 
									<div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker"> 
										<div class="input-group-text"><i class="fa fa-calendar"></i></div> 
									</div> 
								</div>
								<div class="input-group date" id="datetimepicker2" data-target-input="nearest">
									<input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker2" value="${endDateStr }" id="date2">
									 <div class="input-group-append" data-target="#datetimepicker2" data-toggle="datetimepicker"> 
									 	<div class="input-group-text"><i class="fa fa-calendar"></i></div> 
									 </div> 
								 </div>
								 
							</div>
							<button class="btn btn-primary ml-2 mr-1" onclick="orderByDate();">검색</button>
						</div>
						 <div class="ml-auto">
							<button class="btn btn-success mt-2 mr-2" onclick="location.href='${path}/admin/excelDown';">Excel</button>
						 </div>					
					     <div class="d-flex  justify-content-center align-items-center" width="100%">	
							<table class="table table-bordered">
								<tr>
									<td>주문번호</td>
									<td>주문일자</td>
									<td>상품번호</td>
									<td>상품명</td>
									<td>주문수량</td>
									<!-- <td>현재재고</td>
									<td>과부족</td> -->
									<td>현황</td>
								</tr>
								<c:forEach items="${list }" var="l">
								<tr>
									<td>${l.order_no }</td>
									<td>${l.order_date }</td>
									<td>${l.goods_no }</td>
									<td>${l.coffee_title }</td>
									<td>${l.order_qty }</td>
									<!-- <td> </td>
									<td></td> -->
									<td class="d-flex flex-column">
									${l.order_state }
									<c:if test="${l.order_state eq '취소요청' }">
										<button class="btn btn-sm btn-primary " onclick="fn_cancelPort(${l.order_no})">취소승인</button>
									</c:if>
									<c:if test="${l.order_state eq '결제완료' }">
										<button class="btn  btn-sm btn-primary mt-1" onclick="fn_cancelPort(${l.order_no})">출고진행</button>
									</c:if>
									</td>						
								</tr>
								</c:forEach>
							</table>
							
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
			alert(data.result);
	    
		}
		
	})
		
}
/* function excelDown(){
	$.ajax({

		type:"get",
		url:"${path}/admin/excelDown",
		success : function(data){ messageJs.alertMeassge(data); }

		});
}
 */
 
 $(function () { 
	 $('#datetimepicker1').datetimepicker({ format: 'L'}); 
	 $('#datetimepicker2').datetimepicker({
		 format: 'L', 
		 useCurrent: false 
	  }); 
	 $("#datetimepicker1").on("change.datetimepicker", function (e) { 
		 $('#datetimepicker2').datetimepicker('minDate', e.date); 
		 }); 
	 $("#datetimepicker2").on("change.datetimepicker", function (e) { 
		 $('#datetimepicker1').datetimepicker('maxDate', e.date); 
		 
	 	 }); 
	 });


function orderByDate(){
	//날짜 조회시 그 기간에 해당하는 오더 가져오기	
	var date1=document.getElementById("date1").value;
	var	date2=document.getElementById("date2").value;
	
	location.href="${path}/admin/orderByDate?date1="+date1+"&date2="+date2;
	

	
}



</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
