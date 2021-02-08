<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<style>
    .guide{
   		display:none;
   /* 		font-size: 14px;
   		position:absolute;   */
   		
	} 

</style>
<section>
	<div class="container-fluid">
		<div class="row">
			<!-- 사이드바로 분리 -->
			<div class="col-sm-2 content"></div>
			
			<!-- 컨텐츠섹션으로 분리 -->
			<div class="col-sm-8 content">
			 	<div class="row">
			 		
			 	
			 		
			 		<div class="container" id="container">

				        <div class="row-vh d-flex flex-row">
				
				            <div class="item mx-auto align-self-center">
				                <br>
				                <h1 class="display-4 text-center pt-4">회원가입</h1>
				                <form action="${path }/user/joinUserEnd" name="joinfrm" method="post" >                   
									<br>
				                    <h6>
				                    	<i class="icon fas fa-user"></i>&nbsp;아이디
				                    </h6>
				                      <div class="mb-3" id="userId-container">       
				                        <input style=" border: none; border-bottom: solid 1px #FFE3E3; border-radius:0;" 
				                        		type="text" class="form-control" placeholder="아이디를 4글자 이상 입력하세요"  name="userId" id="userId" >				                    
				                      </div>
				                      <div class="alert alert-danger guide letter">아이디를 4글자 이상 입력하세요.</div>		
				                      <div class="alert alert-success guide ok">이 아이디는 사용이 가능합니다.</div>
									  <div class="alert alert-danger guide error">이미 사용중인 아이디입니다.</div>
				                        <script>
				                          $(function(){
				                			$("#userId").keyup(function(){
				                				const id=$(this).val();
				                				if(id.trim().length<4){
				                					$(".guide.letter").show();
													return;
												}
				                				 if(id.trim().length>4){ 
				                					$.ajax({
				                						url:"${path}/user/checkId",
				     
				                						data:{userId:id},
				                						success:function(data){
				                							if(!data.flag){
				                								$(".guide.ok").hide();
				                								$(".guide.error").show();
				                							}else{
				                								$(".guide.ok").show();
				                								$(".guide.error").hide();
				                							}
				                						},
				                						error:function(request,status,error){
				                						    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}

				                					
				                					});
				                				 }else{
				                					$(".guide").hide();
				                					return;
				                				} 
				                			})
				                		})  
				/* 						function fn_checkId(){
											var userId = $("#userId_").val();
											if(userId.trim().length<4){
												alert("아이디를 4글자이상 입력하세요!");
												return;
											}
											var url = "${path}/user/checkId.do?userId=" + userId;
											var status = "height=200px, width=300px";
											open(url, "_blank", status); 
				 						} 
				*/                        
									</script>					
									<br>
				                      <h6><i class="icon fas fa-unlock-alt"></i>&nbsp;비밀번호</h6>
				                      <div class="input-group mb-3">
				                        <input style=" border: none; border-bottom: solid 1px #FFE3E3; border-radius:0;" 
				                        		type="password" class="form-control" placeholder="영문자나 숫자(4~12자) 입력" size="30" name="userPw" id="userPw" >
				                      </div>
				                      <div class="input-group mb-3">
				                        <input style=" border: none; border-bottom: solid 1px #FFE3E3; border-radius:0;" 
				                        		type="password" class="form-control" placeholder="비밀번호 확인" size="30" name="pwck" id="pwck" >
				                      </div>
				                      <div class="alert alert-success" id="alert-success2">비밀번호가 일치합니다.</div>
				                      <div class="alert alert-danger" id="alert-danger2">비밀번호가 일치하지 않습니다.</div>
				                      <br>
				                      <h6><i class="icon far fa-grin"></i>&nbsp;이름</h6>
				                      <div class="input-group mb-3">
				                        <input style=" border: none; border-bottom: solid 1px #FFE3E3; border-radius:0;"  
				                        		type="text" class="form-control" placeholder="이름 입력" size="30" name="userName" id="userName" >
				                      </div>
				                      <br>
				                      <h6><i class="icon far fa-grin"></i>&nbsp;주소</h6>
				                      <div class="input-group mb-3">
				                        <input style="border: none; border-bottom: solid 1px #FFE3E3; border-radius:0;"  
				                        		type="text" class="form-control" placeholder="주소 입력" size="30" name="address" id="address"
												onclick="goPopup();"  >
				                      </div>
									  <br>
				                      <h6><i class="icon fas fa-mobile-alt"></i>&nbsp;전화번호</h6>
				                      <div class="input-group mb-3">
				                        <input style=" border: none; border-bottom: solid 1px #FFE3E3; border-radius:0;" 
				                         		type="text" class="form-control" placeholder="-제외 숫자만 입력" size="30" name="phone" id="phone" maxlength="11" >
				                      </div>
				                      <br> 
				                      <div class="row justify-content-center p-1">
                        				<button class="btn btn-primary btn-block" onclick="btn_click('joinUser');">회원가입</button>
                    				  </div>
                    				  <div class="row justify-content-center p-1">
                        				<button class="btn btn-warning btn-block" onclick="btn_click('backHome');">돌아가기</button>
                    				  </div>   
				                </form>
				            </div>
						</div>
			 		</div>
			 	</div> 
			</div>
			<!-- 오른쪽여백으로 분리 -->
		<%-- 	<jsp:include page="/WEB-INF/views/common/rightSide.jsp" /> --%>
		</div>
	</div>
