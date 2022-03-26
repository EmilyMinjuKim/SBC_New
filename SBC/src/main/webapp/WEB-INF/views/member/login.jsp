<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--<meta http-equiv="X-UA-Compatible" content="IE=edge">-->
<!--<meta name="viewport" content="width=device-width, initial-scale=1"> -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>로그인페이지 뷰</title>

<!-- maintest와 비교 -->
<!-- Bootstrap core CSS -->
<link href="${root }css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

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

<script>


</script>

<style>
.h4 {
text-align: center;
}
</style>

</head>

<body>

<!-- 상단메뉴 분리 해서넣어줌  -->
<c:import url="/WEB-INF/views/include/header_menu2.jsp"/>

<div class="limiter">

		<div class="container-login100"> <!-- 뒷배경 -->
			<%-- form:form이랑 form 같이 쓰면 안됨 --%>
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54" style="border: solid 1px lightgray;">
				<!--<form class="login100-form validate-form"> -->
				<p class="h4">Don't buy, adopt.<br>
				Welcome to your new family!</p>
				<br><br>
					<span class="login100-form-title p-b-49">
						Login
					</span>
					
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
							class="form-control" />
						<form:errors path="user_password" style="color:red" />
					</div>
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<form:button type="submit" class="login100-form-btn">Login</form:button>
						</div>
					</div>
					
					<br />


					<div class="txt1 text-center p-t-20 p-b-20">

						<input type="checkbox" name="useCookie" tabindex="4"> <i>로그인 유지</i>
						
						<br> 
						<br />
						<a href="${root }member/searchId" class="txt2">Search ID</a> | 
						<a href="${root }member/searchPassword" class="txt2">Search Password</a> | 
						<a href="${root }member/signup" class="txt2">Sign Up</a>
					</div>

				</form:form>



				<div class="flex-col-c p-t-20">
				
					<span class="txt1 p-b-20" style="text-align: center"><p>or</p>
					Sign Up Using</span>

				</div>


				<hr>
				<!-- 카카오 로그인 추가(api 연동 후 경로 설정) -->
					<div id="kakaoLogin" align="center">
						<a id="kakao-login-btn"> 
						<img src="${root}images/kakao_login_large_wide.png" width="100%" />
						</a> <a href="${root }views/kakaologinAPI"></a>
					</div>

					<br>

					<!-- 구글 로그인 추가(api 연동 후 경로 설정) -->
					<div id="googleLogin" align="center">
						<a id="google-login-btn"> <img src="${root}images/btn_google_signin_light_normal_web.png" width="100%" />
						</a> <a href="${root }views/googleloginAPI"></a>
					</div>

			<!-- </form> -->
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

<!-- 하단메뉴 분리 해서넣어줌  -->
<c:import url="/WEB-INF/views/include/footer_menu2.jsp"/>

<!-- 기본 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="${root }js/bootstrap.min.js"></script>
<script src="${root }js/SmoothScroll.js"></script>
<script src="${root }js/theme-scripts.js"></script>

</body>
</html>