<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Logout</title>

<!-- header -->
<c:import url='/WEB-INF/views/include/header_menu2.jsp'/>

<script>
   alert('로그아웃 되었습니다')
   location.href = '${root}member/maintest'
</script>
	

<!-- footer  -->
<c:import url='/WEB-INF/views/include/footer_menu2.jsp'/>
</body>
</html>









