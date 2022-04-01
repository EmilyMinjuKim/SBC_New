<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <c:url var="root" value="/"/> sessionid 가 주소로 붙어서 url 출력--%>
<!-- 절대 경로 지정해주기.  -->
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<style>
footer{
background: #FFB6C1;
}

.fs{
	font-size: 14px;
	color: white;
}

</style>
</head>

<footer>
		<div class="container text-center" style="padding: 10px;">
			<!-- 나중에 우리팀 깃 주소 넣기 -->
				<p class=" fs">Designed by <span style="font-size:18px; color:#D2691E; font-weight: 900;">SBC</span> TEAM PROJECT</p>
				<p class=" fs"><span>TEAM SBC : </span>이향원, 이경철, 김민주, 김동현, 정유진</p>
				<br />
		</div>
</footer>
</html>

