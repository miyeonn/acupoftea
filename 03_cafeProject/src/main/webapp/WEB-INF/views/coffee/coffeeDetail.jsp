<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<style>
	.coffeeImg{
		width:400px;
		height:500px;
	}
	.content-container{
	 margin-left:150px;
	 margin-right:150px;
	}
	.nav-container{
	 width:100%;
	 position: sticky; 
	top: 0;
	}
	.coffeeDetail{
	margin-left:20px;
	}
</style>
<section>
	<div class="container-fluid">
		<div class="row">
			<!-- 사이드바로 분리 -->
			<jsp:include page="/WEB-INF/views/common/leftSide.jsp" />			
			<!-- 컨텐츠섹션으로 분리 -->
			<div class="col-sm-8 content">
				<div class="row">
					<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
					<div class="">
						<!-- 커피사진,커피 관련내용 -->					
							<div class="d-flex flex-row content-container">
								<div class="coffeeImg">
									<img src="${path }/resources/img/capsule.jpg" class="rounded float-left  img-fluid" alt="" >
								</div>
							  	<div class="coffeeDetail">
								  	<div><h2>커피이름이 길어지면</h2></div>
								  	<div>
									  	<h5><i class="far fa-bookmark"></i>
									  	<!-- <i class="fas fa-bookmark"></i> -->
									  	<i class="fas fa-share-alt"></i></h5>
								  	</div>
								  	<div><h5>가격</h5></div>
								  	<hr/>
								  	<div><h5>배송방법</h5></div>
								  	<hr/>
								  	<div>갯수선택</div>
								  	<div><h2>주문금액 :   원</h2></div>
								  	<div>
								  		<button class="btn btn-outline-primary" onclick="location.href='${path}/order/cart'">장바구니</button>
								  		<button class="btn btn-primary" onclick="location.href='${path}/order/enterOrder'">바로구매</button>
							  		</div>
						  		</div>
						  	</div>
						  	<!-- 네비게이션 바 -->
						  	<div class="nav-container">
								<nav class="navbar navbar-expand-sm bg-light  itemnav ">
									<ul class="navbar-nav">
										<li class="nav-item">
										 	<a class="nav-link">상품정보</a>
										</li>
										<li>
										 	<a class="nav-link">리뷰</a>
										</li>
										<li>
										 	<a class="nav-link">문의</a>
										</li>
									</ul>
								</nav>
							</div>
							<div>
							밑에 정보줄 칸
							1
							2
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							6
							7
							8
							9
							
							</div>
					</div>
				</div>	
			</div>
		
			<!-- 오른쪽여백으로 분리 -->
			<jsp:include page="/WEB-INF/views/common/rightSide.jsp" />
		</div>
	</div>
	
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

