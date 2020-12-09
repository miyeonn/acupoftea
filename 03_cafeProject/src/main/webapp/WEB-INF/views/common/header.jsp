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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dd85c7c19c3d45f5bedf296de1914e7f"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/b5f4d53f14.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>메인 홈</title>
<style>
header{
height:210px;

}
	@font-face
	{
	src:url("../resources/fonts/Pacifico-Regular.ttf");
	font-family:"pcrr";
	}
	 #title
	 {
	 	font-family:"pcrr";
	 	color:#A01C32;
	 	text-decoration:none;
	 }
	 .header-wrap{
	 background-image:linear-gradient( rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4) ),url("../resources/img/main/coffeemain.jpg");
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
	line-height:43px;
	
	}
	.dropmenu ul li a:hover{
	background-color:#f4d35d;
	
	
	}
	
</style>
</head>
<body>
<header >
 	<div class="header-wrap" style="height:100%">
		<div class="head dropmenu">
			 <ul class="nav justify-content-end mr-5 " id="myPage_ul">
				    <li class="nav-item"><a class="nav-link">마이페이지</a>
				    	<ul>
				    		<li class="nav-item"><a class="nav-link" href="${path }/user/myInfo">내정보관리</a></li>
				    		<li class="nav-item"><a class="nav-link" href="${path }/user/myBookmark">북마크</a></li>
				    		<li class="nav-item"><a class="nav-link" href="${path }/order/cart">장바구니</a></li>
				    		<li class="nav-item"><a class="nav-link" href="${path }/order/myOrder">결제내역</a></li>
				    	</ul>
				    </li>
				    <li class="nav-item">|</li>
				    <c:if test="${loginUser!=null }">
				    <li class="nav-item">
				      <a class="nav-link" href="${path }/user/logOut">로그아웃</a>
				    </li>
				    </c:if>
				    <c:if test="${loginUser==null }">
				    <li class="nav-item">
				      <a class="nav-link" href="${path }/user/login">로그인</a>
				    </li>
				    </c:if>
			</ul>
		</div>
		<div class="text-center " >
		  <h1 id="title"><a id="title" href="${path}/common/home">A CUP OF TEA</a></h1>
		  <br>
		  <p class="">내 스타일의 카페와 커피를 만나보세요.</p> 
		</div>
	</div>
</header>
<script>
$(".dropmenu ul li").hover(function(){
	$(this).find("ul").stop().fadeToggle(500);
});



</script>