<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <c:url var="root" value="/"/> sessionid 가 주소로 붙어서 url 출력--%>
<!-- 절대 경로 지정해주기.  -->
<c:set var="root" value="${pageContext.request.contextPath }/"/>

<!DOCTYPE html>
<html lang="en">
<head>
   <!-- Bootstrap CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
      
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">

      <!-- Custom styles for this template -->
      <link href="${root }css/style.css" rel="stylesheet">
<style>


</style>

<script>
  
</script>

 </head>
 
<!--  <body id="page-top"> -->

<!-- Navigation -->
      <nav class="navbar navbar-default fixed-top border" style="background: white;">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class=" navbar-header page-scroll" >
            	<a class="navbar-brand page-scroll" href="${root }/main" > 
            	<img id="sbc_logo" src="${root }img/logo_sbc.png" style="width: 150px; position: relative;bottom:160%; margin-left: 30%"></a> 
            	<!-- onerror="this.style.display='none' : 엑박뜨면 로고 안나오게 -->
            </div>
            
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="position: relative; margin: 0px 100px 0px 100px;">
            	<ul class="nav navbar-nav navbar-right ml-auto">
	               	<!-- 기본 메뉴 -->
	                <li class="nav-item"><a class="page-scroll" href="${root }main">메인</a></li>
	                <li class="nav-item"><a class="page-scroll" href="${root }notice/noticemain">공지사항</a></li>
	                <li class="nav-item"><a class="page-scroll" href="${root }board/searchDog">유기동물 조회</a></li>
	      
	                <li class="nav-item dropdown">
		               	<a class="nav-link dropdown-toggle" href="${root }board/boardList" 
		                id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">게시판</a> <!-- 게시판 경로 -->
		                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="${root }board/write">글쓰기</a><p>
							<a class="dropdown-item" href="${root }board/boardList?board_category=all">게시글</a><p>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">CLOSE</a>
						</div>          	
	                </li>
	                  
	                <li class="nav-item">
	                	<a class="page-scroll" href="<c:url value="/product/main" />">쇼핑</a> <!-- 민주언니 쇼핑몰 경로 -->
	                </li>
	                
                	<c:choose> 
                  	<c:when test="${loginUserBean.userLogin == true}">
                    <li class="nav-item dropdown">
                    	<a class="nav-link dropdown-toggle" href="${root }member/mypagetest" 
                    	id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${loginUserBean.user_id} 님</a>
	                  	<div class="dropdown-menu" aria-labelledby="navbarDropdown" style="text-align: center;">
							<a class="dropdown-item" href="${root }board/myAnimal">관심동물</a><p>
							<a class="dropdown-item" href="${root }board/myBoard">관심글</a><p>
							<a class="dropdown-item" href="${root }board/myWrite">내가쓴글</a><p>
							<a class="dropdown-item" href="${root }member/modify">정보수정</a><p>
							<a class="dropdown-item" href="${root }product/productPage">주문정보</a><p>
							
							<c:if test='${loginUserBean.authority == "role_admin"  }'>
							<a class="dropdown-item" href="${root }admin/userlist">회원관리</a><p>
							<a class="dropdown-item" href="${root }siteInfo/siteInfo">사이트 정보</a><p>
							
							</c:if>
		
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">CLOSE</a>
						</div>          	
                     </li>
                     <li class="nav-item">
                        <a class="page-scroll" href="${root }member/logout">로그아웃</a> <!-- Login후에 Logout으로 변경 -->
                     </li>
                  </c:when> 
                  <c:otherwise>
                     <li class="nav-item">
                        <a class="page-scroll" href="${root }member/login">로그인</a> <!-- Login후에 Logout으로 변경 -->
                     </li>   
                  </c:otherwise>
                </c:choose>
            	</ul>
      		</div>
      </nav>

      <!-- Bootstrap core JavaScript
         ================================================== -->
      <!-- Placed at the end of the document so the pages load faster -->
      <script src="${root }js/bootstrap.min.js"></script>
      <script src="${root }js/theme-scripts.js"></script>

<!--  </body> -->