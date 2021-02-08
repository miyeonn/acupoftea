<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
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
	.reviewImg{

	width:100px;
	height:100px;
	
	}
	i{
	font-size:30px;
	}
	.text-title{
	font-size:20px}
</style>
<section>
	<div class="container-fluid">
		<div class="row">
			<!-- 사이드바로 분리 -->
			<jsp:include page="/WEB-INF/views/common/leftSide.jsp" />			
			<!-- 컨텐츠섹션으로 분리 -->
			<div class="col-sm-8 content">
				<div class="row">
			
				<!-- 커피사진,커피 관련내용 -->					
					<div class=" col-sm-7 mt-3">
						<div class="d-flex mb-3">	
							<div class="smallImage-container d-flex flex-column rounded" >
									<c:forEach items="${coffee.file_Names }" var="c" varStatus="status">
										<div class="smallImage rounded" >
											<img class="small" src="/img/cafe/${c}">
										</div>
									</c:forEach> 
							</div>
							<div id="mainPhotoDiv" class=" mx-auto img-fluid  rounded" style="background-image:url('/img/cafe/${coffee.main_image}')" ></div>
						</div>
						<div class="nav-container">
							<nav class="navbar navbar-expand-sm bg-light  itemnav bg-dark navbar-light ">
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
								<div class="d-flex  justify-content-around">
									<div class="d-flex flex-column">
										<span><h3>총 평점</h3></span>
										<div>
											<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i>
										</div>
									</div>
									<div class="d-flex flex-column">
										<span><h3>리뷰 수</h3></span>
										<div>
											100
										</div>
									</div>
								</div>
								<div class="row d-flex ">
									<div class="ml-3 col-sm-6">
										<div><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i></div>
									 	<div><span>아이디</span><span>/리뷰날짜</span></div>
									 	<div>리뷰내용</div>
									</div>
									<div class="col-sm-2 reviewImg border">이미지</div>
								</div>
								
							</div>
							<div id="goodsQnA" style="height:600px;">
								<h1>상품문의</h1>
							</div>								
						</div>	
					</div>	
					<div class="col-sm-3 mt-3 pt-3 coffeeDetail" style="width:300px;">
						  	<div><h3>${coffee.coffee_title }</h3></div>
						  	<div class="d-flex justify-content-end ">
							  	<a class="mr-2" href="javascript:clickBookMark('${coffee.goods_no }')"><i id="bookmark"  class="far fa-bookmark"></i></a>
							  	<!-- <i class="fas fa-bookmark"></i> -->
							  	<a href="javascript:clickShare('${coffee.goods_no }')"><i class="fas fa-share-alt"></i></a>
						  	</div>
						  	<div class="text-title">가격:<span name="goodsPrice">${coffee.coffee_price }</span></div>
						  	<hr/>
						  	<div class="text-title"><!-- 재고 10개이하일경우 품절임박표시 --></div>
						  	<div class="d-none" id="stockCount">10</div>
						  	<div class="text-title">갯수선택</div>
						  	<div class="d-flex">
						  		<button type ="button" onclick="fnCalCount('m');">-</button>
						  		<input type="text" name="pop_out" value="1" readonly="readonly" style="text-align:center;"/>
						  		<button type ="button" onclick="fnCalCount('p');">+</button>
						  	</div>
						  	<div class="text-title">주문금액 :<span name="totalPrice"></span>   원</div>
						  	<div>
						  		<button class="btn btn-outline-primary" onclick="addCart('${coffee.goods_no}');">장바구니</button>
						  		<button class="btn btn-primary" onclick="orderNow('${coffee.goods_no}');">바로구매</button>
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


function fnCalCount(type){
	var input=document.querySelector('input[name="pop_out"]');
	var iCount=parseInt(input.value);
	console.log(iCount);
	//재고수량
	var sCount=parseInt(document.querySelector('#stockCount').innerHTML);
	console.log("재고수량:"+sCount);
	
    if(type=='p'){
    	//재고 수량보다 주문수량 적을경우
        if(iCount < sCount) input.value=parseInt(iCount)+1;
        else alert("주문수량이 재고 수량 보다 많습니다");
    	fnCalAmount(input.value);
    }else{
    	//주문수량이 0이하로는 안가게
        if(iCount >1) input.value=iCount-1;;    
        fnCalAmount(input.value);
        }
	
}


