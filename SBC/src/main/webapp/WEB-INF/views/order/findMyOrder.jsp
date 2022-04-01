<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<!-- 부트스트랩 기본 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

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

	html, body {
		height: 100%;
	}
	
	section {
		height: 79%;
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
	.tdBottom {
		width:33.3%;
	}
	#trTop {
		border-top: 1px solid;
		border-bottom: 1px solid;
		font-size: 13px;
	}
	#trBottom {
		border-bottom: 1px solid #808080;
		font-size: 16px;
	}
	.spanText{
		cursor: pointer;
	}
</style>

<script>
	function searchOrder(i) {
		//console.log($("#spanText"+i).text());
		
		
		var form = document.createElement("form");
        form.setAttribute("charset", "UTF-8");
        form.setAttribute("method", "post");  //Post 방식
        form.setAttribute("action", "${root}order/searchOrder"); //요청 보낼 주소
        
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "merchant_uid");
        hiddenField.setAttribute("value", $("#spanText"+i).text());
        form.appendChild(hiddenField);
		
        
        document.body.appendChild(form);
        form.submit();
        document.getElementById("form").remove();

		//document.getElementById("mid").value = $("#spanText"+i).text();

	}
	
	
	function findOrder() {
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
					document.getElementById("result").innerHTML = "";
					document.getElementById("result").innerHTML = 
						"<table style='width: 60%'>"+
		               		"<thead>"+
		               			"<tr id='trTop'>"+
		               				"<th>주문날짜</th>"+
		               				"<th>주문번호</th>"+
		               				"<th>결제금액</th>"+
		               			"</tr>"+
		               		"</thead>"+
		               		"<tbody>"+
		               			"<tr id='trBottom'>"+
			               			"<td style='width:33.3%'>"+resultMap.order_date.substring(0,10)+"</td>"+
			               			"<td style='width:33.3%'><span onclick='searchOrder(0)' id='spanText0' class='spanText'>"+resultMap.merchant_uid+"</td>"+
			               			"<td style='width:33.3%'>"+resultMap.total_amount+"원</td>"+
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
        
        <!-- Section-->
        <section class="py-5">
            <div class="container mt-5">
               	<table>
               		<tr>
               			<th style="font-style: bold">주문번호</th>
               			<td><form id="frm"><input type="text" id="searchBox" name="merchant_uid" style="width: 80%; height: 37px" />&nbsp;<button type="button" class="btn btn-outline-dark" style="vertical-align: top" onclick="findOrder()">확인</button></form></td>
               		</tr>
               	</table>
            </div>
            <div class="container mt-5">
            <div id="result" style="text-align: center; margin-top: 60px">
               	<table style='width: 60%'>
               		<thead>
               			<tr id='trTop'>
               				<th>주문날짜</th>
               				<th>주문번호</th>
               				<th>결제금액</th>
               			</tr>
               		</thead>
               		<tbody>
               			<c:forEach items="${list }" var="list" varStatus="vs">
               			<tr id='trBottom'>
	               			<td class="tdBottom">${list.order_date.substring(0,10)}</td>
	               			<td class="tdBottom"><span onclick="searchOrder(${vs.index})" id="spanText${vs.index}" class="spanText">${list.merchant_uid}</span></td>
	               			<td class="tdBottom">${list.total_amount}원</td>
               			</tr>
               			</c:forEach>
               		</tbody>
               	</table>
               </div>
        	</div>
        </section>
        
        
        <!-- footer-->
   		<c:import url="/WEB-INF/views/include/footer_menu.jsp" />
        
        <!-- 부트스트랩 기본 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
