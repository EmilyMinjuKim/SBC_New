<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>아이디 찾기</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 상단메뉴 분리 해서넣어줌  -->
<%-- <c:import url="/WEB-INF/views/include/header_menu2.jsp"/> --%>

<div class="container" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
					<form action="${root }member/searchId_pro" method="post">
							<div class="form-group">
								<label>등록시 사용한 이메일을 입력하세요</label> <input name="email" id="email"
									class="form-control" />
								<spring:hasBindErrors name="usermembershipBean" >
									<!-- dataBean1에 error를 감지하기 위한 설정(result담겨져 있는 메시지) -->
									<c:if test="${errors.hasFieldErrors('email') }">
				<font color="red">${errors.getFieldError('email').defaultMessage }</font><br>
										<%-- <spring:message code="${errors.getFieldError('email').codes[0] }"></spring:message> --%>
										<br />
									</c:if>
								</spring:hasBindErrors>
							</div>

							<div class="form-group text-right">
							<button type="submit" class="btn btn-primary" style="width: 100%;">아이디 찾기</button><br><br>
							<button type="button" onclick="location.href='${root }member/login'" class="btn btn-secondary" style="width: 100%;">취소(로그인 돌아가기)</button><br>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>

<%-- <!-- 하단메뉴 분리 해서넣어줌  -->
<c:import url="/WEB-INF/views/include/footer_menu2.jsp"/>
 --%>
</body>
</html>








