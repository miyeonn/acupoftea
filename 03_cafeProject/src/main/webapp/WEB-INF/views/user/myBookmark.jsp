<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/user/sidebar_myPage.jsp" />
<style>
 .img-container{ 
 width:300px;
 height:300px;
 			overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            }
             .card-img-top:hover{
      transform: scale(1.06);
      transition: transform 500ms cubic-bezier(0.165, 0.84, 0.44, 1) 0ms;
      
    
 }
 
 .card:hover{
 	box-shadow: 3px 3px 3px 3px gray;
 
 }
</style>
<section>
	<div class="container-fluid">
		<div class="row">
			<!-- 사이드바로 분리 -->
			<div class="col-sm-2 content"></div>
			<!-- 컨텐츠 -->
			<div class="col-sm-8">
			 		<div class="mt-5 row-vh d-flex flex-column text-center ">
			 			<div class="row-vh d-flex flex-column ">
			 				<div class="d-flex justify-content-center"><h3><b>스크랩북</b></h3></div>
			 				<div class="d-flex justify-content-center mt-3"><h5><b>아이디</b></h5></div>
			 			</div>
			 			<div style="width:500px;">
							<ul class="nav justify-content-center" >
							    <li class="nav-item">
							      <a class="nav-link active" href="${path }/user/myInfo">전체(갯수)</a>
							    </li>
							    <li class="nav-item">
							      <a class="nav-link " href="${path }/user/myBookmark">상품(갯수)</a>
							    </li>
							    <li class="nav-item">
							      <a class="nav-link "  href="${path }/order/cart">카페(갯수)</a>
							    </li>
						  	</ul>
						</div>
						<hr/>
						<div>
							<div class="card-container mt-3">
							  	<div class="card" style="width:15rem;">
							  	<c:forEach items="${list }" var="l">
							    	<div class="embed-responsive embed-responsive-1by1 ">
							    	<img class="card-img-top embed-responsive-item" src="${path }/resources/img/cafe1.jpg" alt="Card image" style="">
							    	</div>
							    	<div class="card-body">
							    		<c:if test="${l.cafe_no ne null }">
								      		<h4 class="card-title">${l.goods_title }</h4>
								      		<p class="card-text">${l.goods_price }/p>
								      		<p>일시품절</p>
							      		</c:if>
							      		<c:if test="${l.cafe_no eq null }">
								      		<h4 class="card-title">${l.cafe_title }</h4>
								      		<p class="card-text">${l.cafe_addr }</p>
								      		<p>일시품절</p>
							      		</c:if>
							    	</div>
							    </c:forEach>
							  	</div>
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

