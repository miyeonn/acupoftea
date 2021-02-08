<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
/* 	.admin-header{
	margin-left:23%;
	} */
	table{
	text-align:center;
	margin-left:auto;
	margin-right:auto;
	margin-top:5%;
	
	}
	
	
</style>
<jsp:include page="/WEB-INF/views/admin/sidebar-admin.jsp" />
<section>
<div class="container-fluid">
		<div class="row">
			<!-- 사이드바로 분리 -->
			<jsp:include page="/WEB-INF/views/common/leftSide.jsp" />			
			<!-- 컨텐츠섹션으로 분리 -->
			<div class="col-sm-8 content">
				<div class="row justify-content-center">
					<div class="admin-header d-flex flex-column justify-content-center align-items-center">
					     <div class="d-flex pr-2">
							<form action="${path }/admin/enrollCafeEnd" method="post" enctype="multipart/form-data" >
								<table class="table table-bordered" style="width:1000px">
									<tr>
										<td colspan="2">
										<h3>카페 등록(관리자 전용)</h3>
										</td>
									</tr>
									<tr>
										<td>
											카페명
										</td>
										<td>
											<input type="text" class="form-control"  name="cafeTitle" id="cafeTitle">
										</td>
									</tr>
									<tr>
										<td>
											사진 첨부
										</td>
										<td>
											<input type="file" multiple="multiple" name="upFile" id="upFile">
											
										</td>
									</tr>
									<tr>
										<td>
											주소입력
										</td>
										<td>
											<div class="d-flex justify-content-center align-items-center">
											<input type="text" id="cafeAddr" name="cafeAddr" class="form-control" placeholder="Enter Addr" required="true" readonly="true"
											style="width:550px;"/>
											<button type="button" class="btn btn-primary" onclick="goPopup();" >주소 찾기</button>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											운영시간
										</td>
										<td>
											<input type="text"  class="form-control" placeholder="예시)11:00 - 21:30" id="businessHour" name="businessHour">
										</td>
									</tr>
									<tr>
										<td>
											전화번호
										</td>
										<td>
											<input type="text" class="form-control" id="cafeTel" name="cafeTel" placeholder="(-포함)010-1234-5678">
										</td>
									</tr>
									<tr>
										<td>
											홈페이지
										</td>
										<td>
											<input type="text"  class="form-control" id="cafePage" name="cafePage">
										</td>
									</tr>
									<tr>
										<td colspan="2">
										<button  class="btn btn-warning" id="cancelSubmit">등록 취소</button>
										<button type="submit" class="btn btn-primary" >카페등록</button>
										</td>
									</tr>
								</table>
							</form> 
						</div>   
					</div>
				</div>	
			</div>
		
			<!-- 오른쪽여백으로 분리 -->
			<jsp:include page="/WEB-INF/views/common/rightSide.jsp" />
		</div>
</div>
</section>
<script>

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
		        
		          document.getElementById('cafeAddr').value = addr;
		        
		        
		    }
		}).open();
		}


function jusoCallBack(roadFullAddr){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
	/* 	var userAddr=$("#userAddr").val() 
		userAddr= roadFullAddr;	 */	
		console.log(roadFullAddr);
		console.log(typeof(roadFullAddr));
	$("#cafeAddr").val(roadFullAddr);
}

/* $("#cancelSubmit").click(function(){
	location.replace="/admin/tripInfo.do";
	
});
	 */




</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
