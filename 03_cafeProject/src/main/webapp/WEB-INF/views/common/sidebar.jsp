<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<style>
#sidebar{
background-color:rgba(54,21,14,.7);

}
.nav-link{
color:white;
}

</style>


	<nav class="navbar navbar-expand-sm justify-content-center" id="sidebar">
		<ul class="navbar-nav">
		    <li class="nav-item mr-3">
		      <a class="nav-link " href="${path }/cafe/searchCafe">CAFE</a>
		    </li>
		    <li class="nav-item mr-3">
		      <a class="nav-link "  href="${path }/coffee/allCoffee" >COFFEE</a>
		    </li>
		    <li class="nav-item mr-3">
		      <a class="nav-link "  href="${path }/tea/searchTea"  >TEA</a>
		    </li>
		     <li class="nav-item mr-3">
		      <a class="nav-link " href="${path }/">SALE</a>
		    </li>
	  	</ul>
	</nav>
<%-- 	<nav id="coffee" class="navbar bg-light ml-2 collapse">
		<ul class="navbar-nav">
			<li><a class="nav-link bg-light" href="${path }/cafe/searchCoffee" >내취향 커피찾기</a></li>
			<li><a class="nav-link bg-light" href="${path }/coffee/allCoffee" >전체상품보기</a></li>
		</ul>
	</nav> --%>
