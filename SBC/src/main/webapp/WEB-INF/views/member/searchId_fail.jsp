<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<script>
   alert('입력하신 이메일과 일치하는 회원정보를 찾을 수 없습니다.')
   location.href = "${root}member/searchId"
</script>