<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<!-- Bootstrap CDN -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>


	<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<h1 class="display-3">Thank You!</h1>
						<p class="lead">
							<strong>${signupBean.user_id} 님회원가입을 축하드립니다.</strong>
							<h3>${signupBean.email} 으로 인증메일을 보냈습니다. </h3>
							인증 후, 사이트 이용이 정상적으로 가능합니다.
						</p>
						<hr>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>








