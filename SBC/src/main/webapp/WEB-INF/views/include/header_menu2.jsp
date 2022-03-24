<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <c:url var="root" value="/"/> sessionid 가 주소로 붙어서 url 출력--%>
<!-- 절대 경로 지정해주기.  -->
<c:set var="root" value="${pageContext.request.contextPath }/"/>

<!DOCTYPE html>
<html lang="en">
   <head>
   <!-- Bootstrap CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
      
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      
      <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
      <meta name="description" content="">
      <meta name="author" content="">
      <link rel="icon" href="favicon.ico">
      
      <!-- Bootstrap core CSS -->
      <link href="${root }css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
      <!-- Custom styles for this template -->
      <link href="${root }css/style.css" rel="stylesheet">
<style>
.rw{
   margin-top: 2%;
}
.rh {
   margin-top: 2%;
}
</style>
 </head>
 
<!--  <body id="page-top"> -->

<!-- Navigation -->
      <nav class="navbar navbar-default fixed-top white border">
         <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
               <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
               <span class="sr-only">Toggle navigation</span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               </button>
            <a class="navbar-brand page-scroll" href="${root }#page-top">
               <img src="../images/logo_sbc.JPG"></a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse rw" id="bs-example-navbar-collapse-1">
               <ul class="nav navbar-nav navbar-right ml-auto">
               <li class="hidden">
                     <a href="#page-top"></a>
                  </li>
               <!-- 기본 메뉴 -->
                  <li class="nav-item">
                     <a class="page-scroll" href="${root }member/maintest">Home</a> <!-- Main경로 -->
                  </li>
                  <li class="nav-item">
                     <a class="page-scroll" href="${root }member/notice">Notice</a> <!-- 동현님이 만드실 공지사항 경로 -->
                  </li>
                  <li class="nav-item">
                     <a class="page-scroll" href="${root }member/adogs">Abandoned dogs</a> <!-- 향원언니 유기견 조회 경로 -->
                  </li>
                  <li class="nav-item">
                     <a class="page-scroll" href="${root }member/lpdogs">Lost&Protect</a> <!-- 향원언니랑 동현님 실종&보호 경로 -->
                  </li>
                  <li class="nav-item">
                     <a class="page-scroll" href="${root }member/shoppingmall">Shopping</a> <!-- 민주언니 쇼핑몰 경로 -->
                  </li>
               </ul> 
   
               <!-- <div class="collapse navbar-collapse rh" id="bs-example-navbar-collapse-1"> -->
              	<ul class="nav navbar-nav navbar-right ml-auto">
               <!-- <li class="hidden">
                     <a href="#page-top"></a>
                  </li> -->
               <c:choose> 
                  <c:when test="${loginUserBean.userLogin == true}">
                     <li class="nav-item">
                        <a class="page-scroll" href="${root }resource/mypagetest.jsp">Mypage</a> <!-- 내 정보 볼 수 있는 Mypage -->
                     </li>
                     <li class="nav-item">
                        <a class="page-scroll" href="${root }member/logout">Logout</a> <!-- Login후에 Logout으로 변경 -->
                     </li>
                  </c:when> 
                  <c:otherwise>
                     <li class="nav-item">
                        <a class="page-scroll" href="${root }member/login">Login</a> <!-- Login후에 Logout으로 변경 -->
                     </li>   
                  </c:otherwise>
               </c:choose>
                  </ul>
            </div>
             </div> 
            <!-- /.navbar-collapse --> 
         <!-- </div>  -->
         <!-- /.container-fluid -->
      </nav>

      <!-- Bootstrap core JavaScript
         ================================================== -->
      <!-- Placed at the end of the document so the pages load faster -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
      <script src="${root }js/bootstrap.min.js"></script>
      <script src="${root }js/SmoothScroll.js"></script>
      <script src="${root }js/theme-scripts.js"></script>

<!--  </body> -->