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

</head>    
    <body>
        <!-- Navigation-->
        <c:import url="/WEB-INF/views/include/header_menu3.jsp" />

        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="justify-content-center">
                	<table style="border: 0">
                		<tr>
                			<td style="text-align: left; font-weight: bold"">주문내역</td>
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
                		<c:forEach var="list" items="${list }" varStatus="vs">
                		<div>
                			<input type="hidden" class="cnt${vs.index }" value="${list.quantity }" name="orderDetailList[${vs.index}].quantity" />
                			<input type="hidden" class="price${vs.index }" value="${list.price }" name="orderDetailList[${vs.index}].price" />
                			<input type="hidden" value="${list.product_name }" name="orderDetailList[${vs.index}].product_name" />
                			<input type="hidden" value="${list.product_option }" name="orderDetailList[${vs.index}].product_option" />
                			<input type="hidden" value="${list.product_id }" name="orderDetailList[${vs.index}].product_id" />
                		</div>
                		<tbody>
                		<tr>
                			<td style="text-align: left">${list.product_name } [${list.product_option }]</td>
                			<td>${list.price }원</td>
                			<td>${list.quantity }</td>
                			<td><span class="delivery"></span>원</td>
                			<td><span class="eachTotalSpan${vs.index }"></span>원</td>
                		</tr>
                		</c:forEach>
                		<tr class="no-bottom-border">
                			<td colspan="7" style="text-align: right">상품구매금액 <span class="totalPrice"></span> + 배송 <span class="delivery"></span> = 합계:&nbsp;&nbsp;&nbsp;<span class="finalTotalPrice" id="price1"></span>원</td>
                		</tr>
                		</tbody>
					</table>
					<br /><br />
					
					<table style="border: 0">
                		<tr>
                			<td style="text-align: left; font-weight: bold"">주문자 정보</td>
                		</tr>
                	</table>
                	
                	<table style="text-align: left">
                		<tr>
                			<td>주문하시는 분</td>
                			<td><input type="text" id="order_name1" class="nullCheck" name="order_name" /></td>
                		</tr>
                	
                		<tr>
                			<td>주소</td>
                			<td>
                				<label for="order_postcode1" class="label_hidden">우편번호</label>
	                			<input type="text" id="order_postcode1" class="nullCheck" name="order_postcode" readonly="readonly" /> <button type="button" class="btn btn-outline-dark" onclick="shipping1()">우편번호</button><br />
	                			<input type="text" size="50" id="order_addr1" class="nullCheck mtop" name="order_address1" readonly="readonly" /> <label for="order_addr1" class="smallfonts">기본주소</label><br />
	                			<input type="text" size="50" id="order_addr2" class="nullCheck mtop" name="order_address2" /> <label for="order_addr2" class="smallfonts">나머지주소</label>
                			</td>
                		</tr>
                		<tr>
                			<td>휴대전화</td>
                			<td>
                				<input type="hidden" name="order_phone" />
                				<select id="tel1">
                					<option selected="selected">010</option>
                					<option>011</option>
                					<option>016</option>
                					<option>017</option>
                					<option>018</option>
                					<option>019</option>
                				</select>
                				-
                				<input type="text" size="10" id="order_phone1" class="nullCheck" maxlength="4" onchange="phoneValCheck(this.id)" /><label for="order_phone1" class="label_hidden">휴대전화</label>
                				-
                				<input type="text"  size="10" id="order_phone2" class="nullCheck" maxlength="4" onchange="phoneValCheck(this.id)" /><label for="order_phone2" class="label_hidden">휴대전화</label>
                			</td>
                		</tr>
                		<tr>
                			<td>이메일</td>
                			<td>
                				<input type="hidden" name="email"/>
                				<input type="text" id="order_email1" class="nullCheck mbottom" name="email1" /> @ <input type="text" id="order_email2" class="nullCheck mbottom" name="email2" />
                				<label for="order_email1" class="label_hidden">이메일</label>
                				<label for="order_email2" class="label_hidden">이메일</label>
                				<select onchange="selectEmail(this)">
                					<option selected="selected" value = "1">직접입력</option>
                					<option>naver.com</option>
                					<option>daum.net</option>
                					<option>yahoo.com</option>
                					<option>nate.com</option>
                					<option>hotmail.com</option>
                					<option>empas.com</option>
                					<option>korea.com</option>
                					<option>dreamwiz.com</option>
                					<option>gmail.com</option>
                					<option value="">-이메일 선택-</option>
                				</select>
                			</td>
                		</tr>
                	</table>
                	<br /><br />
                	
                	<table style="border: 0">
                		<tr>
                			<td style="text-align: left; font-weight: bold">배송지 정보</td>
                		</tr>
                	</table>
                	<table style="text-align: left">
                		<tr>
                			<td>받으시는 분</td>
                			<td><input type="text" id="order_name2" class="nullCheck" name="shipping_name" /></td>
                		</tr>
                		<tr>
                			<td>주소</td>
                			<td>
                				<label for="order_postcode2" class="label_hidden">우편번호</label>
	                			<input type="text" id="order_postcode2" class="nullCheck" name="shipping_postcode" readonly="readonly" /> <button type="button" class="btn btn-outline-dark" onclick="shipping2()">우편번호</button><br />
	                			<input type="text" size="50" id="order_addr3" class="nullCheck mtop" name="shipping_address1" readonly="readonly" /> <label for="order_addr3" class="smallfonts">기본주소</label><br />
	                			<input type="text" size="50" id="order_addr4" class="nullCheck mtop" name="shipping_address2" /> <label for="order_addr4" class="smallfonts">나머지주소</label>
                			</td>
                		</tr>
                		<tr>
                			<td>휴대전화</td>
                			<td>
                			<input type="hidden" name="shipping_phone"/>
                				<select id="tel2">
                					<option selected="selected">010</option>
                					<option>011</option>
                					<option>016</option>
                					<option>017</option>
                					<option>018</option>
                					<option>019</option>
                				</select>
                				-
                				<input type="text" size="10" id="order_phone3" class="nullCheck" maxlength="4" onchange="phoneValCheck(this.id)" /><label for="order_phone3" class="label_hidden">휴대전화</label>
                				-
                				<input type="text" size="10" id="order_phone4" class="nullCheck" maxlength="4" onchange="phoneValCheck(this.id)" /><label for="order_phone4" class="label_hidden">휴대전화</label>
                			</td>
                		</tr>
                		<tr>
                			<td>배송메세지</td>
                			<td>
                				<textarea rows="3" cols="80"></textarea>
                			</td>
                		</tr>
                	</table>
                	<br /><br />
                	
                	<table style="border: 0">
                		<tr>
                			<td style="text-align: left; font-weight: bold">결제 금액</td>
                		</tr>
                	</table>
                	<table>
                		<tr>
                			<td>상품구매금액</td>
                			<td>배송비</td>
                			<td>총 결제예정 금액</td>
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
            </div>
        </section>
        
        
        <!-- 부트스트랩 기본 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
