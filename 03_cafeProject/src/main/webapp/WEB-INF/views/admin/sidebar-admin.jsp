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
		      <a class="nav-link " href="${path }/admin/enrollCafe">카페 등록</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link " href="${path }/admin/enrollgoods">상품등록</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link "  href="${path }/admin/allUsers">이용자 정보관리</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link "  href="${path }/admin/stock">재고관리</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link "  href="${path }/admin/orderList">주문관리</a>
		    </li>
	  	</ul>
	</nav>
</div>