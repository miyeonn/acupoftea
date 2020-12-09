<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<style>
.nav-item{
font-weight:bolder;

margin-left:20px;
margin-right:20px;
}
.nav-link{
color:black;
}
</style>
<div class="sidebar  border-bottom">
	<nav class="navbar navbar-expand-sm justify-content-center">
		<ul class="navbar-nav">
		    <li class="nav-item">
		      <a class="nav-link " href="${path }/user/myInfo">내정보관리</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link " href="${path }/user/myBookmark">북마크</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link "  href="${path }/order/cart">장바구니</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link "  href="${path }/order/myOrder">결제내역</a>
		    </li>
	  	</ul>
	</nav>
</div>