</section>
<script>
	//회원가입 유효성검사
	function btn_click(str){
		if(str=='joinUser')
		{
			if(document.joinfrm.userPw.value==""){
				
				alert("아이디를 입력하세요");
				document.joinfrm.userId.focus();
				return false;
			}
			else if(document.joinfrm.userPw.value==""){
				alert("비밀번호를 입력하세요");
				document.joinfrm.userPw.focus();
				return false;
			}
			else if(document.joinfrm.pwck.value==""){
				alert("비밀번호확인을  입력하세요");
				document.joinfrm.pwck.focus();
				return false;
			}
			else if(document.joinfrm.userName.value==""){
				alert("이름  입력하세요");
				document.joinfrm.userName.focus();
				return false;
			}
			else if(document.joinfrm.address.value==""){
				alert("주소를  입력하세요");
				document.joinfrm.address.focus();
				return false;
			}
			else if(document.joinfrm.phone.value==""){
				alert("연락처를  입력하세요");
				document.joinfrm.phone.focus();
				return false;
			}
			
			joinfrm.submit();
			
		}
		else if(str=="backHome")
		{
			location.href="${path}/home"
		}
		
	}
	//비밀번호 중복체크
	 $(function(){
         $("#alert-success2").hide();
         $("#alert-danger2").hide();
         $("input").keyup(function(){
        	 
            var pwd1 = $("#userPw").val();
            var pwd2 = $("#pwck").val();
            if(pwd1 != ""|| pwd2 != ""){
               if(pwd1 == pwd2){
            	   console.log(pwd1+":"+pwd2);
                  $("#alert-success2").show();
                  $("#alert-danger2").hide();
                  
               } else {
                  $("#alert-success2").hide();
                  $("#alert-danger2").show();
                 
               }
            }
         });
	 });
	//주소 입력 api
	
/* 	
function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("${path}/user/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	console.log(roadFullAddr);
	document.joinfrm.address.value = roadFullAddr;		
}
 */
 function goPopup(){
	 new daum.Postcode({
	     oncomplete: function(data) {
	         // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	         // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	           if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                     addr = data.roadAddress;
	                 } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                     addr = data.jibunAddress;
	                 }
	         
	          // document.getElementById('zipcode').value = data.zonecode;
	           document.getElementById('address').value = addr;
	         
	     }
	 }).open();
	 }


</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

