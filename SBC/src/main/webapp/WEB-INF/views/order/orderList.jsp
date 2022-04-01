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

<!-- 부트스트랩 기본 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!--카카오 map api  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=67350dbec2efe1663af9ea26ecc6ec71&libraries=services"></script>	

<style>  
	@font-face {
	    font-family: 'Cafe24Dongdong';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Dongdong.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	*{
		font-family: 'Cafe24Dongdong';
	}
    table {
		width: 80%;
		border-top: 1px solid #808080;
    	border-collapse: collapse;
    	text-align: center;
    	margin: 0 auto;
	}

	th, td {
	    border-bottom: 1px solid #D3D3D3;
	    padding: 10px;
  	}
  	
	tr.no-bottom-border td {
	  border-bottom: none;
	}
	
	.label_hidden {
		display: none;
	}
	
	.order_phone {
		maxlenght: "3";
	}
	
	#price1 {
		font-size: 16pt;
		font-weight: bold;
	}
	
	.mtop{
		margin-top: 6px;
	}
	
	.mbottom {
		margin-bottom: 6px;
	}
	
	.smallfonts{
		font-size: 10pt;
		color: #696969;
	}
	.priceBottom {
		font-size: 20pt;
		font-weight: bold;
	}
	.tdBottom{
		border-right: 1px solid #D3D3D3;
		width: 48%;
	}

</style>

<script>
//장바구니 금액 계산
$(document).ready(function() {
	
	var eachTotal = 0;					// 상품별 총액 
	var totalPrice = 0;					// 상품 금액 합 
	var delivery = 0;					// 배송비
	var finalTotalPrice = 0; 			// 최종 가격(총 가격 + 배송비)
	
	for(var i=0;i<${productList.size() };i++){
		//이름 설정 
		var cnt = ".cnt"+i;
		var price = ".price"+i;
		var eachTotalSpan = ".eachTotalSpan"+i;
		
		//형변환 
		var cntVal = parseInt($(cnt).text());
		var priceVal = parseInt($(price).text());
		
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
	
	$('input[name=total_price]').attr('value', totalPrice);
	$('input[name=shipping]').attr('value', delivery);
	$('input[name=total_amount]').attr('value', finalTotalPrice);
});
</script>

</head>    
    <body>
        <!-- Navigation-->
        <c:import url="/WEB-INF/views/include/header_menu3.jsp" />

        <!-- Section-->
        <section class="py-1">
            <div class="container px-4 px-lg-5">
            	<div class="row">
            		<img style="margin: 0 auto; width: 800px" src="${root }images/product/배송.PNG">
            	</div>
            	<div class="row mb-5">
            		<div class="col">
            			<!-- 주문내역 -->
	            		<table style="border: 0">
	                		<tr>
	                			<td style="text-align: left; font-weight: bold">주문내역</td>
	                		</tr>
	                	</table>
	                	<table>
	                		<thead>
							<tr>
			                    <th>ITEM</th>
			                    <th>PRICE</th>
			                    <th>QUA</th>
			                    <th>DELIVERY</th>
			                    <th>TOTAL</th>
	                		</tr>
	                		</thead>
	                		<c:forEach var="list" items="${productList }" varStatus="vs">
	                		<tbody>
	                		<tr>
	                			<td style="text-align: left">${list.product_name } [${list.product_option }]</td>
	                			<td><span class="price${vs.index }">${list.price }</span>원</td>
	                			<td><span class="cnt${vs.index }">${list.quantity}</span></td>
	                			<td><span class="delivery"></span>원</td>
	                			<td><span class="eachTotalSpan${vs.index }"></span>원</td>
	                		</tr>
	                		</c:forEach>
	                		<tr class="no-bottom-border">
	                			<td colspan="5" style="text-align: right">상품구매금액 <span class="totalPrice"></span> + 배송 <span class="delivery"></span> = 합계:&nbsp;&nbsp;&nbsp;<span class="finalTotalPrice" id="price1"></span>원</td>
	                		</tr>
	                		</tbody>
						</table>
            		</div>
            		<div class="col">
            			<!-- 주문자정보 -->
						<table style="border: 0">
	                		<tr>
	                			<td style="text-align: left; font-weight: bold">주문자 정보</td>
	                		</tr>
	                	</table>
	                	
	                	<table style="text-align: left">
	                		<tr>
	                			<td>주문하시는 분</td>
	                			<td>${orderInfo.order_name}</td>
	                		</tr>
	                	
	                		<tr>
	                			<td>주소</td>
	                			<td>
		                			(0${orderInfo.order_postcode })<br />
		                			${orderInfo.order_address1 } ${orderInfo.order_address2 }
	                			</td>
	                		</tr>
	                		<tr>
	                			<td>휴대전화</td>
	                			<td>
	                				${orderInfo.order_phone }
	                			</td>
	                		</tr>
	                		<tr>
	                			<td>이메일</td>
	                			<td>
	                				${orderInfo.email }
	                			</td>
	                		</tr>
	                	</table>
            		</div>

            	</div>
            	<div class="row mb-5">
            		<div class="col">
						<!-- 결제금액 -->
	                	<table style="border: 0">
	                		<tr>
	                			<td style="text-align: left; font-weight: bold">결제 금액</td>
	                		</tr>
	                	</table>
	                	<table>
	                		<tr>
	                			<td>상품구매금액</td>
	                			<td>배송비</td>
	                			<td>총 결제금액</td>
	                		</tr>
	                		<tr class="priceBottom">
	                			<td>
	                				<span class="totalPrice"></span>원
	                				<input type="hidden" name="total_price"/>
	                			</td>
	                			<td>
		                			<span class="delivery"></span>원
		                			<input type="hidden" name="shipping"/>
	                			</td>
	                			<td>
		                			<span class="finalTotalPrice"></span>원
		                			<input type="hidden" name="total_amount"/>
	                			</td>
	                		</tr>
	                	</table>
            		</div>
            		
            		<div class="col">
	            		<!-- 배송지정보 -->
	                	<table style="border: 0">
	                		<tr>
	                			<td style="text-align: left; font-weight: bold">배송지 정보</td>
	                		</tr>
	                	</table>
	                	<table style="text-align: left">
	                		<tr>
	                			<td>받으시는 분</td>
	                			<td>${orderInfo.shipping_name }</td>
	                		</tr>
	                		<tr>
	                			<td>주소</td>
	                			<td>
	                				(0${orderInfo.shipping_postcode })<br />
		                			${orderInfo.shipping_address1 } ${orderInfo.shipping_address2 }
	                			</td>
	                		</tr>
	                		<tr>
	                			<td>휴대전화</td>
	                			<td>${orderInfo.shipping_phone}</td>
	                		</tr>
	                	</table>
            		</div>
            	</div>

        	</div>

        </section>
        
    <!-- footer-->
    <c:import url="/WEB-INF/views/include/footer_menu.jsp" />
        
        <!-- 부트스트랩 기본 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
