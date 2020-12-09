<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style>
/* 	body{
		  background-image: url('#');
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
	
	
	} */
	#mainPhotoDiv{
		 width:750px ;
		height:400px; 
		background-color : #ddd;
		background-position : center;
		background-repeat : no-repeat;
		background-size : cover;
		background-size : contain;

	}
	.smallImage{
	  border-style:solid;
	  width:100px;
	  height:100px;
	  overflow:hidden;
	
	}
	.smallImage img{
	 width:inherit;
	 max-width:100%;
	 height:auto;
	 
	
	}
	.container{
		display:flex;
		align-items:center;
	
	}
	

</style>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<section>
	<div class="container-fluid">
		<div class="row">
			<!-- 사이드바로 분리 -->
				<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
			
			<!-- 컨텐츠섹션으로 분리 -->
			<div class="col-sm-9 content ">
				<!-- 메인사진 &&설명 -->
				<div class="row mt-3">
					<div class="col-sm-1"></div>
					<div class="border col-sm-7">
						<div id="mainPhotoDiv" class=" mx-auto img-fluid bg-dark" style="background-image:url('../resources/img/cafe1.jpg')" >				    	
						</div>
						<div class="container border " >
							<div class="smallImage" >
								<img class="small" src="${path }/resources/img/cafe1.jpg">
							</div>
							<div class="smallImage" >
								<img class="small" src="${path }/resources/img/cafe1_1.jpg">
							</div>
							<div class="smallImage">
								<img class="small"  src="${path }/resources/img/cafe1_2.jpg">
							</div>
					  	</div>
					  	
					</div>
					<div class="col-sm-3 pt-3" style="width:300px;background-color:grey">
						<table class="ml-2">
							<tr>
								<td colspan="2"><h2>대충유원지</h2></td>
							</tr>
							<tr>
								<td>주소:</td>
								<td></td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td></td>
							</tr>
							<tr>
								<td>영업시간</td>
								<td></td>
							</tr>
							<tr>
								<td>홈페이지</td>
								<td></td>
							</tr>					
						</table>
						
					</div>
					<div class="col-sm-1"></div>
				</div>
				<!-- 주소에 따른 지도 위치 marker표시 하기 카카오맵-->
				<div class="row mt-3">
					<div class="col-sm-1"></div>
					<div class="border col-sm-10">
						<div id="map" style="width:600px;height:400px;"></div>
					</div>
					<div class="col-sm-1"></div>
				</div>	
				<!-- 후기출력 -->
			
				
				
			</div><!-- 컨텐츠 끝 -->
			
			<!-- 샘플 출력용 -->
					<c:forEach items="${list}" var="l">
						<a>${l.cafeTitle }</a>
					</c:forEach>
			<!-- 오른쪽여백으로 분리 -->
			<jsp:include page="/WEB-INF/views/common/sidebar-right.jsp" />
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />


</body>
<script>

/* //가로세로의 비율을 유지하면서 사진을 출력하기 위해 
var div =  document.getElementById("mainPhotoDiv");// 이미지를 감싸는 div
var img = document.getElementById("mainPhoto");// 이미지
var divAspect = 400 / 750; // div의 가로세로비는 알고 있는 값이다
var imgAspect = img.height / img.width;

if (imgAspect <= divAspect) {
    // 이미지가 div보다 납작한 경우 세로를 div에 맞추고 가로는 잘라낸다
    var imgWidthActual = div.offsetHeight / imgAspect;
    var imgWidthToBe = div.offsetHeight / divAspect;
    var marginLeft = -Math.round((imgWidthActual - imgWidthToBe) / 2);
    img.style.cssText = 'width: auto; height: 100%; margin-left: '
                      + marginLeft + 'px;'
} else {
    // 이미지가 div보다 길쭉한 경우 가로를 div에 맞추고 세로를 잘라낸다
    img.style.cssText = 'width: 100%; height: auto; margin-left: 0; -webkit-transform: translate(-50%,-50%); 
    -ms-transform: translate(-50%,-50%); transform: translate(-50%,-50%)';


} */

//사진 클릭시 큰사진으로 변경하기
var mainPic=document.querySelector("#mainPhotoDiv");
var smallPics=document.querySelectorAll(".small");
for(var i=0; i<smallPics.length;i++){
	smallPics[i].addEventListener("click",changePic);
	
}

function changePic(){
	var smallPicAttribute=this.getAttribute("src");
	console.log(smallPicAttribute);
	var mainPicAttribute="background-image:url('.."+smallPicAttribute+"')";
	console.log( mainPicAttribute);
	mainPic.setAttribute("style",mainPicAttribute);
}

var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};

var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
 


</script>


</html>