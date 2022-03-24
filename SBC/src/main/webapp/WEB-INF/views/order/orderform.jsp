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


<!--카카오 map api  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=67350dbec2efe1663af9ea26ecc6ec71&libraries=services"></script>	

<style>  
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
		pattern: "[0-9]";
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
		
		if($(pw1_id).val() != $(pw2_id).val()){
			alert("비밀번호 일치여부를 확인해주세요.");
			$("#pw2").focus();
			return;
		}
		
		//비회원 정보동의 
		if(info_agmt == 1){
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
		} else {
			alert("비회원 정보동의 거부시 비회원 구매 서비스 이용이 불가능합니다.")
			return;
		}
	}
	
}

// null check
function txtFieldCheck() {
	
	var txtEle = $("#frm input[class=nullCheck]");
	
	for(var i=0;i<txtEle.length;i++){
		if(""==$(txtEle[i]).val() || null==$(txtEle[i]).val()){
			var ele_id = $(txtEle[i]).attr('id');
			var label_txt = $("label[for="+ele_id+"]").text();
			showAlert(ele_id, label_txt);
			
			return false;
		} else if(""!=$(txtEle[i]).val() || null!=$(txtEle[i]).val()){
			return true;
		}
		
	}

}

function showAlert(ele_id, label_txt) {
	alert(label_txt + " 항목은 필수 입력값입니다.");
	
	//해당 id에 focus
	$("#"+ele_id).focus();
}

//비회원 비밀번호 유효성 검사
var pw1_id = "#frm input[id=order_pw1]";
var pw2_id = "#frm input[id=order_pw2]";
	
$(document).ready(function() {

	if($(pw1_id).val()=="" || $(pw1_id).val()==null){
		$("#pw1").text("주문조회 시 필요합니다. (영문대소문자/숫자/특수문자 중 2가지 이상 조합, 6자~16자)");
	}	
});

