<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<div class="col-sm-2 sidebar bg-light">

	<nav class="navbar bg-light">
		<ul class="navbar-nav">
		    <li class="nav-item">
		      <a class="nav-link bg-light" href="${path }/cafe/searchCafe">CAFE</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link bg-light"  href="${path }/searchCoffee" data-toggle="collapse" data-target="#coffee">COFFEE</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link bg-light"  href="${path }/tea/searchTea" data-toggle="collapse" data-target="#coffee">TEA</a>
		    </li>
		     <li class="nav-item">
		      <a class="nav-link bg-light" href="${path }/">SALE</a>
		    </li>
	  	</ul>
	</nav>
	<nav id="coffee" class="navbar bg-light ml-2 collapse">
		<ul class="navbar-nav">
			<li><a class="nav-link bg-light" href="${path }/cafe/searchCoffee" >내취향 커피찾기</a></li>
			<li><a class="nav-link bg-light" href="${path }/coffee/allCoffee" >전체상품보기</a></li>
		</ul>
	</nav>
</div>