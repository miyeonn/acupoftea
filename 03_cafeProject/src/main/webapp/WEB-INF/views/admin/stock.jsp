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
					<div class="admin-header d-flex flex-column justify-content-center align-items-center">
					     <div class="d-flex pr-2 justify-content-center align-items-center">
							<table class="table table-bordered">
								<tr>
									<td>일자</td>
									<td>상품번호</td>
									<td>상품명</td>
									<td>입/출고</td>
									<td>수량</td>

								</tr>
							
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>				
								</tr>
								
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

	




</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