function fnCalAmount(value){
	//총 주문금액 계산
	var price=parseInt(document.querySelector('span[name="goodsPrice"]').innerHTML);
	console.log("가격:"+price);
	var totalInput=document.querySelector('span[name="totalPrice"]');
	var totalPrice=value*price;
	
	totalInput.innerHTML=addComma(totalPrice);
	
}

function addComma(num) {
	//3자리 마다 콤마 추가
	  var regexp = /\B(?=(\d{3})+(?!\d))/g;
	  return num.toString().replace(regexp, ',');
	}
	

function addCart(goodsNo){
	
	var userNo='${loginUser.member_no}';
	var goodsQty=document.querySelector('input[name="pop_out"]').value;
	var insertList={
			goodsNo:goodsNo,
			userNo:userNo,
			goodsQty:goodsQty
	};
	
	
	if(userNo==null||userNo==""){
		alert("로그인후 이용해주세요");
		location.href="${path}/user/login";
	}
	else{
	$.ajax({
		url:'${path}/order/addcart',
		data:insertList,
		success:function(data){
			if(data.result>0){
			alert("상품이 장바구니에 담겼습니다 ");
			}else{
			alert("장바구니 등록 오류");
				
			}
			
			}	
		})
	}	
}
//북마크 등록하기
var goodsNo='${coffee.goods_no}';
var userNo='${loginUser.member_no}';
var insertList={
		goodsNo:goodsNo,
		userNo:userNo
};
console.log(insertList);
function clickBookMark(goodsNo){
	
	if(userNo==null||userNo==""){
		alert("로그인후 이용해주세요");
		location.href="${path}/user/login";
	}else{
	$.ajax({
		url:'${path}/user/insertBookMark',
		data:insertList,
		success:function(data){
			if(data.result>0){
			alert("북마크 등록 성공");
			bookmark.className="fas fa-bookmark";
			}else{
				alert("북마크 등록 실패");
			}
			}	
		})
	}
}



var bookmark=document.getElementById("bookmark");
console.log(bookmark);

//북마크에 저장되어있는 카페인지 확인
$(function(){
			$.ajax({
				url:'${path}/user/selectBookMark',
				data:insertList,
				success:function(data){
						console.log(data.flag);
					if(data.flag==true){
						//이미 저장되어있음(색깔)
					
					 bookmark.className="fas fa-bookmark";
						
					}else{
						//
					bookmark.className="far fa-bookmark";
					}					
					
				}			
				
			})
		
		})  
/* 		Kakao.init('dd85c7c19c3d45f5bedf296de1914e7f');
function clickShare(){

Kakao.Link.sendDefault({
			headers={
					"Authorization":"Bearer"+
				}
			  objectType: 'feed',//고정값
			  content: {
			    title: '${coffee.coffee_title }',
			    description: '아메리카노, 빵, 케익', //디테일 정보
			    imageUrl:
			      'http://mud-kage.kakao.co.kr/dn/NTmhS/btqfEUdFAUf/FjKzkZsnoeE4o19klTOVI1/openlink_640x640s.jpg',
			    link: { //콘텐츠 클릭시 이동할 링크 정보
			      mobileWebUrl: 'https://localhost:8080/coffee/coffeeDetail?coffeeNo=${coffee.goods_no}',
			      androidExecParams: 'test',
			    },
			  },
			  social: {
			    likeCount: 10,
			    commentCount: 20,
			    sharedCount: 30,
			  },
			  buttons: [
			    {
			      title: '웹으로 이동',
			      link: {
			        mobileWebUrl: 'https://localhost:8080/',
			      },
			    },
			     {
			      title: '앱으로 이동',
			      link: {
			        mobileWebUrl: 'https://developers.kakao.com',
			      }, 
			    },
			  ]
			});
} */

function orderNow(goodsNo){
	
	var goodsQty=document.querySelector('input[name="pop_out"]').value;
	
	location.href='${path}/order/enterOrder?goodsNo='+goodsNo+'&qty='+goodsQty;
	
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

