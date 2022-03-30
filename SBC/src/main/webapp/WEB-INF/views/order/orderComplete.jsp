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
	#thanks{
		text-align: center;
		font-size: 20px;
		margin-bottom: 5%;
	}
</style>

</head>    
    <body>
        <!-- Navigation-->
        <c:import url="/WEB-INF/views/include/header_menu3.jsp" />

        <!-- Section-->
        <section class="py-5">
            <div class="container mt-5">
            	<div class="justify-content-center">
            		<div id="thanks">주문해주셔서 감사합니다 🐾</div>
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
        	</div>
        </section>

        <!-- 부트스트랩 기본 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
