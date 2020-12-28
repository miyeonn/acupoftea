<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dd85c7c19c3d45f5bedf296de1914e7f&libraries=services"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 결제api -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" ></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/b5f4d53f14.js" crossorigin="anonymous"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- web socket -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<meta charset="UTF-8">
<title>메인 홈</title>
<style>
header{
height:220px;

}
	@font-face
	{
	src:url("${path}/resources/fonts/Pacifico-Regular.ttf");
	font-family:"pcrr";
	}
	 #title
	 {
	 	font-family:"pcrr";
	 	color:#A01C32;
	 	text-decoration:none;
	 }
	 .header-wrap{
	 background-image:linear-gradient( rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4) ),url("${path}/resources/img/main/coffeemain.jpg");
	 }

	#myPage_ul{
	min-width:300px;
	
	text-align:center;
	}
	.dropmenu{
	background-color:#white;
	}
	.dropmenu ul ul{
	position:absolute;
	display:none;
	
	}
	.dropmenu ul ul li{
	display:block;
	background-color:#a1775a;
	color:blue;
	}
	.dropmenu ul li{
	display:inline-block;
	margin-left:-5.5px;
	
	}
	.dropmenu ul li a{
	display:block;
	width:150px;
	color:white;
	text-decoration:none;
	line-height:30px;
	
	}
	.dropmenu ul li a:hover{
	background-color:#f4d35d;
	
	
	}
html,body{height:100%}
body{margin:0}
.container-fluid{min-height:100%;padding-bottom:1.9em}
#content{padding-bottom:1.9em}
.footer{margin-top:-1.9em;height:1.9em}
}

</style>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">
<header >
 	<div class="header-wrap" style="height:100%">
 		<div id="socketAlert" class="alert alert-success" style="display:none;">
		</div>
		<div class="head dropmenu">
			 <ul class="nav justify-content-end mr-5 " id="myPage_ul">
			 		<c:if test="${loginUser!=null && loginUser.member_id ne 'aldus9302@gmail.com' }">
				    <li class="nav-item"><a class="nav-link">마이페이지</a>
				    	<ul>
				    		<li class="nav-item"><a class="nav-link" href="${path }/user/myInfo?memberNo=${loginUser.member_no }">내정보관리</a></li>
				    		<li class="nav-item"><a class="nav-link" href="${path }/user/myBookmark?memberNo=${loginUser.member_no }">북마크</a></li>
				    		<li class="nav-item"><a class="nav-link" href="${path }/order/cart?memberNo=${loginUser.member_no }">장바구니</a></li>
				    		<li class="nav-item"><a class="nav-link" href="${path }/order/myOrder?memberNo=${loginUser.member_no }">결제내역</a></li>
				    	</ul>
				    </li>
					</c:if>
				  	<c:if test="${loginUser.member_id eq'aldus9302@gmail.com' }">
				  		<li class="nav-item mt-1">
				  			<button type="button" class="btn btn-light">
								 <i class="far fa-bell"></i> <span class="badge badge-danger">4</span>
								</button>
				  		</li>
					    <li class="nav-item">
					      <a class="nav-link" href="${path }/admin/adminPage">관리자 페이지</a>
					    </li>
				    </c:if>   
				    <li class="nav-item">|</li>
				    <c:if test="${loginUser!=null }">
					    <li class="nav-item">
					      <a class="nav-link" href="${path }/user/logout">로그아웃</a>
					    </li>
				    </c:if>
				    <c:if test="${loginUser==null }">
					    <li class="nav-item">
					      <a class="nav-link" href="${path }/user/login">로그인/회원가입</a>
					    </li>
				    </c:if>
			 </ul>
		</div>
		<div class="text-center " >
		  <h1 id="title"><a id="title" href="${path}/home">A CUP OF TEA</a></h1>
		  <br>
		  <p class="">내 스타일의 카페와 커피를 만나보세요.</p> 
		</div>
	</div>
</header>
<script>
$(".dropmenu ul li").hover(function(){
	$(this).find("ul").stop().fadeToggle(500);
});
$(document).ready( function() {
    connectWS();	
});

var socket=null;
function connectWS(){
	
	var ws=new WebSocket("ws://localhost:8080/replyEcho");//브라우저 자체지원 웹소켓
	socket=ws;
	ws.onopen=function(){//연결되었을때
		console.log('info:connection opened');
		
		
	}
	ws.onmessage=function(event){
		console.log(event.data+"\n");
        let socketAlert = $('#socketAlert');
        socketAlert.html(event.data);
        socketAlert.css('display', 'block');
        
        setTimeout( function() {
        	$socketAlert.css('display', 'none');
        }, 3000);
	};
	
	ws.onclose=function(event){
		console.log("Info:connection closed");
		setTimeout(function(){connectWs();},1000);//연결이 끊어지게 된다면 다시 연결
		};
	ws.onerror=function(event){console.log("Info:connection error");};
}


 // toast생성 및 추가
    function onMessage(evt){
        var data = evt.data;
        // toast
        let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
        toast += "<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>";
        toast += "<small class='text-muted'>just now</small><button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>";
        toast += "<span aria-hidden='true'>&times;</span></button>";
        toast += "</div> <div class='toast-body'>" + data + "</div></div>";
        $("#msgStack").append(toast);   // msgStack div에 생성한 toast 추가
        $(".toast").toast({"animation": true, "autohide": false});
        $('.toast').toast('show');
    };



</script>