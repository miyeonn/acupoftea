<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<style>
	#mainPhotoDiv{
		 width:500px ;
		height:400px; 
		background-color : white;
		background-position : center;
		background-repeat : no-repeat;
		background-size : cover;
		background-size : contain;

	}
	.coffeeImg{
		width:400px;
		height:500px;
	}
	
	.nav-container{
	 width:100%;
	 position: sticky; 
	top: 0;
	}
	.coffeeDetail{
	/* margin-left:20px; */
	}
	.smallImage-container{
		width:100px;
		
		margin-left:70px;
		
	}
	.smallImage{
	 /*  border-style:solid; */
	  width:100px;
	  height:100px;
	  overflow:hidden;
	  margin-bottom:5px;
	
	
	}
	.smallImage img{
	 width:inherit;
	 max-width:100%;
	 height:auto;
	 transition:0.2s ease-in-out;
	
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
			
				<!-- 커피사진,커피 관련내용 -->					
					<div class="border col-sm-7 mt-3">
						<div class="d-flex">	
							<div class="smallImage-container d-flex flex-column rounded" >
									<c:forEach items="${coffee.file_Names }" var="c" varStatus="status">
										<div class="smallImage rounded" >
											<img class="small" src="/img/cafe/${c}">
										</div>
									</c:forEach> 
							</div>
							<div id="mainPhotoDiv" class=" mx-auto img-fluid border rounded" style="background-image:url('/img/cafe/${coffee.main_image}')" ></div>
						</div>
						<div class="nav-container">
							<nav class="navbar navbar-expand-sm bg-light  itemnav bg-dark navbar-dark  ">
								<ul class="navbar-nav">
									<li class="nav-item">
									 	<a class="nav-link" href="#goodsDetail" >상품정보</a>
									</li>
									<li>
									 	<a class="nav-link" href="#goodsReview">리뷰</a>
									</li>
									<li>
									 	<a class="nav-link" href="#goodsQnA">문의</a>
									</li>
								</ul>
							</nav>
						</div>
						<div>
							<div id="goodsDetail" style="height:600px;">
								<h1>상품정보</h1>
								
							</div>
							<div id="goodsReview" style="height:600px;">
								<h1>상품후기</h1>
							</div>
							<div id="goodsQnA" style="height:600px;">
								<h1>상품문의</h1>
							</div>								
						</div>	
					</div>	
					<div class="col-sm-3 mt-3 coffeeDetail" style="width:300px;background-color:grey"v>
						  	<div><h2>${coffee.coffee_title }</h2></div>
						  	<div>
							  	<h5><i class="far fa-bookmark"></i>
							  	<!-- <i class="fas fa-bookmark"></i> -->
							  	<i class="fas fa-share-alt"></i></h5>
						  	</div>
						  	<div><h5>가격:${coffee.coffee_price }</h5></div>
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
			</div>
		
			<!-- 오른쪽여백으로 분리 -->
			<jsp:include page="/WEB-INF/views/common/rightSide.jsp" />
		</div>
	</div>
</section>
<script>
//사진 클릭시 큰사진으로 변경하기
var mainPic=document.querySelector("#mainPhotoDiv");
var smallPics=document.querySelectorAll(".small");
for(var i=0; i<smallPics.length;i++){
	smallPics[i].addEventListener("mouseover",changePic);
	
}

function changePic(){
	var smallPicAttribute=this.getAttribute("src");
	console.log(smallPicAttribute);
	var mainPicAttribute="background-image:url('"+smallPicAttribute+"')";
	console.log( mainPicAttribute);
	mainPic.setAttribute("style",mainPicAttribute);
}


</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

