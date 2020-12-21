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
		 width:500px ;
		height:400px; 
		background-color : white;
		background-position : center;
		background-repeat : no-repeat;
		background-size : cover;
		background-size : contain;

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
	.container{
		display:flex;
		align-items:center;
	
	}
	.smallImage-container{
		width:100px;
		
		margin-left:70px;
		
	}

	.btns {
	  height: 30px;
	  width: 40px;
	  background: none;
	  border: none;
	  font-size: 28px;
	  font-weight: 800;
	  color :#f4d35d;
	  z-index: 9999;
	  cursor:pointer;
	}
	
	i{
	font-size:30px;
	}
</style>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<section>
	<div class="container-fluid ">
		<div class="row ">
			<jsp:include page="/WEB-INF/views/common/leftSide.jsp" />		
				
			
			<!-- 컨텐츠섹션으로 분리 -->
			<div class="col-sm-8 content">
				<!-- 메인사진 &&설명 -->
				<div class="row">
					<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
							
						<div class=" col-sm-7 mt-3 mb-3">
							<div class="d-flex mb-3">
								
								<div class="smallImage-container d-flex flex-column  rounded" >
									<c:forEach items="${cafe.file_Names }" var="c" varStatus="status">
										<div class="smallImage rounded" >
											<img class="small" src="/img/cafe/${c}">
										</div>
									</c:forEach> 
							  	</div>
								<div id="mainPhotoDiv" class="mx-auto img-fluid rounded" style="background-image:url('/img/cafe/${cafe.main_image}')" ></div>
						  	</div>
						  	<hr/>
						  	<div class="">
						  		<div class="mb-2"style="font-size:25px;">위치정보</div>
								<div id="map" style="width:650px;height:400px;"></div>
							</div> 	
						</div>
						<div class="col-sm-3 mt-3 " style="width:300px">
							<div>
								<h2 id="cafeTitle">${cafe.cafe_title }</h2>
							</div>
							<div class="d-flex justify-content-end">
								<a  class="mr-2" href="javascript:clickBookMark('${cafe.cafe_No }')"><i id="bookmark" class="far fa-bookmark"></i></a>
								<a><i class="fas fa-share-alt"></i></a>
							</div>
							<div class="mb-1 mt-3">
							주소
							</div>
							<div class="mb-1">
							전화번호
							</div>
							<div class="mb-1">
							영업시간
							</div>
							<div class="mb-1">
							홈페이지
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
	smallPics[i].addEventListener("mouseover",changePic);
	
}

function changePic(){
	var smallPicAttribute=this.getAttribute("src");
	console.log(smallPicAttribute);
	var mainPicAttribute="background-image:url('"+smallPicAttribute+"')";
	console.log( mainPicAttribute);
	mainPic.setAttribute("style",mainPicAttribute);
}



//지도 api
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};

var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소가
geocoder.addressSearch('${cafe.cafe_address}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${cafe.cafe_title}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
}); 

//북마크 등록하기
var cafeNo='${cafe.cafe_No}';
var userNo='${loginUser.member_no}';
var insertList={
		cafeNo:cafeNo,
		userNo:userNo
};
console.log(insertList);
function clickBookMark(cafeNo){
	
	if(userNo==null||userNo==""){
		alert("로그인후 이용해주세요");
		location.href="${path}/user/login";
	}else{
	$.ajax({
		url:'${path}/user/insertBookMark',
		data:insertList,
		success:function(data){
			alert("북마크 등록 성공");
			bookmark.className="fas fa-bookmark";
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
 
</script>


</html>