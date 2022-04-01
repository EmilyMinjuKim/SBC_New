<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script> 

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>Shop</title>

<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- 부트스트랩 기본 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- Spinner CSS -->
<link rel="stylesheet" href="${root }jquery-ui-1.11.4/jquery-ui.css" />

<style type="text/css">
	@font-face {
	    font-family: 'Cafe24Dongdong';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Dongdong.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	*{
		font-family: 'Cafe24Dongdong';
	}
	
	th {
		text-align: center;
		font-size: 20pt;
		font-style: bold;
		padding: 10px;
	}
	tr, td{
		padding: 8px;
	}
	
	#option_box_del {
		cursor: pointer
	}
	
	#t1 {
		width: 78%;
	}
	#opt_detail {
		width: 100%;
	}
	#product_description{
		 text-align: center; 
		 margin-top: 10%;
	}
	.bfSale{
		text-decoration: line-through;
		font-size: 14px;
		color: #696969;
	}
</style>

<script>
	function addToCart() {
		
		//null check
		var cnt = 0;
		for(var i=0;i<${productList.size()};i++){
			if($("#q"+i).val()==0){
				cnt = cnt+1;
			}
		}
		if(cnt==${productList.size()}){
			alert("옵션을 선택해주세요.");
			return;
		}
		
		var form = $("#frm").serializeArray();
		console.log(form);
		
 		$.ajax({
			type : "post",
			url : "${root}product/addCart",
			dataType : "json",
			data : form,
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
				if(data != 0){
					document.getElementById("countAll").innerHTML = data;
				}
			}
		});
		
	}

	
	//옵션 선택시 이벤트
	function selectOpt() {
		var optVal = $("#opt option:selected").val();
		
		if(optVal == null |+ optVal ==""){
			return;
		}
		
		var idx = $("#opt option:selected").attr("idx");
		var pid = $("#opt option:selected").attr("pid");

		$("#opt_detail").append( 
			"<table id='opt_"+idx+"'>"+
				"<tr>"+
					"<td style='width: 300px'>"+
						"${repProduct.product_name }<br />"+optVal+
					"</td>"+
					"<td>"+
						"<input type='text' class='spinner spinner"+idx+"' style='width: 50px' value='1' />"+
					"</td>"+
					"<td>"+
						"<img src='//img.echosting.cafe24.com/design/skin/default/product/btn_price_delete.gif' id='option_box_del' onclick='optDel("+idx+")'/>"+
					"</td>"+
					"<td style='width: 150px'>${repProduct.price}원</td>"+
				"</tr>"+
			"</table>"
		);
		
		$("#q"+idx).attr('value', '1');
		
		//스피너 호출 
		$(".spinner").spinner();
		$(".spinner").bind("spinstop", function() {
			maxMin();
		});
		
		
	}
	
	//최소, 최대 수량 설정
	function maxMin(){
			var idx = $("#opt option:selected").attr("idx");
		
			//이름 설정 
			var cnt = ".spinner"+idx;
			
			//최소, 최대 주문 수량 설정
			if($(cnt).val() < 1){
				$(cnt).val(1);
			} else if($(cnt).val() > 10){
				$(cnt).val(10);
				alert("구매할 수 있는 최대 수량은 10입니다.");
			}
			
			$("#q"+idx).attr('value', $(cnt).val());
		}

	//option box delete
	function optDel(idx) {
		$("#opt_"+idx).remove();
		$("#q"+idx).attr('value', '0');
		$("#opt").val("").prop("selected", true);
	}

	


</script>
</head>    
    <body>
        <!-- Navigation-->
        <c:import url="/WEB-INF/views/include/header_menu.jsp" />

        
        <!-- Section-->
        <section class="py-5" >
            <div class="container px-4 px-lg-8 mt-5" >
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" style="margin-bottom:10%">
					<table id="t1">
						<tr>
							<td>
								<img src="${root }images/product/${repProduct.product_id }.jpg" style="position: relative; right:20%; width: 550px; height:600px;" />
							</td>
							<td style="width: 600px">
								<table id="t2" style="width: 100%">
									<thead>
									<tr style="height: 80px">
										<th colspan="2">${repProduct.product_name }</th>
									</tr>
									</thead>
									<tr>
										<td style="vertical-align: top;">PRICE</td>
										<td>
										<span style="color: #FF1493">25%</span>&nbsp;&nbsp;
										<fmt:formatNumber value="${repProduct.price }" pattern="#,###"/>원 <br>
										<span class="bfSale"><fmt:formatNumber value="${(repProduct.price)*1.25 }" pattern="#,###"/>원</span>
										</td>
									</tr>
									<tr>
										<td>OPTION</td>
										<td>
											<select id="opt" style="width: 100%; height: 40px; line-height: normal;" onchange="selectOpt()">
												<option value="" selected="selected">- [필수] 옵션을 선택해주세요 -</option>
												<c:forEach items="${productList }" var="list" varStatus="vs">
												<option idx="${vs.index }" pid="${list.product_id}">${list.product_option }</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<div id="opt_detail">
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="2" style="text-align: center">
											<button type="button" onclick="addToCart()" class="btn btn-outline-dark" style="width: 100%">ADD TO CART</button>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
                </div>
                <hr>
                <div id="product_description">
                	<img src="${root }images/product/${repProduct.product_id }-des.jpg">
                </div>
            </div>
        </section>
        
		<form id="frm">
			<c:forEach items="${productList }" var="pl" varStatus="v">
				<input type="hidden" name="cartList[${v.index }].product_id" value="${pl.product_id }" />
				<input type="hidden" name="cartList[${v.index }].quantity" value="0" id="q${v.index }" />
			</c:forEach>
		</form>
		
	<!-- footer-->
    <c:import url="/WEB-INF/views/include/footer_menu.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      <script src="${root }jquery-ui-1.11.4/jquery-ui.js"></script>
    </body>
</html>