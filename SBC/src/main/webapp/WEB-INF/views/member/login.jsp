<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--<meta http-equiv="X-UA-Compatible" content="IE=edge">-->
<!--<meta name="viewport" content="width=device-width, initial-scale=1"> -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>로그인페이지 뷰</title>

<!-- 구글 연동 API -->
<!-- content에 자신의 OAuth2.0 클라이언트ID를 넣음 -->
<meta name="google-signin-client_id"
	content="389448288457-e7gjhm0fr429qnsvhfvegejk0q5e932e.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>

<!--카카오 연동 API -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<!-- maintest와 비교 -->
<!-- Bootstrap core CSS -->
<link href="${root }css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- 추가 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<!-- Custom styles for this template -->
<link href="${root }css/style.css" rel="stylesheet">

<!-- BootStrap LoginForm -->
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="${root }images/icons/favicon.ico" />
<!--===============================================================================================-->
<%-- 	<link rel="stylesheet" type="text/css" href="${root }vendor/bootstrap/css/bootstrap.min.css"> --%>
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${root }fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${root }fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${root }vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${root }vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${root }vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${root }vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${root }vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${root }css/util.css">
<link rel="stylesheet" type="text/css" href="${root }css/main.css">
<!--===============================================================================================-->

<script>
	
</script>

<style>
@font-face {
	font-family: 'Cafe24Dongdong';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Dongdong.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: 'Cafe24Dongdong' !important;
} 

.h4 {
text-align: center;
color:#808080;
font-size: 20px;
}

.txt2{
font-size: 18px;
}

.kakao-login-btn {
	border-radius: 70%;
    overflow: hidden;
}
#user_password {
	font-family: none !important;
}


</style>

</head>

<body>

	<!-- 상단메뉴 분리 해서넣어줌  -->
	<c:import url="/WEB-INF/views/include/header_menu2.jsp" />

	<div class="limiter">

		<div class="container-login100">
			<!-- 뒷배경 -->
			<%-- form:form이랑 form 같이 쓰면 안됨 --%>
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54"
				style="border: solid 1px lightgray;">
				<!--<form class="login100-form validate-form"> -->
				<br> <span class="login100-form-title p-b-49 mb-3"> Login </span>
				<p class="h4">
					사지 말고, 입양하세요.<br> 새로운 가족을 맞이하세요!
				</p>
				<br>

				<c:if test="${fail == 'true' }">
					<div class="alert alert-danger">
						<h3>로그인 실패</h3>
						<p>아이디 비밀번호를 확인해주세요</p>
					</div>
				</c:if>

				<form:form action="${root }member/login_load"
					modelAttribute="tempLoginUserBeanT" method="post">
					<div class="form-group">
						<form:label path="user_id">UserID</form:label>
						<form:input path="user_id" id="user_id" class="form-control" />
						<form:errors path="user_id" style="color:red" />
					</div>

					<div class="form-group">
						<form:label path="user_password">Password</form:label>
						<form:password path="user_password" id="user_password"
							class="form-control"/>
						<form:errors path="user_password" style="color:red" />
					</div>
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<form:button type="submit" class="login100-form-btn">Login</form:button>
						</div>
					</div>

					<div class="txt1 text-center p-t-20 p-b-20">

						<form:checkbox path="cookieChk1" tabindex="4" />
						<i>&nbsp; 로그인 유지</i> <br> <br />

						<br> <br /> <a href="${root }member/searchId" class="txt2">아이디
							찾기</a> | <a href="${root }member/searchPassword" class="txt2">비밀번호
							찾기</a> | <a href="${root }member/signup" class="txt2">회원가입</a>
					</div>

				</form:form>


				<!-- 
				<div class="flex-col-c p-t-20">
				
					<span class="txt1 p-b-20" style="text-align: center"><p>or</p>
					소셜로그인</span>

				</div> -->


				<%-- <!-- 카카오 로그인 추가(api 연동 후 경로 설정) -->
				<div  id="kakaoLogin" align="center">
					<a id="kakao-login-btn"> <img
						src="${root}images/kakao_login_large_wide.png" width="100%"
						onclick="kakaoLogin();" />
					</a> <a href="javascript:void(0)"></a>
				</div> --%>
				
			</div>
		</div>
	</div>

	<div id="dropDownSelect1"></div>

	<!-- 로그인 폼 -->
	<!--===============================================================================================-->
	<script src="${root }vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="${root }vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="${root }vendor/bootstrap/js/popper.js"></script>
	<script src="${root }vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="${root }vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="${root }vendor/daterangepicker/moment.min.js"></script>
	<script src="${root }vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="${root }vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="${root }js/main2.js"></script>

	<!-- 구글 api 사용을 위한 스크립트 -->
	<script src="https://apis.google.com/js/platform.js?onload=init" async
		defer></script>

	<!-- 하단메뉴 분리 해서넣어줌  -->
	<c:import url="/WEB-INF/views/include/footer_menu2.jsp" />

	<!-- 기본 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="${root }js/bootstrap.min.js"></script>
	<script src="${root }js/SmoothScroll.js"></script>
	<script src="${root }js/theme-scripts.js"></script>

</body>
</html>