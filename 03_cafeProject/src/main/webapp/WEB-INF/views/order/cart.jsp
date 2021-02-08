<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<style>
 .label{
 	width:100px;
 	margin-left:10px;
 	margin-right:50px;
 	padding-top:5px;
 }
 .W-container{
 	min-height:500px;
 
 }

</style>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<jsp:include page="/WEB-INF/views/user/sidebar_myPage.jsp" />
<section>
	<div class="W-container row bg-light pt-4" >
		<div class="col-sm-2 content"></div>
		<div class="col-sm-6">
			<div class="row-vh d-flex flex-column">
				<div class="d-flex form-check justify-content-between">
					<div>
						<div>
							<input type="checkbox" class="form-check-input" name="checkAll"  >모두선택
						</div>
					</div>
					<div>
					 	<h6><a href="javascript:deleteCart();" >선택삭제</a></h6>
					</div>
				</div>
				<!-- 내 장바구니 반복구문 -->
				<c:forEach items="${list }" var="c">
					<div class="border d-flex form-check bg-white rounded-lg mb-2" >
						
						<input type="checkbox" name="cartCheck" class="mt-1 form-check-input" value="${c.goods_no }" />
						<input type="hidden" name="cartNo" class="form-check-input" value="${c.cart_no }" />
						<img class="orderImg"src="/img/cafe/${c.main_image}" width="150px;" height="150px;"/>
						<div class="ml-3 mt-2">
							<h6>${c.coffee_title }</h6>
							<div>금액:<span class="goodsPrice">${c.coffee_price }</span></div>
							<div id="">
							<select class="form-control qtySelector" name="qtySelector" onchange="CountAmount();">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
									
							</select>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- 장바구니 반복 끝 -->
			</div>
		</div>
		<div class="col-sm-2">
		 	<div class="cart-total-container border rounded-lg bg-white mt-4 pl-2">
		 		<div class="d-flex mt-3">
		 			<h6 class="label">총 상품금액</h6>
		 			<span id="cartTotalPrice">0</span><span>원</span>
		 		</div>
		 		<div class="d-flex">
		 			<h6 class="label">총 배송비</h6>
		 			<span id="deliveryFee">0</span><span>원</span>
		 		</div>
		 		<!-- <div class="d-flex">
		 			<h6 class="label">총 할인금액</h6>
		 			<h6>10000원</h6>
		 		</div> -->
		 		<br/>
		 		<div class="d-flex">
		 			<h6 class="label"><b>결제금액</b></h6>
		 			<span id="OrderTotalPrice">0</span><span>원</span>
		 		</div>
		 	</div>
		 	<div class="mt-3">
		 		<button id="CartAddOrder" class="btn btn-primary btn-block" onclick="fnAddOrder();"><span id="itemCount">0</span>개 상품 결제하기</button>
		 	</div>
		</div>
	
		<jsp:include page="/WEB-INF/views/common/rightSide.jsp" />
	</div>
</section>
<script>
//select에 기본 값 db에서 가져온 값으로 설정하기
$(function(){
	var selector=document.getElementsByName("qtySelector");//배열값
	var options;
	var cartList=new Array();
	<c:forEach items="${list}" var="c">
		cartList.push(${c.goods_qty});
	</c:forEach>
	console.log(selector.length);//select박스 갯수
	console.log(selector[0].length);//option 갯수
	
	for(i=0;i<selector.length;i++){
		
		for(j=0;j<selector[i].length;j++){
		if(Number(selector[i].options[j].value) == cartList[i] ){
			console.log("실행됨");
			selector[i].options[j].selected = true;
			break;
			}
		}
	}

});
/* function fnQtyChange(goodsNo,ths){
	console.log(goodsNo+":"+ths.innerText);
	
}
 */


var checkbox=document.getElementsByName('cartCheck');//체크박스 전부 가져오기
console.log(checkbox.value);
var selectbox=document.getElementsByName('qtySelector');//셀렉트박스 전부 가져오기
var priceArr=document.getElementsByClassName('goodsPrice');//상품가격 전부 가져오기
console.log("가격배열:"+priceArr);
var checkArr=new Array();//체크된 체크박스 담을 변수
var selectArr=new Array();//select박스 변수


