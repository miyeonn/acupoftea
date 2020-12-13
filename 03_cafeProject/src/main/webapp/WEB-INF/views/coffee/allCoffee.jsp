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
			<div class="col-sm-2 content"></div>
			
			<!-- 컨텐츠섹션으로 분리 -->
			<div class="col-sm-8 content">
			 	<div class="row " >
			 		<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
			<!-- 컨텐츠섹션으로 분리 -->
					<div class="col-sm-10  row-vh d-flex flex-column " style="width:100%">
						<div class="row mt-3">
						<!-- 반복문 출력  한줄에 세개씩!!-->
									
								<div class="cards d-flex flex-wrap" style="width:840px;">
									<c:forEach items="${coffeeList }" var="c" >
								  	<div class="card-container mt-3"  onclick="clickCard('${c.coffee_no }')">
									  	<div class="card" style="width:15rem;">
									    	<div class="embed-responsive embed-responsive-1by1 ">
									    		<img class="card-img-top embed-responsive-item" src="/img/cafe/${c.main_image}" alt="Card image" style="">
									    		
									    	</div>
									    	<div class="card-body">
									      		<h4 class="card-title">${c.coffee_title }</h4>
									      		<p class="card-text">${c.coffee_price }</p>  		
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
<jsp:include page="/WEB-INF/views/common/footer.jsp" />



<script>
//for문 돌아간 이후에는 각 coffeeno를 매개변수로 해서 넘겨지는 페이지를 다르게 해줌
function clickCard(coffeeNo){
	
	location.href="${path}/coffee/coffeeDetail?coffeeNo="+coffeeNo;
	
	}


</script>
