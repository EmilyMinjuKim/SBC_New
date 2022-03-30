<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script> 

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>My Cart</title>

<!-- 부트스트랩 기본 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- Spinner CSS -->
<link rel="stylesheet" href="${root }jquery-ui-1.11.4/jquery-ui.css" />

<style>
	@font-face {
    font-family: 'air';
    src: url('${root}fonts/Cafe24Ohsquareair.ttf') format('truetype');
	}
	@font-face {
    font-family: 'air';
    src: url('${root}fonts/Cafe24Ohsquare.ttf') format('truetype');
    font-weight: bold;
	}
	*{
	font-family: 'air';
	}
	.arrow-btn {
		background-color: white;
		border: none;
		cursor: pointer;
	}
      
    table {
		width: 100%;
		border-top: 1px solid #808080;
    	border-collapse: collapse;
    	text-align: center;
	}

	th, td {
	    border-bottom: 1px solid #D3D3D3;
	    padding: 10px;
  	}
  	
	tr.no-bottom-border td {
	  border-bottom: none;
	}
	
	#price1 {
		font-size: 16pt;
		font-weight: bold;
	}
	
	.p_bottom {
		font-size: 20pt;
		font-weight: bold;
	}
	#priceBottom {
		font-size: 20pt;
		font-weight: bold;
	}

