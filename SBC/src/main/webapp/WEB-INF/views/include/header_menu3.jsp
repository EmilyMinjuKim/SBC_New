<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <c:url var="root" value="/"/> sessionid 가 주소로 붙어서 url 출력--%>
<!-- 절대 경로 지정해주기.  -->
<c:set var="root" value="${pageContext.request.contextPath }/"/>

<!DOCTYPE html>
<html>
<head>
<style>

#logo{
	width: 100px;
	height: 50px;
}
</style>
</head>

        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="${root }"><img src="${root }img/logo_sbc.png" id="logo"></a>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="${root }product/main">상품목록</a></li>
                                <li><a class="dropdown-item" href="${root }order/findMyOrder">주문조회</a></li>
                            </ul>
                        </li>
                        
                        
                        <c:choose> 
		                	<c:when test="${loginUserBean.userLogin == true}">
			                    <li class="nav-item"><a class="nav-link active" href="${root }member/mypagetest">${loginUserBean.user_id} 님 반갑습니다.</a></li>
			                    <li class="nav-item"><a class="nav-link active" href="${root }member/logout">LOGOUT</a></li>
		                    </c:when> 
		               		<c:otherwise>
			                    <li class="nav-item"><a class="nav-link active" href="${root }member/login">LOGIN</a></li>   
		                	</c:otherwise>
		                </c:choose>
                    </ul>
                </div>
            </div>
        </nav>
        
</html>