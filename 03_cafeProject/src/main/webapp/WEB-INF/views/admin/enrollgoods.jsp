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
					     <div class="d-flex pr-2">
							<form action="<%=request.getContextPath()%>/admin/tripInfoEnd.do" method="post" enctype="multipart/form-data" >
								<table class="table table-bordered" style="width:1000px">
									<tr>
										<td colspan="2">
										<h3>상품 등록</h3>
										</td>
									</tr>
									<tr>
										<td>
										 	카테고리 선택
										</td>
										<td>
											<select class="form-control" name="trip-selector" id="trip-selector">
								        		<option value="all" selected>유형선택</option>
								        		<option value="coffee">coffee</option>
								        		<option value="tea">tea</option>
								       	 	</select>
										</td>
									</tr>
									<tr>
										<td>
											상품명
										</td>
										<td>
											<input type="text" class="form-control"  name="goodsTitle" id="goodsTitle">
										</td>
									</tr>
										<tr>
										<td>
											상품가격
										</td>
										<td>
											<input type="text"  class="form-control" placeholder="예시)11:00 - 21:30" id="businessHour" name="businessHour">
										</td>
									</tr>
									<tr>
										<td rowspan="3">
											사진 첨부
										</td>
										<td>
											<input type="file" name="upFile" id="upFile">
											
										</td>
									</tr>
									<tr>
										<td>
											<input type="file" name="upFile2" id="upFile2">
										</td>
									</tr>
									<tr>
										<td>
											<input type="file" name="upFile3" id="upFile3">
										</td>
									</tr>
									<tr>
										<td>
											브랜드명
										</td>
										<td>
											<input type="text" class="form-control"  name="brandTitle" id="brandTitle">
										</td>
										
									</tr>
									<tr>
										<td>
											제조사
										</td>
										<td>
											<input type="text"  class="form-control"  id="goodsCom" name="goodsCom">
										</td>
									</tr>
									<tr>
										<td>
											기계종류
										</td>
										<td>
											<input type="text" class="form-control" id="tripTel" name="tripTel" placeholder="(-포함)010-1234-5678">
										</td>
									</tr>
									<tr>
										<td>
											원산지
										</td>
										<td>
											<input type="text"  class="form-control" id="homePage" name="homePage">
										</td>
									</tr>
									<tr>
										<td colspan="2">
										<button  class="btn btn-warning" id="cancelSubmit">등록 취소</button>
										<button type="submit" class="btn btn-primary" >상품등록</button>
										</td>
									</tr>
								</table>
							</form> 
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
