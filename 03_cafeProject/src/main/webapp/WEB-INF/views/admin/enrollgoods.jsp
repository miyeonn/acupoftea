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
							<form action="${path }/admin/enrollGoodsEnd" method="post" enctype="multipart/form-data" >
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
											<select class="form-control" name="category" id="category">
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
											<input type="text"  class="form-control"  id="goodsPrice" name="goodsPrice">
										</td>
									</tr>
									<tr>
										<td>
											재고갯수
										</td>
										<td>
											<input type="text"  class="form-control"  id="goodsStock" name="goodsStock">
										</td>
									</tr>
									<tr>
										<td >
											사진 첨부
										</td>
										<td>
											<input type="file" multiple="multiple" name="upFile" id="upFile">
											
										</td>
									</tr>
									<tr>
										<td>
											브랜드명
										</td>
										<td>
											<input type="text" class="form-control"  name="goodsBrand" id="goodsBrand">
										</td>
										
									</tr>
									<tr>
										<td>
											제조사명
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
											<input type="text" class="form-control" id="goodsMachine" name="goodsMachine">
										</td>
									</tr>
									<tr>
										<td>
											원산지
										</td>
										<td>
											<input type="text"  class="form-control" id="goodsOrigin" name="goodsOrigin">
										</td>
									</tr>
									<tr>
										<td>
											맛
										</td>
										<td>
											<input type="text"  class="form-control" id="goodsTaste" name="goodsTaste">
										</td>
									</tr>
									<tr>
										<td>
											향
										</td>
										<td>
											<input type="text"  class="form-control" id="goodsFlavor" name="goodsFlavor">
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
