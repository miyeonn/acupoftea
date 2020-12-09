<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" %>

<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="${path }/resources/js/d3.js"></script>
<%-- <script src="${path }/resources/js/korea.js"></script> --%>
<title>Home</title>
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/themes/base/jquery-ui.css" />
<link rel="stylesheet" href="${path }/resources/css/map_css.css">
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
</head>
<body>
	
	<div id="container" class="container">
		<a href="${path }/palette">팔레트 연습</a>
		<div id="radio">
		<span class="title">지명표시</span>
	    <input type="radio" id="radio1" name="radio" value="on" checked><label for="radio1">On</label>
	    <input type="radio" id="radio2" name="radio" value="off"><label for="radio2">Off</label>
	  	</div>
	  
	  <div id="control" class="ui-widget-header ui-corner-all" style="top:140px;">
		  <button id="zoomin">확대</button>
		  <button id="zoomout">축소</button>
		</div>
	</div>
	<a href="${path}/common/home">메인페이지</a>
	<script src="${path }/resources/js/map_script.js"></script>
</body>