</style>
<script>
	//상품 체크박스 전체선택 및 해제
	function checkAll() {
		if($('#chk_all').is(':checked')){
			$('.chk').prop('checked',true);
		    }else{
		       $('.chk').prop('checked',false);
		    }
	}
		
	//전체 상품 버튼으로 한 번에 삭제하기
	function deleteAll() {
		var confirmation = confirm("장바구니를 모두 비우시겠습니까?");
		
		if(confirmation==false){
			return;
		}
		
 		$.ajax({
			type : "delete",
			url : "${root}product/deleteAll",
			dataType : "json",
			error : function(request, status, error) {
				alert("code:"
						+ request.status
						+ "\n"
						+ "message:"
						+ request.responseText
						+ "\n"
						+ "error:"
						+ error);
			},
			success : function(data) {
				if(data == 1){
					location.reload();
				}
			}
		});
	}
	
	//체크박스 선택한 상품 삭제하기
	function deleteSelected() {
		
			//null check
			if($("input[class='chk']:checked").val()==null){
				alert("삭제하실 상품을 선택해주세요.");
				return;
			}
		
			var confirmation = confirm("선택한 상품을 삭제하시겠습니까?");
			
			if(confirmation==false){
				return;
			}
			
		  	var checkArr = new Array();
		   
		    $("input[class='chk']:checked").each(function(){
		    	checkArr.push($(this).attr("product_id"));
		    });
		    
		    $.ajax({
				type : "post",
				url : "${root}product/deleteSelected",
				dataType : "json",
				data : {checkArr : checkArr},
				error : function(request, status, error) {
					alert("code:"
							+ request.status
							+ "\n"
							+ "message:"
							+ request.responseText
							+ "\n"
							+ "error:"
							+ error);
				},
				success : function(data) {
					if(data == 1){
						location.reload();
					}
				}
			});
	}
	
	//각 상품 버튼으로 삭제하기
	function deleteEach(type) {
		var each = type;
		
		var confirmation = confirm("선택한 상품을 삭제하시겠습니까?");
		
		if(confirmation==false){
			return;
		}
		
	  	var checkArr = new Array();
	  	checkArr.push(each);
	  	
	  	$.ajax({
			type : "post",
			url : "${root}product/deleteSelected",
			dataType : "json",
			data : {checkArr : checkArr},
			error : function(request, status, error) {
				alert("code:"
						+ request.status
						+ "\n"
						+ "message:"
						+ request.responseText
						+ "\n"
						+ "error:"
						+ error);
			},
			success : function(data) {
				if(data == 1){
					location.reload();
				}
			}
		});
	}
	
	//체크박스 선택한 제품만 form submit
	function orderSelected() {
		
		//null check
		if($("input[class='chk']:checked").val()==null){
			alert("주문하실 상품을 선택해주세요.");
			return;
		}
		

		var form = document.createElement("form");
        form.setAttribute("charset", "UTF-8");
        form.setAttribute("method", "post");  //Post 방식
        form.setAttribute("action", "${root}order/orderform"); //요청 보낼 주소
		
		$("input[class='chk']:checked").each(function(){
			
			var i = $(this).attr("idx");
			console.log($(this).attr("idx"));
   
	         var price = 'orderDetailList['+i+'].price';
	         var product_option = 'orderDetailList['+i+'].product_option';
	         var product_id = 'orderDetailList['+i+'].product_id';
	         var product_name = 'orderDetailList['+i+'].product_name';
	         var quantity = 'orderDetailList['+i+'].quantity';
 
	         var hiddenField = document.createElement("input");
	         hiddenField.setAttribute("type", "hidden");
	         hiddenField.setAttribute("name", price);
	         hiddenField.setAttribute("value", $("input[name='"+price+"']").val());
	         form.appendChild(hiddenField);
	         
	         hiddenField = document.createElement("input");
	         hiddenField.setAttribute("type", "hidden");
	         hiddenField.setAttribute("name", product_option);
	         hiddenField.setAttribute("value", $("input[name='"+product_option+"']").val());
	         form.appendChild(hiddenField);
	         
	         hiddenField = document.createElement("input");
	         hiddenField.setAttribute("type", "hidden");
	         hiddenField.setAttribute("name", product_id);
	         hiddenField.setAttribute("value", $("input[name='"+product_id+"']").val());
	         form.appendChild(hiddenField);
	         
	         hiddenField = document.createElement("input");
	         hiddenField.setAttribute("type", "hidden");
	         hiddenField.setAttribute("name", product_name);
	         hiddenField.setAttribute("value", $("input[name='"+product_name+"']").val());
	         form.appendChild(hiddenField);
	         
	         hiddenField = document.createElement("input");
	         hiddenField.setAttribute("type", "hidden");
	         hiddenField.setAttribute("name", quantity);
	         hiddenField.setAttribute("value", $("input[name='"+quantity+"']").val());
	         form.appendChild(hiddenField);
	         
	         console.log(price+" "+product_option+" "+product_id+" "+product_name+" "+quantity);  
	    });
        
        document.body.appendChild(form);
        form.submit();
        document.getElementById("form").remove();
        
	}
	
	function orderAll() {
		$('.chk').prop('checked',true);
		orderSelected();
	}
	
	$(document).ready(function() {
		//장바구니 수량 스피너 호출
		$(".spinner").spinner();
		
		$(".spinner").bind("spinstop", function() {
			changeCnt();
		});
	});
	
	
	$(document).ready(function() {
		changeCnt();
	});
	
	//장바구니 금액 계산
	function changeCnt() {
		var eachTotal = 0;					// 상품별 총액 
		var totalPrice = 0;					// 상품 금액 합 
		var delivery = 0;					// 배송비
		var finalTotalPrice = 0; 			// 최종 가격(총 가격 + 배송비)

		for(var i=0;i<$(".spinner").length;i++){
			//이름 설정 
			var cnt = ".spinner"+i;
			var price = ".price"+i;
			var eachTotalSpan = ".eachTotalSpan"+i;
						
			//최소, 최대 주문 수량 설정
			if($(cnt).val() < 1){
				$(cnt).val(1);
			} else if($(cnt).val() > 10){
				$(cnt).val(10);
				alert("구매할 수 있는 최대 수량은 10입니다.");
			}
			
			//형변환 
			var cntVal = parseInt($(cnt).val());
			var priceVal = parseInt($(price).val());
			
			eachTotal = cntVal * priceVal;
			
			/* 화폐 단위로 변경 */
			var eachTotalCurrency = eachTotal.toLocaleString('ko-KR');
			
			$(eachTotalSpan).text(eachTotalCurrency);
			totalPrice += eachTotal;
		}
		
		/* 배송비 결정 */
		if(totalPrice >= 50000){
			delivery = 0;
		} else if(totalPrice == 0){
			delivery = 0;
		} else {
			delivery = 3000;	
		}
		
		/* 최종 가격 */
		finalTotalPrice = totalPrice + delivery;
		
		/* 화폐 단위로 변경 */
		var totalPriceCurrency = totalPrice.toLocaleString('ko-KR');
		var deliveryCurrency = delivery.toLocaleString('ko-KR');
		var finalTotalPriceCurrency = finalTotalPrice.toLocaleString('ko-KR');
		
		/* 값 삽입 */
		// 총 가격
		$(".totalPrice").text(totalPriceCurrency);
		// 배송비
		$(".delivery").text(deliveryCurrency);	
		// 최종 가격(총 가격 + 배송비)
		$(".finalTotalPrice").text(finalTotalPriceCurrency);

	}
	
	//장바구니 수량 수정 
	function changeCntConfirm(idx, id) {
		var cnt_id = ".spinner"+idx;
		var cnt_val = parseInt($(cnt_id).val());
		
		var product_id = id;

 		$.ajax({
			type : "post",
			url : "${root}product/changeCnt",
			data : {"quantity" : cnt_val, "product_id" : product_id},
			dataType : "json",
			error : function(request, status, error) {
				alert("code:"
						+ request.status
						+ "\n"
						+ "message:"
						+ request.responseText
						+ "\n"
						+ "error:"
						+ error);
			}
		});
		
	}

