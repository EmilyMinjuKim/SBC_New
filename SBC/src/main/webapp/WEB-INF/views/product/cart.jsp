<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" href="${root }css/product-style.css"/>
<!-- Spinner CSS -->
<link rel="stylesheet" href="${root }jquery-ui-1.11.4/jquery-ui.css" />

<style>
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
		confirm("장바구니를 모두 비우시겠습니까?");
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
			confirm("선택한 상품을 삭제하시겠습니까?");
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
		
		confirm("선택한 상품을 삭제하시겠습니까?");
		
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
			
			$(eachTotalSpan).text(eachTotal);
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
		
		/* 값 삽입 */
		// 총 가격
		$(".totalPrice").text(totalPrice);
		// 배송비
		$(".delivery").text(delivery);	
		// 최종 가격(총 가격 + 배송비)
		$(".finalTotalPrice").text(finalTotalPrice);

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
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!">SBC</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        
        
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">장바구니</h1>
                </div>
            </div>
        </header>
        
        
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="justify-content-center">
					<table>
						<tr>
							<th><input type="checkbox" id="chk_all" onclick="checkAll()" /></th>
		                    <th>&nbsp;</th>
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
	                			<td>image</td>
	                			<td style="text-align: left">${list.product_name } [${list.product_option }]</td>
	                			<td>${list.price }원</td>
	                			<td>
	                				<input type="text" name="orderDetailList[${vs.index }].quantity" class="spinner spinner${vs.index }" style="width: 50px" value="${list.quantity }" />
	                				<button type="button" onclick="changeCntConfirm(${vs.index }, '${list.product_id }')">확인</button>
	                			</td>
	                			<td><span class="delivery"></span>원</td>
	                			<td><span class="eachTotalSpan${vs.index }">${list.total }</span>원</td>
	                			<td><button type="button" onclick="deleteEach('${list.product_id }')" product_id="${list.product_id }">삭제</button></td>
	                		</tr>
                		</c:forEach>
                		<tr>
                			<td colspan="8" style="text-align: right">상품구매금액 <span class="totalPrice"></span> + 배송 <span class="delivery"></span> = 합계: <span class="finalTotalPrice"></span>원</td>
                		</tr>
                		<tr class="no-bottom-border">
                			<td colspan="7" style="text-align: left">
                				선택한 상품을 <button type="button" onclick="deleteSelected()">삭제하기</button>
                			</td>
                			<td colspan="1" style="text-align: right">
                				<button type="button" onclick="deleteAll()">장바구니 비우기</button>
                			</td>
                		</tr>
					</table>
					<br /><br />
					<table id="total">
						<tr>
							<th>총 상품금액</th>
							<th>총 배송비</th>
							<th>결제예정금액</th>
						</tr>
						<tr>
							<td><span class="totalPrice"></span>원</td>
							<td><span class="delivery"></span>원</td>
							<td><span class="finalTotalPrice"></span>원</td>
						</tr>
					</table>
					<br />
					<button type="button" onclick="orderSelected()">SELECT ORDER</button>
					<button type="button" onclick="orderAll()">ORDER</button>
					<button type="button" onclick="history.go(-1)">쇼핑계속하기</button>
                </div>
            </div>
        </section>
        
        
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${root }js/shop-scripts.js"></script>
        <!-- Spinner JS -->
        <script src="${root }jquery-ui-1.11.4/jquery-ui.js"></script>
    </body>
</html>
