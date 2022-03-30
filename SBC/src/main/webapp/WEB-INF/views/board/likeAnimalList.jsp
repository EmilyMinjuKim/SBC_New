<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http//www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>나의 관심 동물</title>

<link href="${root }css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<c:import url='/WEB-INF/views/include/header_menu4.jsp' />


<style>
html{
height : 100%;
}
body{
height : 80%;
}
section{
height : 50%;
margin-bottom: 50px;
}
footer{
height : 20%;
margin-top: 100px;
}


.justify-content-left {
   -ms-flex-pack: left!important;
   justify-content: left!important
}

.justify-content-center {
   -ms-flex-pack: center!important;
   justify-content: center!important
}

.justify-content-right {
   -ms-flex-pack: right!important;
   justify-content: right!important
}

.animalinfo th{
	font-size: 20px;
}

.card {
   position: relative;
   display: -ms-flexbox;
   display: flex;
   -ms-flex-direction: column;
   flex-direction: column;
   min-width: 0;
   word-wrap: break-word;
   background-color: #fff;
   background-clip: border-box;
   border: 1px solid rgba(0, 0, 0, .125);
   border-radius: .25rem;
}

.shadow {
   box-shadow: 0 .5rem 1rem rgba(0, 0, 0, .15) !important;
}

.aa3a{
	color: #ff61c9;
	border: 2px solid #ff61c9;
	vertical-align: middle;
	text-decoration: none;
	height: 38px; 
	position: relative; 
	left: 60%;
	font-weight: 900;
	background: white;
}

.aa3b{
	vertical-align: middle;
	position: relative; 
	left: 100%;
}

.aa3a:hover {
	color: white;
	border: 2px solid white;
	vertical-align: middle;
	text-decoration: none;
	height: 38px; 
	position: relative; 
	left: 60%;
	font-weight: 900;
	background: #ff61c9;
	
}
</style>

</head>
<body>


	<!-- Related items section-->
<section class="py-5 bg-light ">
	<div class="container mt-12">
		<div style="text-align: center;">
			<h1 class="fw-bolder mb-4 pb-4" style="color:#ff6c99;">나의 관심 동물</h1>
		</div>
		<c:forEach var='dog' items='${list}' varStatus="status">
			<!-- Product actions-->
				<div class="h-100 pt-5 card shadow">
					<div class="row card-body">
						<div class="col-md-6 text-center">
							<img class="card-img-top" src="${dog['img'] }" alt="..." />
						</div>
						<div class="row col-md-6">
							<div class="row col-md-8">
								<h5 class="fw-bolder">${dog['상태']}   
								&nbsp;<span style="font-size: 12pt">${dog['성별']}</span>
								<c:set var="sex" value="${dog['성별']}" scope="session"/>
								<c:choose>
									<c:when test="${sex=='수컷'||sex==' 수컷'||sex=='수컷 '||sex==' 수컷 '}">
										<img src="${root}img/board/male.png">
									</c:when>

									<c:when test="${sex=='암컷'||sex==' 암컷'||sex=='암컷 '||sex==' 암컷 '}">
										<img src="${root}img/board/female.png">
									</c:when>
									
									<c:otherwise>
										<img src="${root}img/board/gender.png">
									</c:otherwise>
								</c:choose>
								 <span style="font-size: 15px; width: 20px;">중성화 여부 : ${dog['중성화']}</span>
								</h5>
							</div>
							<div class="row col-md-2"> <a class="btn aa3b" onclick="addLikeFunc('${dog['animal_code']}');">
							<img src="${root }img/board/redheart.gif" style="max-width: 80%;  max-height: 80%;"/>
							</a></div>
							<div style="position: relative; top: -5%;">
							<div class="fs-5 mb-5" style="position: relative;">
								<span style="font-weight: 900;">${dog['품종']}</span><br>
								<span style="font-weight: 600;">${dog['색상']}/${dog['나이/체중']}</span>
							</div>
							<table class="animalinfo" style="font-weight: 900;">
								<tr>
									<th colspan="2">공고번호 :</th>
									<td colspan="2">${dog['공고번호']}</td>
								</tr>
								<tr>
									<th>품종 : </th>
									<td colspan="2">${dog['품종']}</td>
								</tr>
								<tr>
									<th>색상 : </th>
									<td  colspan="2">${dog['색상']}</td>
								</tr>
								<tr>
									<th style="width: 20%;" colspan="2">나이/체중 :</th>
									<td colspan="2">${dog['나이/체중']}</td>
								</tr>
								<tr>
									<th colspan="2">발생장소 : </th>
									<td colspan="2">${dog['발생장소']}</td>
								</tr>
								<tr>
									<th colspan="2">접수일시 : </th>
									<td colspan="2">${dog['접수일시']}</td>
								</tr>
								<tr>
									<th colspan="2">중성화 : </th>
									<td colspan="2">${dog['중성화']}</td>
								</tr>
								<tr>
									<th colspan="2">특징 : </th>
									<td colspan="2">${dog['특징']}</td>
								</tr>
								<tr>
									<th colspan="2">등록번호 : </th>
									<td colspan="2">${dog['등록번호']}</td>
								</tr>
								<tr>
									<th colspan="2">RFID_CD : </th>
									<td colspan="2">${dog['RFID_CD']}</td>
								</tr>
								<tr>
									<th colspan="2">특징 : </th>
									<td colspan="2">${dog['8']}</td>
								</tr>
								<tr>
									<th colspan="2">관할기관 : </th>
									<td colspan="2">${dog['관할기관']}</td>
								</tr>
								<tr>
									<th colspan="2">보호센터 : </th>
									<td colspan="2">${dog['보호센터']}</td>
								</tr>
								<tr>
									<th colspan="2">보호센터<br>연락처 : </th>
									<td colspan="2">${dog['보호센터연락처']}</td>
								</tr>
								<tr>
									<th colspan="2">보호장소 : </th>
									<td colspan="2">${dog['보호장소']}</td>
								</tr>
							</table>
							</div>
						</div>
					</div>
				</div><br>
		</c:forEach>
	</div>
	<c:import url='/WEB-INF/views/include/footer_menu2.jsp' />
</section>

	
	
	
	
	
<script>
//관심동물 삭제
function addLikeFunc(desertionNo) {
	console.log(desertionNo);
	    $.ajax({
    "url" : "${root}board/addAnimal/"+desertionNo,
    "type" : "get",
    "dataType" : "text",
    "async" : "false",
    "success" : function(result) {
  	 		 console.log("결과값?"+result)
				if(result.trim()=="true"){
					alert("관심동물 등록!!")
				}else{
					alert("관심동물 삭제!!")
				}
				},
		"error" : function(x, o, e) {
        alert(x.status + ":" + o + ":" + e);
     }

 	})
 	location.reload();
}


</script>
		
</body>
</html>
