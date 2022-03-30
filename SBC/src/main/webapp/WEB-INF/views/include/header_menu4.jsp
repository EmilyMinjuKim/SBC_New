<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <c:url var="root" value="/"/> sessionid 가 주소로 붙어서 url 출력--%>
<!-- 절대 경로 지정해주기.  -->
<c:set var="root" value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>
<html lang="en">
<head>

<style>
div, ul, li {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 0;
	margin: 0
}

a {
	text-decoration: none;
}

.quickmenu {
	position: absolute;
	width: 90px;
	top: 50%;
	margin-top: -50px;
	right: 10px;
	background: #fff;
}

.quickmenu ul {
	position: relative;
	float: left;
	width: 100%;
	display: inline-block;
	*display: inline;
	border: 1px solid #ddd;
}

.quickmenu ul li {
	float: left;
	width: 100%;
	border-bottom: 1px solid #ddd;
	text-align: center;
	display: inline-block;
	*display: inline;
}

.quickmenu ul li a {
	position: relative;
	float: left;
	width: 100%;
	height: 30px;
	line-height: 30px;
	text-align: center;
	color: #999;
	font-size: 9.5pt;
}

.quickmenu ul li a:hover {
	color: #000;
}

.quickmenu ul li:last-child {
	border-bottom: 0;
}

.content {
	position: relative;
	min-height: 1000px;
}
</style>

<script>
	$(document).ready(function() {
		var currentPosition = parseInt($(".quickmenu").css("top"));
		$(window).scroll(function() {
			var position = $(window).scrollTop();
			$(".quickmenu").stop().animate({
				"top" : position + currentPosition + "px"
			}, 1000);
		});
	});
</script>

</head>

<!--  <body id="page-top"> -->

<!-- Navigation -->






<div class="quickmenu">
	<ul>
		<li><a href="${root }">홈으로가기</a></li>
		<li><a href="${root }board/searchDog">유기동물조회</a></li>
		<li><a href="${root }board/write">글쓰기</a>
		<li><a href="${root }board/boardList?board_category=all">게시글</a></li>
		<li><a href="${root }board/myAnimal">관심동물</a></li>
		<li><a href="${root }board/myBoard">관심글</a></li>
		<li><a href="${root }board/myWrite">내가 쓴 글</a></li>
	</ul>
</div>



<%-- <nav class="navbar navbar-default fixed-top white border">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header page-scroll">
			<a class="navbar-brand page-scroll" href="${root }"><img
				src="${root }img/logo_sbc.jpg"></a>
			<!-- onerror="this.style.display='none' : 엑박뜨면 로고 안나오게 -->
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse rw"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right ml-auto">
				<!-- 기본 메뉴 -->
				<li class="nav-item"><a class="page-scroll" href="${root }main">메인</a></li>
				<li class="nav-item"><a class="page-scroll"
					href="${root }notice/noticemain">공지사항</a></li>
				<li class="nav-item"><a class="page-scroll"
					href="${root }board/searchDog">유기동물 조회</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="${root }board/boardList"
					id="navbarDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false">게시판</a> <!-- 게시판 경로 -->
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="${root }board/write">글쓰기</a>
						<p>
							<a class="dropdown-item"
								href="${root }board/boardList?board_category=all">게시글</a>
						<p>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">CLOSE</a>
					</div></li>

				<li class="nav-item"><a class="page-scroll"
					href="<c:url value="/product/main" />">쇼핑</a> <!-- 민주언니 쇼핑몰 경로 -->
				</li>

				<c:choose>
					<c:when test="${loginUserBean.userLogin == true}">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="${root }member/mypagetest"
							id="navbarDropdown" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">${loginUserBean.user_id}
								님의 마이페이지</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown"
								style="text-align: center;">
								<a class="dropdown-item" href="${root }board/likeAnimalList">관심동물</a>
								<p>
									<a class="dropdown-item" href="${root }board/myBoard">관심글</a>
								<p>
									<a class="dropdown-item" href="${root }board/myWrite">내가쓴글</a>
								<p>
									<a class="dropdown-item" href="${root }member/modify">정보수정</a>
								<p>
									<a class="dropdown-item" href="${root }product/productPage">주문정보</a>
								<p>

									<c:if test='${loginUserBean.authority == "ROLE_ADMIN"  }'>
										<a class="dropdown-item" href="${root }admin/userlist">회원관리</a>
										<p>
											<a class="dropdown-item" href="${root }siteInfo/siteInfo">사이트
												정보</a>
										<p>
									</c:if>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">CLOSE</a>
							</div></li>
						<li class="nav-item"><a class="page-scroll"
							href="${root }member/logout">로그아웃</a> <!-- Login후에 Logout으로 변경 -->
						</li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="page-scroll"
							href="${root }member/login">로그인</a> <!-- Login후에 Logout으로 변경 -->
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>
 --%>


<!--  </body> -->