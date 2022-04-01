<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<script>
   alert('가입을 환영합니다. 입력하신 이메일로 인증을 완료하신후 정상적으로 사이트 이용이 가능합니다.')
   location.href = "${root}member/login"
</script>