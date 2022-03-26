<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 절대 경로 지정해주기.  -->
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Modify</title>

<!-- Bootstrap core CSS -->
<link href="${root }css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Custom styles for this template -->
<link href="${root }css/style.css" rel="stylesheet">

<!-- BootStrap LoginForm -->
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${root }images/icons/favicon.ico"/>
<!--===============================================================================================-->
<%-- 	<link rel="stylesheet" type="text/css" href="${root }vendor/bootstrap/css/bootstrap.min.css"> --%>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${root }fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${root }fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${root }vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${root }vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${root }vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${root }vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${root }vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${root }css/util.css">
	<link rel="stylesheet" type="text/css" href="${root }css/main.css">
<!--===============================================================================================-->

</head>
<body>

<div class="limiter">

<div class="container-login100" style="background: -webkit-linear-gradient(left, #fff066, orange);"> <!-- 뒷배경 -->

<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">	
<!--  <div class="container" style="margin-top:100px"> -->
<!--	<div class="row">   -->
		<div class="col-sm-12">
	<!--  	<div class="col-sm-6">  -->
			<div class="card shadow">
				<div class="card-body">
					<!-- 절대 경로 -->
					<form action="${root }member/modify_load" method="get">
					
						<span class="login100-form-title p-b-40">
							Modify
							</span>
						<hr>
					
					<div class="form-group">
						<label for="user_name">이름</label>
						<input type="text" id="user_name" name="user_name" class="form-control" value="테스트" disabled="disabled"/>
					</div>
					<div class="form-group">
						<label for="user_id">아이디</label>
						<input type="text" id="user_id" name="user_id" class="form-control" value="ilovesleep" disabled="disabled"/>
					</div>
					<div class="form-group">
						<label for="user_pw">비밀번호</label>
						<input type="password" id="user_pw" name="user_pw" class="form-control" value="1234"/>
					</div>
					<div class="form-group">
						<label for="user_pw2">비밀번호 확인</label>
						<input type="password" id="user_pw2" name="user_pw2" class="form-control" value="1234"/>
					</div>
					<div class="form-group">
					<!-- UserBean등에 DB문이랑 필드 추가 필요 -->
					<div class="form-group">
						<label for="user_name">전화번호</label>
						<input type="text" id="user_name" name="user_name" class="form-control" value="테스트" />
					</div>
					
					<div class="form-group">
						<label for="user_name">이메일</label>
						<input type="text" id="user_name" name="user_name" class="form-control" value="테스트" />
					</div>
					
					<div class="form-group">
						<label for="user_name">우편번호</label>
						<input type="text" id="user_name" name="user_name" class="form-control" value="테스트" />
					</div>
					
					<div class="form-group">
						<label for="user_name">기본주소</label>
						<input type="text" id="user_name" name="user_name" class="form-control" value="테스트" />
					</div>
					
					<div class="form-group">
						<label for="user_name">상세주소</label>
						<input type="text" id="user_name" name="user_name" class="form-control" value="테스트" />
					</div>
					
					<div class="form-group">
						<label for="user_name">성별</label>
						<input type="text" id="user_name" name="user_name" class="form-control" value="테스트" />
					</div>
					
					<div class="form-group">
						<label for="user_name">생일</label>
						<input type="text" id="user_name" name="user_name" class="form-control" value="테스트" />
					</div>
					
					<%-- 개인정보수집 및 이용동의 --%>
					<div class="form-group">
						<label for="user_name">개인정보수집 및 이용동의</label>
						<input type="text" id="user_name" name="user_name" class="form-control" value="N" disabled="disabled"/>
					</div>
						
					<!--  
						<div class="text-right">
							<button type="submit" class="btn btn-primary">정보수정</button>
						</div>
					</div> -->
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button type="submit" class="login100-form-btn"
							onclick="${root }member/modify">
								Modify
							</button>
						</div> 		
					</div>  	
					
					</form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>

</div>

</body>
</html>