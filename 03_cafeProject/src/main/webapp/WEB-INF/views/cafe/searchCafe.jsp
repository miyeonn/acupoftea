<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<style>
	#palette
	{
	 /* display: inline-block; */
	 margin-left:20%;
	
	}
	
	
	.btn
	{
		width:70px;
		text-decoration:none;
		cursor:pointer;
		outline:0;
		border:none;
		border-radius:2px;
		display:inline-block;
		height:36px;
		line-height:100px;
		padding:16px;	
		
	}

    .btn:hover
    {
      box-shadow: 0 3px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 7px 0 rgba(0, 0, 0, 0.12),
        0 3px 1px -1px rgba(0, 0, 0, 0.2);
    }

    .paletteBox{
     /* margin-left: 500px; */
    
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
			
			<!-- 컨텐츠섹션으로 분리 -->
			<div class="col-sm-8 content">
			 	<div class="row " >
			 		<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
			<!-- 컨텐츠섹션으로 분리 -->
					<div class="col-sm-10  row-vh d-flex flex-column " style="width:100%">
						<div id="palette" class="border row-vh d-flex flex-column" style="width:100%">
							<div class="paletteBox  mt-3 border ">
								<% String[]colors=
									{
									  "#E91E63",
									  "#FF9800",
									  "#FFEB3B",
									  "#4CAF50",
									  "#2196F3",
									  "#3F51B5",
									  "#9C27B0",
									  "#9E9E9E",
									  "#795548",
									  "black"
									  
									};%>
						
						<%for(int i=0;i<10;i++) {%>
						<div class='btn ' onclick='handlePickColor(<%=i%>)' style='background-color:<%=colors[i]%>'></div>
						<%} %>
							</div>
						</div>
				
						<div class="row mt-3">
						<!-- 반복문 출력  한줄에 세개씩!!-->		
							<div class="">
							  	<div class="card-container mt-3">
								  	<div class="card" style="width:15rem;">
								    	<div class="embed-responsive embed-responsive-1by1 ">
								    		<img class="card-img-top embed-responsive-item" src="${path }/resources/img/cafe1.jpg" alt="Card image" style="">
								    	</div>
								    	<div class="card-body">
								      		<h4 class="card-title">대충유원지</h4>
								      		<p class="card-text">서울시 연남동</p>
								      		
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
				</div>
			</div>
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


</body>
<script>

//컬러 클릭했을때
function handlePickColor(k){
	
	location.href='/cafe/searchCafeByColor?color='+k;
	
}

//for문 돌아간 이후에는 각 coffeeno를 매개변수로 해서 넘겨지는 페이지를 다르게 해줌
var enterImg=document.getElementsByClassName("card-container")[0];
console.log(enterImg);
enterImg.onclick=function(){
	location.href="${path}/cafe/cafeDetail"};




</script>


</html>