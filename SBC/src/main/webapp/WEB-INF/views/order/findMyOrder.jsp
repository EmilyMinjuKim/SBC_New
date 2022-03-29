<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%--날짜  --%>
<c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script> 

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>SBC</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" href="${root }css/product-style.css"/>

<style>

	html, body {
		height: 100%;
	}
	
	section {
		height: 50%;
	}
	
	table {
		text-align: center;
		width: 600px;
		font-size: 18px;
		margin: auto;
		border: none;
	}
	tr, th, td {
		padding: 8px;
	}
	#trTop {
		border-top: 1px solid;
		font-size: 13px;
		color: #808080;
	}
	#trBottom {
		border-top: 1px solid #808080;
		border-bottom: 1px solid #808080;
		font-size: 16px;
	}
</style>

<script>

	function searchOrder() {
		var orderNum = $("#frm").serialize();
		
 		$.ajax({
			type : "post",
			url : "${root}order/showOrder",
			dataType : "json",
			data : orderNum,
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
			success : function(resultMap) {
				
				if(resultMap.merchant_uid != null){
					document.getElementById("result").innerHTML = 
						"<table style='width: 60%'>"+
		               		"<thead>"+
		               			"<tr id='trTop'>"+
		               				"<th>주문날짜</th>"+
		               				"<th>주문번호</th>"+
		               				"<th>주문명</th>"+
		               				"<th>결제금액</th>"+
		               			"</tr>"+
		               		"</thead>"+
		               		"<tbody>"+
		               			"<tr id='trBottom'>"+
			               			"<td>"+resultMap.order_date.substring(0,10)+"</td>"+
			               			"<td>"+resultMap.merchant_uid+"</td>"+
			               			"<td>"+resultMap.product_name+"</td>"+
			               			"<td>"+resultMap.total_amount+"원</td>"+
		               			"</tr>"+
		               		"</tbody>"+
		               	"</table>";
				} else {
					alert("조회하신 주문번호가 존재하지 않습니다.");
					$("#searchBox").focus();
				}
				
				
			} 
		});
	}
</script>

</head>    
    <body>
        <!-- Navigation-->
        <c:import url="/WEB-INF/views/include/header_menu3.jsp" />
        
        
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">주문조회</h1>
                </div>
            </div>
        </header>
        
        
        <!-- Section-->
        <section class="py-5">
            <div class="container mt-5">
               	<table>
               		<tr>
               			<th style="font-style: bold">주문번호</th>
               			<td><form id="frm"><input type="text" id="searchBox" name="merchant_uid" style="width: 80%; height: 37px" />&nbsp;<button type="button" class="btn btn-outline-dark" style="vertical-align: top" onclick="searchOrder()">확인</button></form></td>
               		</tr>
               	</table>
               	<div id="result" style="text-align: center; margin-top: 60px"></div>
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
