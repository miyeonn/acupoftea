<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<style>
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


</style>

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
  

  <!-- Footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

