<!-- 회원 주문 페이지 -->
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
	input[type=password] {
	    font-family: "serif";
	
	    &::placeholder {
	        font-family: "air";
	    }
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

<script>
//장바구니 금액 계산
$(document).ready(function() {
	
	var eachTotal = 0;					// 상품별 총액 
	var totalPrice = 0;					// 상품 금액 합 
	var delivery = 0;					// 배송비
	var finalTotalPrice = 0; 			// 최종 가격(총 가격 + 배송비)
	
	for(var i=0;i<${list.size() };i++){
		//이름 설정 
		var cnt = ".cnt"+i;
		var price = ".price"+i;
		var eachTotalSpan = ".eachTotalSpan"+i;
		
		//형변환 
		var cntVal = parseInt($(cnt).val());
		var priceVal = parseInt($(price).val());
		
		eachTotal = cntVal * priceVal;
		
		/* 화폐 단위로 변경 */
		var eachTotalCurrency = eachTotal.toLocaleString('ko-KR');
		
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

//btn click
function btnClicked() {
	
	var result = txtFieldCheck() == true?true:false;

	//email, phone -> form 넘기기 전에 value 정리 
	$('input[name=email]').attr('value', $('input[name=email1]').val()+"@"+$('input[name=email2]').val());
	$('input[name=order_phone]').attr('value', $('select[id=tel1]').val()+"-"+$('input[id=order_phone1]').val()+"-"+$('input[id=order_phone2]').val());
	$('input[name=shipping_phone]').attr('value', $('select[id=tel2]').val()+"-"+$('input[id=order_phone3]').val()+"-"+$('input[id=order_phone4]').val());
	
	var info_agmt = $('input[name="info_agmt"]:checked').val();
	var pay_method = $('input[name="pay_method"]:checked').val();
	
	//null check
	if(result == true){

		//구매진행 동의 
		if($('input[id="order_agmt"]').is(':checked')){
			//카드결제 눌렀을 때만 iamport 실행 
			if(pay_method == 2){
				iamport();
			
			//무통장입금 실행시 바로 submit 
			} else if(pay_method == 1){
				
				//입금자명 null check
				if($("input[id=order_deposit]").val()=="" || $("input[id=order_deposit]").val()==null){
					alert("입금자명을 입력해주세요.");
					return;
				}
				
				//입금은행 null check
				if($("select[id=bank_account]").val() == 1){
					alert("입금 은행을 선택해주세요.");
					return;
				}
				
				var merchant_uid = new Date().getTime();
				$("input[id=merchant_uid]").attr('value', merchant_uid);
				$("#frm").submit();
			} else {
				alert("결제수단을 선택해주세요.");
				return;
			}
		} else{
			alert("구매진행동의 거부시 구매 서비스 이용이 불가능합니다.")
			return;
		}
	}
	
}

// null check
function txtFieldCheck() {
	
	var txtEle = $("#frm input[class=nullCheck]");
	var nullCnt = 0;
	for(var i=0;i<txtEle.length;i++){
		if(""==$(txtEle[i]).val() || null==$(txtEle[i]).val()){
			var ele_id = $(txtEle[i]).attr('id');
			var label_txt = $("label[for="+ele_id+"]").text();
			showAlert(ele_id, label_txt);
			$(txtEle[i]).focus();
			return false;
		} else {
			nullCnt = nullCnt + 1;
		}
	}
	if(nullCnt = txtEle.length){
		return true;
	}

}

function showAlert(ele_id, label_txt) {
	alert(label_txt + " 항목은 필수 입력값입니다.");
	
	//해당 id에 focus
	$("#"+ele_id).focus();
}

//email 선택하기 
function selectEmail(ele) {
	var email2 = $("input[name=email2]");
	if($(ele).val()=="1"){
		email2.attr('readonly', false);
		email2.val('');
	} else {
		email2.attr('readonly', true);
		email2.val($(ele).val());
	}
}

//배송지 정보 선택하기
$(document).ready(function() {
	$("input[name=selectAddr]").change(function() {
		if($(this).val()=="1"){
			$("input[id=order_name2]").attr('value', $("input[id=order_name1]").val());
			$("input[id=order_postcode2]").attr('value', $("input[id=order_postcode1]").val());
			$("input[id=order_addr3]").attr('value', $("input[id=order_addr1]").val());
			$("input[id=order_addr4]").attr('value', $("input[id=order_addr2]").val());
			$("input[id=order_phone3]").attr('value', $("input[id=order_phone1]").val());
			$("input[id=order_phone4]").attr('value', $("input[id=order_phone2]").val());
		} else if($(this).val()=="2"){
			$("input[id=order_name2]").attr('value', "");
			$("input[id=order_postcode2]").attr('value', "");
			$("input[id=order_addr3]").attr('value', "");
			$("input[id=order_addr4]").attr('value', "");
			$("input[id=order_phone3]").attr('value', "");
			$("input[id=order_phone4]").attr('value', "");
		}
	});
});

//무통장 입금 vs 카드결제 선택
$(document).ready(function() {
	$("input[name=pay_method]").change(function name() {
		if($(this).val()=="1"){
			document.getElementById("pay_detail").innerHTML =
			"<table style='border:0; text-align: left'>"+
				"<tr>"+
					"<td style='border:0'>입금자명</td>"+
					"<td style='border:0'><input type='text' id='order_deposit' /></td>"+
				"</tr>"+
				"<tr>"+
					"<td style='border:0'>입금은행</td>"+
					"<td style='border:0'>"+
						"<select id='bank_account' style='padding: 5px'>"+
							"<option value='1' selected='selected'>:::선택해주세요.:::</option>"+
							"<option>국민은행: 111122223333 (주)에스비씨</option>"+
							"<option>신한은행: 444455556666 (주)에스비씨</option>"+
							"<option>우리은행: 777788889999 (주)에스비씨</option>"+
						"</select>"+
					"</td>"+
				"</tr>"+
			"</table>";
		} else if($(this).val()=="2"){
			document.getElementById("pay_detail").innerHTML = "<span class='smallfonts'>소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</span>";
		}
	});
});

//====================================================================================
//카드결제 아임포트
	function iamport(){
		
		console.log("iamport starts");
	
		var name = "${list[0].product_name }";
		var tel = $('input[name=order_phone]').val();
		var email = $('input[name=email]').val();
		var post = $("input[id=order_postcode2]").val();
		var adr = $("input[id=order_addr3]").val();
		var total = $('input[name=total_amount]').val();
		
		IMP.init('imp73937829');	//가맹점 식별 코드
		IMP.request_pay({
		    pg : 'html5_inicis',
		    pay_method : 'card',
		    merchant_uid : new Date().getTime(),
		    name : name ,
		    amount : total, 
		    buyer_email : email,
		    buyer_name : name,
		    buyer_tel : tel,
		    buyer_addr : adr,
		    buyer_postcode : post
		}, function(rsp) {
			//console.log(rsp);
		    if ( rsp.success ) {
		    	var msg = '결제가 완료되었습니다.';
		        msg += '결제 번호 : ' + rsp.imp_uid;
		        msg += '주문 번호 : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
				
				$("input[id=merchant_uid]").attr('value', rsp.merchant_uid+"");

				$("#frm").submit();
		    } else {
		    	 var msg = '결제에 실패하였습니다.';
		         msg += '//' + rsp.error_msg;
		    }
		    //alert(msg);
		});
	}
	
	//================================================================================================
	//주소 검색
    function shipping1() {
        new daum.Postcode({
            oncomplete: function(data) {
            	var post = data.zonecode;
                var addr = data.address; 

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("order_postcode1").value = post;
                document.getElementById("order_addr1").value = addr;

            }
        }).open();
    }
	
    function shipping2() {
        new daum.Postcode({
            oncomplete: function(data) {
            	var post = data.zonecode;
                var addr = data.address; 

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("order_postcode2").value = post;
                document.getElementById("order_addr3").value = addr;

            }
        }).open();
    }
    
    //유효성 검사
	//휴대전화
	function phoneValCheck(id) {
		var tel = $("#"+id).val();
		
		var telCheck = /^[0-9]{3,4}/;
		
		if(!telCheck.test(tel)){
	   		alert("숫자만 입력 가능합니다.");
	   		$("#"+id).val("");
	   		$("#"+id).focus();
	   	}
		
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
                	<table style="border: 0">
                		<tr>
                			<td style="text-align: left; font-weight: bold"">주문내역</td>
                		</tr>
                	</table>
                	<form action="${root }order/orderComplete" method="post" id="frm">
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
                			<td><fmt:formatNumber value="${list.price }" pattern="#,###"/>원</td>
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
                			<td style="text-align: right"><span style="color: red">*</span>필수입력사항</td>
                		</tr>
                	</table>
                	
                	<table style="text-align: left">
                		<tr>
                			<td><label for="order_name1">주문하시는 분</label><span style="color: red">*</span></td>
                			<td><input type="text" id="order_name1" class="nullCheck" name="order_name" /></td>
                		</tr>
                	
                		<tr>
                			<td>주소<span style="color: red">*</span></td>
                			<td>
                				<label for="order_postcode1" class="label_hidden">우편번호</label>
	                			<input type="text" id="order_postcode1" class="nullCheck" name="order_postcode" readonly="readonly" /> <button type="button" class="btn btn-outline-dark" onclick="shipping1()">우편번호</button><br />
	                			<input type="text" size="50" id="order_addr1" class="nullCheck mtop" name="order_address1" readonly="readonly" /> <label for="order_addr1" class="smallfonts">기본주소</label><br />
	                			<input type="text" size="50" id="order_addr2" class="nullCheck mtop" name="order_address2" /> <label for="order_addr2" class="smallfonts">나머지주소</label>
                			</td>
                		</tr>
                		<tr>
                			<td>휴대전화<span style="color: red">*</span></td>
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
                			<td>이메일<span style="color: red">*</span></td>
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
                				</select><br />
                				<div class="smallfonts">
	                				이메일을 통해 주문처리과정을 보내드립니다.<br />
									이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요.
								</div>
                			</td>
                		</tr>
                	</table>
                	<br /><br />
                	
                	<table style="border: 0">
                		<tr>
                			<td style="text-align: left; font-weight: bold">배송지 정보</td>
                			<td style="text-align: right"><span style="color: red">*</span>필수입력사항</td>
                		</tr>
                	</table>
                	<table style="text-align: left">
                		<tr>
                			<td>배송지 선택</td>
                			<td>
                				<input type="radio" name="selectAddr" value="1" /> 주문자 정보와 동일 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="selectAddr" value="2" /> 새로운 배송지
                			</td>
                		</tr>
                		<tr>
                			<td><label for="order_name2">받으시는 분</label><span style="color: red">*</span></td>
                			<td><input type="text" id="order_name2" class="nullCheck" name="shipping_name" /></td>
                		</tr>
                		<tr>
                			<td>주소<span style="color: red">*</span></td>
                			<td>
                				<label for="order_postcode2" class="label_hidden">우편번호</label>
	                			<input type="text" id="order_postcode2" class="nullCheck" name="shipping_postcode" readonly="readonly" /> <button type="button" class="btn btn-outline-dark" onclick="shipping2()">우편번호</button><br />
	                			<input type="text" size="50" id="order_addr3" class="nullCheck mtop" name="shipping_address1" readonly="readonly" /> <label for="order_addr3" class="smallfonts">기본주소</label><br />
	                			<input type="text" size="50" id="order_addr4" class="nullCheck mtop" name="shipping_address2" /> <label for="order_addr4" class="smallfonts">나머지주소</label>
                			</td>
                		</tr>
                		<tr>
                			<td>휴대전화<span style="color: red">*</span></td>
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
                			<td style="text-align: left; font-weight: bold">결제 예정 금액</td>
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
                	<br /><br />
                	
                	<table style="border: 0">
                		<tr>
                			<td style="text-align: left; font-weight: bold">결제수단</td>
                		</tr>
                	</table>
                	<table style="text-align: left">
                		<tr>
                			<td class="tdBottom">
                				<input type="radio" name="pay_method" value="1" /> 무통장 입금
                				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="pay_method" value="2" /> 카드 결제<br />
                			</td>
                			<td rowspan="2" style="padding: 20px; padding-left: 40px">
                				최종결제 금액<br />
                				<span class="finalTotalPrice priceBottom" class="mbottom"></span>원<br />
                				<input type="checkbox" id="order_agmt" /> 결제정보를 확인하였으며, 구매진행에 동의합니다.<br />
                				<button type="button" class="btn btn-outline-dark mtop" onclick="btnClicked()" style="width: 57%">PAYMENT</button>
                			</td>
                		</tr>
                		<tr>
                			<td class="tdBottom">
                				<div id="pay_detail"></div>
                			</td>
                		</tr>
                	</table>
                	<input type="hidden" id="merchant_uid" name="merchant_uid"/>
                	</form>
                </div>
            </div>
        </section>
        
   	<!-- footer-->
    <c:import url="/WEB-INF/views/include/footer_menu.jsp" />
        
        
        <!-- 부트스트랩 기본 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <!-- iamport.payment.js -->
 		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    </body>
</html>
