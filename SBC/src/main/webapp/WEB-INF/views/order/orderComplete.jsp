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

<style>
	table {
		text-align: left;
		width: 600px;
		font-size: 18px;
		margin: auto;
		border: 1px solid black;
 		border-collapse: separate;
  		border-spacing: 12px;
	}
	th {
		font-style: bold;
		width: 25%;
		vertical-align : top;
	}
	tr, th, td {
		padding: 8px;
	}
</style>

</head>    
    <body>
        <!-- Navigation-->
        <c:import url="/WEB-INF/views/include/header_menu3.jsp" />
        
        
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">주문완료</h1>
                </div>
            </div>
        </header>
        
        
        <!-- Section-->
        <section class="py-5">
            <div class="container mt-5">
               	<table>
               		<tr>
               			<th>주문번호</th>
               			<td>${order.merchant_uid}</td>
               		</tr>
               		<tr>
               			<th>배송지 정보</th>
               			<td>
               				${order.shipping_name} <br />
               				${order.shipping_phone} <br />
               				(${order.shipping_postcode}) <br />
               				${order.shipping_address1} ${order.shipping_address2}
               			</td>
               		</tr>
               		<tr>
               			<th>결제정보</th>
               			<td>
               				총 상품금액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${order.total_price }원<br />
               				배송비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${order.shipping }원 <br />
               				총 결제금액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${order.total_amount }원
               			</td>
               		</tr>
               	</table>
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