//order로 가져갈 변수, member_no goods_no;private int order_qty;payment_price;
function fnAddOrder(){
	//체크된 항목의 goods_no로 상품을 가져옴. 
	console.log(checkbox.length);
	for(i=0;i<checkbox.length;i++){
			if(checkbox[i].checked){
				console.log()
				console.log("goodsNo:"+checkbox[i].value);
				checkArr.push(checkbox[i].value);	
				selectArr.push(selectbox[i].value);
				}
			}
	if(checkArr==0){
		
		alert('선택된 상품이 없습니다');
		return false;
	}
	console.log(checkArr+":"+selectArr);
	//goodsNo랑 주문 갯수 넘겨줌 
	location.href="${path}/order/addOrder?checkArr="+checkArr+"&selectArr="+selectArr+"&member_no=${loginUser.member_no}";
	
	
	}	




//체크박스 선택 |해제

var checkAll=document.querySelector("input[name='checkAll']");
var chk=document.querySelectorAll("input[name='cartCheck']");

//전체선택 클릭시 체크//해제
checkAll.onclick=function(){
	if(checkAll.checked==false){
		for(var i=0;i<chk.length;i++){
			chk[i].checked=false;
		}
		CountAmount();
	}else{
		for(var i=0;i<chk.length;i++){
			chk[i].checked=true;
		}
		CountAmount();
	}
}
//하위 개별항목 해제시 선택해제
for(var i=0;i<chk.length;i++){
	chk[i].onclick=function(){
		if(this.checked==false){
			checkAll.checked=false;
		}
		CountAmount();
		
	}
}	
		
//선택삭제 클릭시 체크박스 선택된 값 카트에서 삭제

function deleteCart(){
	//필요한것 checkbox:chk, 
	var cartNo=document.querySelectorAll("input[name='cartNo']");
	var cartNos=new Array();
	var checkedList=new Array();
	for(var i=0;i<chk.length;i++){
		if(chk[i].checked==true){
			//지울것
			cartNos.push(cartNo[i].value);
			//체크된것
			checkedList.push(chk[i]);
			
		}
		
	}
	console.log(cartNos);
	console.log(checkedList);
	if(checkedList.length>0){
		if(confirm('선택한 상품을 삭제하시겠습니까?')==true){
			$.ajax({
				url:"${path}/order/deleteCart",
				type:"post",
				data:{cartNos:cartNos},
				success:function(data){
					console.log("결과값:"+data.result)
					if(data.result>0){
						alert("상품이 삭제되었습니다");
						location.reload();
					}else{
						alert("상품이 정상적으로 삭제되지 않았습니다");
						location.reload();
					}
					
				}
				
			})
		  
		}else{
			return false;		
			}
	}else{
		alert("선택된 상품이 없습니다.");
	}
	
	
	
	
}
 





function CountAmount(){
	var checkbox=document.getElementsByName('cartCheck');
	var selectbox=document.getElementsByName('qtySelector');
	var priceArr=document.getElementsByClassName('goodsPrice');//상품가격 전부 가져오기
	var deliveryFee=document.getElementById('deliveryFee');
	
	//각각의 (금액 *수량)한것을 모두 합산
	var selectArr=new Array();
	var price=new Array();
	var totalPrice=0;
	for(i=0;i<checkbox.length;i++){ 
		if(checkbox[i].checked){
			console.log("체크된 배열:"+i);
			price.push(parseInt(priceArr[i].innerHTML));
			selectArr.push(parseInt(selectbox[i].value));
			console.log(i+"번째"+selectbox[i].value)
	 	}
	}
	for(j=0;j<price.length;j++){
		console.log('계산할 배열:'+price.length);
		console.log(selectArr);
		console.log("갯수:"+selectArr[j]);
		totalPrice+=price[j]*selectArr[j];
		}
	
	console.log('토탈금액:'+totalPrice);
	
	var itemCount=document.getElementById('itemCount');
	itemCount.innerHTML=price.length;
	var dFee=2500;
	deliveryFee.innerHTML=addComma(dFee);
	var totalInput=document.querySelector('span[id="cartTotalPrice"]');
	
	var OrderTotalPrice=document.querySelector('span[id="OrderTotalPrice"]');
	
	totalInput.innerHTML=addComma(totalPrice);//총상품 금액
	
	OrderTotalPrice.innerHTML=addComma(Number(totalPrice)+delComma(deliveryFee.innerHTML));

			
	
	
}

function addComma(num) {
	//3자리 마다 콤마 추가
	  var regexp = /\B(?=(\d{3})+(?!\d))/g;
	  return num.toString().replace(regexp, ',');
	}
function delComma(num){
	return parseInt(num.replace(/,/g,""));
}	
	

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
