<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- 전체 커피에서는 최근 등록순으로 보여준다 -->
<style>
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
			<jsp:include page="/WEB-INF/views/common/leftSide.jsp" />	
			<!-- 컨텐츠섹션으로 분리 -->
			<div class="col-sm-8">
				<div class="row  h-100">
				<!-- 반복문 출력 한줄에 세개씩!! -->
					<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
					<div class="col-sm-10">
						<div class="card-container mt-3">
						  	<div class="card" style="width:15rem;">
						    	<div class="embed-responsive embed-responsive-1by1 ">
						    	<img class="card-img-top embed-responsive-item" src="${path }/resources/img/cafe1.jpg" alt="Card image" style="">
						    	</div>
						    	<div class="card-body">
						      		<h4 class="card-title">네스프레소</h4>
						      		<p class="card-text">15,000₩</p>
						      		<p>일시품절</p>
						    	</div>
						  	</div>
						</div>
					</div>
				<!-- 반복문 끝 -->
				</div>
				
				<div class="border">
			 		페이징
				</div>
			</div><!-- 컨텐츠 끝 -->
			
			<!-- 샘플 출력용 -->
					<c:forEach items="${list}" var="l">
						<a>${l.cafeTitle }</a>
					</c:forEach>
			<!-- 오른쪽여백으로 분리 -->
			<jsp:include page="/WEB-INF/views/common/rightSide.jsp" />
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />



<script>
//for문 돌아간 이후에는 각 coffeeno를 매개변수로 해서 넘겨지는 페이지를 다르게 해줌
var enterImg=document.getElementsByClassName("card-container")[0];
console.log(enterImg);
enterImg.onclick=function(){
	location.href="${path}/coffee/coffeeDetail"};




</script>