</script>
</head>    
    <body>
        <!-- Navigation-->
        <c:import url="/WEB-INF/views/include/header_menu3.jsp" />

        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="justify-content-center">
					<table>
						<tr>
							<th><input type="checkbox" id="chk_all" onclick="checkAll()" /></th>
		                    <th>ITEM</th>
		                    <th>PRICE</th>
		                    <th>QUA</th>
		                    <th>DELIVERY</th>
		                    <th>TOTAL</th>
		                    <th>SELECT</th>
                		</tr>
                		<c:forEach var="list" items="${cartList }" varStatus="vs">
	                		<div class="cart_info">
	                			<input type="hidden" name="orderDetailList[${vs.index }].price" value="${list.price }" class="price${vs.index }" />
	                			<input type="hidden" name="orderDetailList[${vs.index }].product_option" value="${list.product_option }" />
	                			<input type="hidden" name="orderDetailList[${vs.index }].product_id" value="${list.product_id }" />
	                			<input type="hidden" name="orderDetailList[${vs.index }].product_name" value="${list.product_name }" />
	                		</div>
	                		<tr>
	                			<td><input type="checkbox" class="chk" idx="${vs.index }" product_id="${list.product_id }" /></td>
	                			<td style="text-align: left">${list.product_name } [${list.product_option }]</td>
	                			<td><fmt:formatNumber value="${list.price }" pattern="#,###"/>원</td>
	                			<td>
	                				<input type="text" name="orderDetailList[${vs.index }].quantity" class="spinner spinner${vs.index }" style="width: 50px" value="${list.quantity }" />
	                				<button type="button" class="btn btn-outline-dark" onclick="changeCntConfirm(${vs.index }, '${list.product_id }')">확인</button>
	                			</td>
	                			<td><span class="delivery"></span>원</td>
	                			<td><span class="eachTotalSpan${vs.index }"><fmt:formatNumber value="${list.total }" pattern="#,###"/></span>원</td>
	                			<td><button type="button" class="btn btn-outline-dark" onclick="deleteEach('${list.product_id }')" product_id="${list.product_id }">삭제</button></td>
	                		</tr>
                		</c:forEach>
                		<tr>
                			<td colspan="7" style="text-align: right">상품구매금액 <span class="totalPrice"></span> + 배송 <span class="delivery"></span> = 합계:&nbsp;&nbsp;&nbsp;<span class="finalTotalPrice" id="price1"></span>원</td>
                		</tr>
                		<tr class="no-bottom-border">
                			<td colspan="6" style="text-align: left">
                				선택한 상품을 <button type="button" class="btn btn-outline-dark" onclick="deleteSelected()">삭제하기</button>
                			</td>
                			<td style="text-align: right">
                				<button type="button" class="btn btn-outline-dark" onclick="deleteAll()">장바구니 비우기</button>
                			</td>
                		</tr>
					</table>
					<br /><br />
					<table>
						<tr>
							<td>총 상품금액</td>
							<td>총 배송비</td>
							<td>결제예정금액</td>
						</tr>
						<tr id="priceBottom">
							<td><span class="totalPrice p_bottom"></span>원</td>
							<td><span class="delivery p_bottom"></span>원</td>
							<td><span class="finalTotalPrice p_bottom"></span>원</td>
						</tr>
					</table>
					<br />
					<button type="button" class="btn btn-outline-dark" onclick="orderSelected()">SELECT ORDER</button>
					<button type="button" class="btn btn-outline-dark" onclick="orderAll()">ORDER</button>
					<button type="button" class="btn btn-outline-dark" onclick="location.href='${root}product/main'">쇼핑계속하기</button>
                </div>
            </div>
        </section>
        
		<!-- 부트스트랩 기본 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <!-- Spinner JS -->
        <script src="${root }jquery-ui-1.11.4/jquery-ui.js"></script>
    </body>
</html>
