<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<script>
   alert('인증이 성공되었습니다. 로그인 후 사이트 이용이 가능합니다.')
   location.href = "${root}member/login"
</script>