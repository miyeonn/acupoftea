<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
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
  .W-container{
 	min-height:500px;
 
 }
</style>
<section>
	<div class="W-container container-fluid">
		<div class="row">
			<!-- 사이드바로 분리 -->
			<div class="col-sm-2 content"></div>
			<!-- 컨텐츠 -->
			<div class="col-sm-8">
			 		<div class="mt-5  ">
			 			<div class="row-vh d-flex flex-column ">
			 				<div class="d-flex justify-content-center"><h3><b>스크랩북</b></h3></div>
			 				<div class="d-flex justify-content-center mt-3"><h5><b><%=loginUser.getMember_id()%>님의 스크랩북</b></h5></div>
			 			</div>
			 			<div class="border-bottom" >
			 				<nav class="navbar navbar-expand-sm justify-content-center">
								<ul class="navbar-nav">
								    <li class="nav-item">
								      <a class="nav-link active" href="${path }">전체</a>
								    </li>
								    <li class="nav-item">
								      <a class="nav-link " href="${path }">상품</a>
								    </li>
								    <li class="nav-item">
								      <a class="nav-link "  href="${path }">카페</a>
								    </li>
							  	</ul>
						  	</nav>
						</div>			
			 		</div>
			 		<div class="d-flex"onclick="bookmarkDetail();">
			 			<c:if test="${empty list}">
							<div class="text-center pt-5 pb-5" >
								아직 스크랩한 콘텐츠가 없습니다.
								마음에드는 콘텐츠를 스크랩 해보세요.
							</div>
						</c:if>
			 			<c:forEach items="${list }" var="l">
			 				<div class="ml-5 mt-3 rounded">
			 					<img src="/img/cafe/${l.main_image }" width="200px;" height="200px;"/>
			 				</div>
			 			</c:forEach>
			 		</div>
			 		 				 			 
			</div>
			<!-- 오른쪽여백으로 분리 -->
			<jsp:include page="/WEB-INF/views/common/rightSide.jsp" />
		</div>
	</div>
</section>
<script>
	function bookmarkDetail(){
		//해당 북마크의 페이지로 이동하기 
		
		
	}

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

