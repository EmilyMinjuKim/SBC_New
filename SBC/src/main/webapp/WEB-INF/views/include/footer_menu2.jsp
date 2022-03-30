<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <c:url var="root" value="/"/> sessionid 가 주소로 붙어서 url 출력--%>
<!-- 절대 경로 지정해주기.  -->
<c:set var="root" value="${pageContext.request.contextPath }/"/>

<footer>
		<div class="container text-center">
			<!-- 나중에 우리팀 깃 주소 넣기 -->
				<p>Designed by <a href="${root }"><span>SBC</span> TEAM PROJECT</a></p>
				<p><span>TEAM SBC : </span>이향원, 이경철, 김민주, 김동현, 김승이, 정유진</p>
		</div>
</footer>