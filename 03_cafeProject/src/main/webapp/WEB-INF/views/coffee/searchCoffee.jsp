<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<section>
	<div class="container-fluid">
		<div class="row">
			<!-- 사이드바로 분리 -->
				<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
			
			<!-- 컨텐츠섹션으로 분리 -->
			<div class="col-sm-9 content ">
				<div class="mt-3 border" style="width:800px;">
			 		<form>
				 		<h5>맛</h5><!-- 5단계중 3이상되는 커피들만 보여준다 -->
						<input type="checkbox"  id="defaultCheck" name="taste">쌉싸름한 맛
						<input type="checkbox" id="defaultCheck" name="example2">신맛
						<input type="checkbox" id="defaultCheck" name="example2">단맛
						<input type="checkbox" id="defaultCheck" name="example2">고소한 맛 
						<hr/>
						<h5>향</h5>
						<input type="checkbox" id="defaultCheck" name="example2">초콜릿향
						<input type="checkbox" id="defaultCheck" name="example2">플로럴향
						<input type="checkbox" id="defaultCheck" name="example2">오렌지향
						<hr/>
						<h5>추출방법</h5>
						<input type="checkbox" id="defaultCheck" name="example2">에스프레소 커피머신
						<input type="checkbox" id="defaultCheck" name="example2">전자동 커피머신
						<input type="checkbox" id="defaultCheck" name="example2">콜드브루&더치커피
						<input type="checkbox" id="defaultCheck" name="example2">핸드드립&커피메이커
					</form>
				</div>
				<!--검색항목 선택  -->
				<div>
				  내 취향의 커피를 찾아보세요
				</div>
					
<%-- 				<div class="row mt-3">
				<!-- 반복문 출력 -->
				 	<div class="col-sm-1 "></div>
					<div class="col-sm-3 ">
					  	<div class="card " style="width:250px;">
					    	<img class="card-img-top" src="${path }/resources/img/capsule.jpg" alt="Card image" style="">
					    	<div class="card-body">
					      		<h4 class="card-title">대충유원지</h4>
					      		<p class="card-text">연남동에 위치해있는 카페이며, 분위기가 좋다</p>
					      		<button onclick="location.href='/cafeDetail'">자세히보기</button>
					    	</div>
					  	</div>
					</div>
				<!-- 반복문 끝 -->
					<div class="col-sm-2">
					  	<div class="card " style="width:250px;">
					    	<img class="card-img-top" src="${path }/resources/img/cafe1.jpg" alt="Card image" style="">
					    	<div class="card-body">
					      		<h4 class="card-title">대충유원지</h4>
					      		<p class="card-text">연남동에 위치해있는 카페이며, 분위기가 좋다</p>
					    	</div>
					  	</div>
					</div>
					<div class="col-sm-3">
					  	<div class="card " style="width:250px;">
					    	<img class="card-img-top" src="${path }/resources/img/cafe1.jpg" alt="Card image" style="">
					    	<div class="card-body">
					      		<h4 class="card-title">대충유원지</h4>
					      		<p class="card-text">연남동에 위치해있는 카페이며, 분위기가 좋다</p>
					    	</div>
					  	</div>
					</div>
					<div class="col-sm-2">
					  	<div class="card " style="width:250px;">
					    	<img class="card-img-top" src="${path }/resources/img/cafe1.jpg" alt="Card image" style="">
					    	<div class="card-body">
					      		<h4 class="card-title">대충유원지</h4>
					      		<p class="card-text">연남동에 위치해있는 카페이며, 분위기가 좋다</p>
					    	</div>
					  	</div>
					</div>
					<div class="col-sm-1 "></div>
				</div> --%>
				
				<div class="border">
			 		페이징
				</div>
			</div><!-- 컨텐츠 끝 -->
			
			<!-- 샘플 출력용 -->
					<c:forEach items="${list}" var="l">
						<a>${l.cafeTitle }</a>
					</c:forEach>
			<!-- 오른쪽여백으로 분리 -->
			<jsp:include page="/WEB-INF/views/common/sidebar-right.jsp" />
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />



<script>


</script>
