<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
<style>
	#palette
	{
	 /* display: inline-block; */
	 margin-left:150px;
	
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
	.card-container{
		margin-left:40px;
	
	}
	.cards{
	
	margin-left:90px;
	}

</style>

<section>
	<div class="container-fluid">
		<div class="row">
			<!-- 사이드바로 분리 -->
			<jsp:include page="/WEB-INF/views/common/leftSide.jsp" />
			
			<!-- 컨텐츠섹션으로 분리 -->
			<div class="col-sm-8 content">
			 	<div class="row justify-content-center" >
			 		
			<!-- 컨텐츠섹션으로 분리 -->
					<div class="col-sm-10  row-vh d-flex flex-column " style="width:100%">
						<div class="row mt-3 ">
						<!-- 반복문 출력  한줄에 세개씩!!-->
									
								<div class="cards d-flex flex-wrap" style="width:840px;">
									<c:forEach items="${cafeList }" var="c" >
								  	<div class="card-container mt-3"  onclick="clickCard('${c.cafe_No }')">
									  	<div class="card" style="width:15rem;">
									    	<div class="embed-responsive embed-responsive-1by1 ">
									    		<img class="card-img-top embed-responsive-item" src="/img/cafe/${c.main_image}" alt="Card image" style="">
									    		
									    	</div>
									    	<div class="card-body">
									      		<h4 class="card-title">${c.cafe_title }</h4>
									      		<p class="card-text">서울시 연남동</p>  		
									    	</div>
									  	</div>
									</div>
									</c:forEach>	
								</div>
							
						<!-- 반복문 끝 -->	
						</div>
				
						<div class="border">
					 		페이징
						</div>
					</div><!-- 컨텐츠 끝 -->
				</div>
			</div>
			<jsp:include page="/WEB-INF/views/common/rightSide.jsp" />
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />


</body>
<script>

//컬러 클릭했을때


//for문 돌아간 이후에는 각 coffeeno를 매개변수로 해서 넘겨지는 페이지를 다르게 해줌
function clickCard(cafeNo){
	
	location.href="${path}/cafe/cafeDetail?cafeNo="+cafeNo;
	
	}



</script>


</html>