function pwVal() {
	if($(pw1_id).val() != $(pw2_id).val()){
		$("#pw2").text("비밀번호가 일치하지 않습니다.");
		$("#pw2").focus();
	} else if($(pw1_id).val() == $(pw2_id).val()){
		$("#pw2").text("");
	}
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
					"<td>입금자명</td>"+
					"<td><input type='text' id='order_deposit' /></td>"+
				"</tr>"+
				"<tr>"+
					"<td>입금은행</td>"+
					"<td>"+
						"<select id='bank_account'>"+
							"<option value='1' selected='selected'>:::선택해주세요.:::</option>"+
							"<option>국민은행: 111122223333 (주)에스비씨</option>"+
							"<option>신한은행: 444455556666 (주)에스비씨</option>"+
							"<option>우리은행: 777788889999 (주)에스비씨</option>"+
						"</select>"+
					"</td>"+
				"</tr>"+
			"</table>";
		} else if($(this).val()=="2"){
			document.getElementById("pay_detail").innerHTML = "소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.";
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
		    alert(msg);
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
                    <h1 class="display-4 fw-bolder">주문하기</h1>
                </div>
            </div>
        </header>
        
        
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
		                    <th>&nbsp;</th>
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
                			<td>image</td>
                			<td style="text-align: left">${list.product_name } [${list.product_option }]</td>
                			<td>${list.price }원</td>
                			<td>${list.quantity }</td>
                			<td><span class="delivery"></span>원</td>
                			<td><span class="eachTotalSpan${vs.index }"></span>원</td>
                		</tr>
                		</c:forEach>
                		<tr class="no-bottom-border">
                			<td colspan="8" style="text-align: right">상품구매금액 <span class="totalPrice"></span> + 배송 <span class="delivery"></span> = 합계: <span class="finalTotalPrice"></span>원</td>
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
	                			<input type="text" id="order_postcode1" class="nullCheck" name="order_postcode" readonly="readonly" /> <button type="button" onclick="shipping1()">우편번호</button><br />
	                			<input type="text" size="50" id="order_addr1" class="nullCheck" name="order_address1" readonly="readonly" /> <label for="order_addr1">기본주소</label><br />
	                			<input type="text" size="50" id="order_addr2" class="nullCheck" name="order_address2" /> <label for="order_addr2">나머지주소</label> 나머지주소
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
                				<input type="text" size="10" id="order_phone1" class="nullCheck" maxlength="4" /><label for="order_phone1" class="label_hidden">휴대전화</label>
                				-
                				<input type="text"  size="10" id="order_phone2" class="nullCheck" maxlength="4" /><label for="order_phone2" class="label_hidden">휴대전화</label>
                			</td>
                		</tr>
                		<tr>
                			<td>이메일<span style="color: red">*</span></td>
                			<td>
                				<input type="hidden" name="email"/>
                				<input type="text" id="order_email1" class="nullCheck" name="email1" /> @ <input type="text" id="order_email2" class="nullCheck" name="email2" />
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
                				이메일을 통해 주문처리과정을 보내드립니다.<br />
								이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요.
                			</td>
                		</tr>
                		<tr>
                			<td>주문조회 <label for="order_pw1" >비밀번호</label><span style="color: red">*</span></td>
                			<td>
                				<input type="password" id="order_pw1" class="nullCheck" />
                				<span id="pw1"></span>
                			</td>
                		</tr>
                		<tr>
                		    <td>주문조회 <label for="order_pw2">비밀번호 확인</label><span style="color: red">*</span></td>
                			<td>
                				<input type="password" id="order_pw2" class="nullCheck" onchange="pwVal()" name="temp_pw" />
                				<span id="pw2"></span>
                			</td>
                		</tr>
                		<tr>
                			<td>비회원 구매 및 결제 개인정보취급방침</td>
                			<td>비회원 구매 및 결제 개인정보취급방침에 대하여 동의합니다.
                				<input type="radio" name="info_agmt" value="1" />동의함 <input type="radio" name="info_agmt" />동의안함<br />
                				<textarea rows="3" cols="80" readonly="readonly">1. 개인정보 수집목적 및 이용목적 : 비회원 구매 서비스 제공 2. 수집하는 개인정보 항목- 주문 시, 성명, 주소, 전화번호, 이메일, 결제정보, 비회원 결제 비밀번호- 취소/교환/반품 신청 시, 환불계좌정보(은행명, 계좌번호, 예금주) 3. 개인정보의 보유기간 및 이용기간원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다. 가. 회사 내부 방침에 의한 정보 보유 사유고객의 개인정보는 회원탈퇴 등 수집 및 이용목적이 달성되거나 동의철회 요청이 있는 경우 지체없이 파기됩니다. 단,「전자상거래 등에서의 소비자보호에 관한 법률」 등 관련법령의 규정에 의하여다음과 같이 거래 관련 권리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 그 기간동안 보유합니다.가. 「전자상거래 등에서의 소비자보호에 관한 법률」 제6조- 계약 또는 청약 철회 등에 관한 기록 : 5년- 대금결재 및 재화 등의 공급에 관한 기록 : 5년- 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년나. 「통신비밀보호법」 제15조의2- 방문(로그)에 관한 기록: 3개월다. 기타 관련 법령 등※ 동의를 거부할 수 있으나 거부시 비회원 구매 서비스 이용이 불가능합니다.
                				</textarea>
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
	                			<input type="text" id="order_postcode2" class="nullCheck" name="shipping_postcode" readonly="readonly" /> <button type="button" onclick="shipping2()">우편번호</button><br />
	                			<input type="text" size="50" id="order_addr3" class="nullCheck" name="shipping_address1" readonly="readonly" /> <label for="order_addr3">기본주소</label><br />
	                			<input type="text" size="50" id="order_addr4" class="nullCheck" name="shipping_address2" /> <label for="order_addr4">나머지주소</label>
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
                				<input type="text" size="10" id="order_phone3" class="nullCheck" maxlength="4" /><label for="order_phone3" class="label_hidden">휴대전화</label>
                				-
                				<input type="text" size="10" id="order_phone4" class="nullCheck" maxlength="4" /><label for="order_phone4" class="label_hidden">휴대전화</label>
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
                		<tr>
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
                			<td>
                				<input type="radio" name="pay_method" value="1" /> 무통장 입금
                				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="pay_method" value="2" /> 카드 결제<br />
                			</td>
                			<td rowspan="2">
                				최종결제 금액<br />
                				<span class="finalTotalPrice"></span>원<br />
                				<input type="checkbox" id="order_agmt" /> 결제정보를 확인하였으며, 구매진행에 동의합니다.<br />
                				<button type="button" onclick="btnClicked()">PAYMENT</button>
                			</td>
                		</tr>
                		<tr>
                			<td>
                				<div id="pay_detail"></div>
                			</td>
                		</tr>
                	</table>
                	<input type="hidden" id="merchant_uid" name="merchant_uid"/>
                	</form>
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
        <!-- iamport.payment.js -->
 		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    </body>
</html>
