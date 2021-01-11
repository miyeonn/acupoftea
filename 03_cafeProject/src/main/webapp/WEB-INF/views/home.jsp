<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
<style>
	.hometext-title{
	 font-family:'Noto Sans KR', sans-serif;
	
	}
    .card-img-top:hover{
     transform: scale(1.06);
     transition: transform 500ms cubic-bezier(0.165, 0.84, 0.44, 1) 0ms;
     
 	}
 
	 .card:hover{
	 	box-shadow: 3px 3px 3px 3px gray;
	 
	 }
 	.btns {
 		border:solid 1px black;
	  height: 380px;
	  width: 80px;
	  background: none;
	  /* border: none; */
	  font-size: 28px;
	  font-weight: 800;
	  color :#8c5a53;
	  z-index: 9999;
	  cursor:pointer;
	}
	button:focus{ 	
    border: none;
    outline:none;
    }
	/*
	.left {position: absolute; top:0;left:0;}
.right{position: absolute; top:0; right:0;}
	.slide{
  width: 100%;
  height: 500px;
  display: flex;
  justify-content: center;
  align-items: center;
  color:white;
  position: absolute;
  top: 0 ;
  opacity: 0;
  transition: all 1.0s ease-in-out ;
}
.slider{
  
  position: relative;
 
}
*/
.card-container{
margin-left:30px;
}
.slide-wrapper{
position:relative;
width:810px;
margin:0 auto;
height:380px;
overflow:hidden;
}

.slides{
position:absolute;
left:0;top:0;
transition:left 0.5s ease-out;

}
.item_slides{
position:absolute;
left:0;top:0;
transition:left 0.5s ease-out;

}


</style>

<section>
	<div class="container-fluid">
		<div class="row">
			<!-- 사이드바로 분리 -->
			<div class="col-sm-2 content"></div>
			
			<!-- 컨텐츠섹션으로 분리 -->
			<div class="col-sm-8 content">
			 	<div class="row">
			 		
			 		<div class="col-sm-12 mt-3 border">
				 		<div class="border ">
				 			<h4 class="hometext-title ml-3"><b>최근 추가된 카페</b></h4>
				 			<div class="d-flex  pl-4 pr-4 ">
				 					<div class="ml-5">
				 					<button class="left btns "><i class="fas fa-angle-left"></i></button>
				 					</div>
				 					<div class="slide-wrapper border">
					 					<div class=" d-flex slides">
					 						<c:forEach items="${cafeList }" var="c" varStatus="status">
											  	<div class="card-container mt-3  ">
												  	<div class="card" style="width:240px;">
												    	<div class="embed-responsive embed-responsive-1by1 ">
												    		<img class="card-img-top embed-responsive-item" src="/img/cafe/${c.main_image}" alt="Card image" style="">
												    	</div>
												    	<div class="card-body">
												      		<h4 class="card-title">${c.cafe_title}</h4>
												      		<p class="card-text">서울시 연남동</p>	
												    	</div>
												  	</div>
												</div>
											</c:forEach>							
										</div>
									</div>
									<button  class="right btns" ><i class="fas fa-angle-right"></i></button>
							</div>
				 		</div>
				 		<hr/>
		 		 		<div>
				 			<h4 class="hometext-title ml-3"><b>인기 아이템</b></h4>
								<div class="d-flex justify-content-around pl-4 pr-4">
									<div class="ml-5">
				 					<button class="item-left btns"><i class="fas fa-angle-left"></i></button>
				 					</div>
				 					<div class="slide-wrapper">
					 					<div class=" d-flex item_slides">
					 						<c:forEach items="${coffeeList }" var="cf">
										  	<div class="card-container mt-3  ">
											  	<div class="card" style="width:240px;">
											    	<div class="embed-responsive embed-responsive-1by1 ">
											    		<img class="card-img-top embed-responsive-item" src="/img/cafe/${cf.main_image }" alt="Card image" style="">
											    	</div>
											    	<div class="card-body">
											      		<h4 class="card-title">${cf.coffee_title }</h4>
											      		<p class="card-text">${cf.coffee_price }</p>
											      		
											    	</div>
											  	</div>
											</div>	
											</c:forEach>						
										</div>
									</div>
									<button  class="item-right btns" ><i class="fas fa-angle-right"></i></button>
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
<script>
//최근 추가된 카페 슬라이드
var slides=document.querySelector(".slides");
var slide=document.querySelectorAll(".slides .card-container");//배열값
var currentIdx=0;
var slideCount=slide.length;
var prevBtn=document.querySelector(".left");
var nextBtn=document.querySelector(".right");
var slideWidth=240;
var slideMargin=30;

slides.style.width=(slideWidth+slideMargin)*slideCount-slideMargin +"px";


function moveSlide(num){
	//왼쪽으로 슬라이드가 이동해야 하므로 -
	slides.style.left=-num*(slideWidth+slideMargin)+"px";
	currentIdx=num;	
}

//3을 빼는 이유는 슬라이드의 끝이아니라 공백이 끝나는 숫자
nextBtn.addEventListener('click',function(){
	if(currentIdx < slideCount-3){
		
	moveSlide(currentIdx+1);
	
	}else{
		//첫 슬라이드로
		moveSlide(0);
	}
});
prevBtn.addEventListener('click',function(){
	if(currentIdx >0){
		
		moveSlide(currentIdx-1);
	
	}else{
		//끝 슬라이드로
		moveSlide(slideCount-3);
	}
});
//인기있는 아이템 슬라이드
var item_slides=document.querySelector(".item_slides");
var item_slide=document.querySelectorAll(".item_slides .card-container");//배열값
var item_currentIdx=0;
var item_slideCount=item_slide.length;
var item_prevBtn=document.querySelector(".item-left");
var item_nextBtn=document.querySelector(".item-right");
var item_slideWidth=240;
var item_slideMargin=30;

item_slides.style.width=(item_slideWidth+item_slideMargin)*item_slideCount-item_slideMargin +"px";


function item_moveSlide(num){
	
	item_slides.style.left=-num*(item_slideWidth+item_slideMargin)+"px";
	item_currentIdx=num;	
}


item_nextBtn.addEventListener('click',function(){
	if(item_currentIdx < item_slideCount-3){
		item_moveSlide(item_currentIdx+1);
		
	}else{
		//첫 슬라이드로
		item_moveSlide(0);
	}
});

item_prevBtn.addEventListener('click',function(){
	if(item_currentIdx >0){
		
		item_moveSlide(item_currentIdx-1);
	
	}else{
		//끝 슬라이드로
		item_moveSlide(item_slideCount-3);
	}
});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

