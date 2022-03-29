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

<link href="../css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

</head>
<body>


	<!-- Related items section-->
<section class="py-5 bg-light">
	<div class="container mt-12">
		<div style="text-align: center;">
			<h1 class="fw-bolder mb-4">나의 관심 동물</h1>
		</div>
		<c:forEach var='dog' items='${list}' varStatus="status">
			<!-- Product actions-->
				<div class="card h-100">
					<div class="row card-body p-4">
						<div class="col-md-6 text-center">
							<img class="card-img-top" src="${dog['img'] }" alt="..." />
						</div>
						<div class="row col-md-6">
							<div>
								<h5 class="fw-bolder">${dog['12']}   
								&nbsp;<span style="font-size: 12pt">${dog['3']}</span>
								<c:set var="sex" value="${dog['3']}" scope="session"/>
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
								 <span style="font-size: 10pt">중성화 여부 : ${dog['7']}</span>
								</h5>
								 <a class="btn btn-outline-dark mt-auto" onclick="addLikeFunc('${dog['animal_code']}');">관심동물 삭제</a>
							</div>
							
							<div class="fs-5 mb-5">
								<span>${dog['1']} </span><br> <span>${dog['2']}/${dog['4']}</span>
							</div>
							<table class="animalinfo">
								<tr>
									<th>공고번호</th>
									<td>${dog['0']}</td>
								</tr>
								<tr>
									<th>품종</th>
									<td>${dog['1']}</td>
								</tr>
								<tr>
									<th>색상</th>
									<td>${dog['2']}</td>
								</tr>
								<tr>
									<th>나이/체중</th>
									<td>${dog['4']}</td>
								</tr>
								<tr>
									<th>발생장소</th>
									<td>${dog['5']}</td>
								</tr>
								<tr>
									<th>접수일시</th>
									<td>${dog['6']}</td>
									<th>중성화</th>
									<td>${dog['7']}</td>
								</tr>
								<tr>
									<th>특징</th>
									<td>${dog['8']}</td>
								</tr>
								<tr>
									<th>등록번호</th>
									<td>${dog['9']}</td>
									<th>RFID_CD</th>
									<td>${dog['10']}</td>
								</tr>
								<tr>
									<th>특징</th>
									<td>${dog['8']}</td>
								</tr>
								<tr>
									<th>관할기관</th>
									<td>${dog['11']}</td>
								</tr>
								<tr>
									<th>보호센터</th>
									<td>${dog['13']}</td>
									<th>보호센터연락처</th>
									<td>${dog['14']}</td>
								</tr>
								<tr>
									<th>보호장소</th>
									<td>${dog['15']}</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
		</c:forEach>
	</div>
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
}










</script>
</body>
</html>
