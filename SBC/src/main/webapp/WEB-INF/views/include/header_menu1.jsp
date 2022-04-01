<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <c:url var="root" value="/"/> sessionid 가 주소로 붙어서 url 출력--%>
<!-- 절대 경로 지정해주기.  -->
<c:set var="root" value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>

<html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<head>

<script type="text/javascript">

$(document).ready(function() {
	
	console.log('쿠키 확인 동작함?')

	let user_id = "${loginUserBean.user_id}"
	console.log(user_id)
	
	let isChk1 = "${loginUserBean.cookieChk1}"
	console.log(isChk1)
	
		if (isChk1 == "true") {
			console.log('체크했습니다.')
			
			if(user_id !== null || user_id !== undefind || user_id !== '' ) {
				// 쿠키 생성
				console.log('쿠키를 생성합니다')
			
				$.cookie("user_id", user_id, {expires:7, path:"/"});
			}
			
		} else {
			console.log('체크 확인 실패.')
		}
	
});

</script>

<style>
.header-font {
	font-size: 20px;

}

.dropdown-menu {
	text-align: center;
}

#logo {
	width: 150px;
	height: 100px;
}

.navbar {
	border: 0px solid transparent;
	margin: 0px;
	padding-bottom: 30px;
}

.navbar-default {
	padding: 0;
	background-color: #fff;
	border-color: #e7e7e7;
}

.nav>li>a{
	color:black;
	background: #00ff0000;
}

.nav>li>a:focus {
	background: #00ff0000;
	border-radius: 20px;
	vertical-align: middle;
}
/* 
.navbar-default {
	text-transform: uppercase;
	font-size: 13px;
	font-weight: 400;
	letter-spacing: 2px;
	color: #000;
	border-bottom: 1px solid;
	border-color: #000;
	margin: 10px 15px;
	padding: 0 0 2px 0;

} */

.bb{
	color: black;
}
</style>

</head>
<header style="background: white;">
<nav class="navbar fixed-top white header-font">
	<div class="container">
		<div class="collapse navbar-collapse rw"
			id="bs-example-navbar-collapse-1">
			<a class="navbar-brand page-scroll" href="${root }/main"><img
				src="${root }img/logo_sbc.png" id="logo"></a>
		</div>


		<div class="collapse navbar-collapse rw"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right ml-auto">
				<!-- 기본 메뉴 -->
				<li class="nav-item"><a class="page-scroll" href="${root }main">메&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인</a></li>
				<li class="nav-item"><a class="page-scroll"
					href="${root }notice/noticemain">공지사항</a></li>
				<li class="nav-item"><a class="page-scroll"
					href="${root }board/searchDog">유기동물 조회</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="${root }board/boardList"
					id="navbarDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false">게&nbsp;시&nbsp;판</a> <!-- 게시판 경로 -->
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<p>
						<a class="dropdown-item" href="${root }board/write">글쓰기</a>
						<p>
							<a class="dropdown-item"
								href="${root }board/boardList?board_category=all">게시글</a>
						<p>
					</div></li>

				<li class="nav-item"><a class="page-scroll"
					href="<c:url value="/product/main" />">쇼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;핑</a>
					<!-- 민주언니 쇼핑몰 경로 --></li>

				<c:choose>
					<c:when test="${loginUserBean.userLogin == true}">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="${root }member/mypagetest"
							id="navbarDropdown" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">${loginUserBean.user_id}
								님</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown"
								style="text-align: center;">
								<p>
								<a class="dropdown-item" href="${root }board/myAnimal">관심동물</a>
								<p>
									<a class="dropdown-item" href="${root }board/myBoard">관심글</a>
								<p>
									<a class="dropdown-item" href="${root }board/myWrite">내가쓴글</a>
								<p>
									<a class="dropdown-item" href="${root }member/modify">정보수정</a>
								<p>
									<a class="dropdown-item" href="${root }order/findMyOrder">주문정보</a>
								<p>

									<c:if test='${loginUserBean.authority == "ROLE_ADMIN"  }'>
										<a class="dropdown-item" href="${root }admin/userlist">회원관리</a>
										<p>
											<a class="dropdown-item" href="${root }siteInfo/siteInfo">사이트
												정보</a>
										<p>
									</c:if>
							</div></li>
						<li class="nav-item"><a class="page-scroll"
							href="${root }member/logout">로그아웃</a> <!-- Login후에 Logout으로 변경 -->
						</li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="page-scroll"
							href="${root }member/login">로&nbsp;그&nbsp;인</a> <!-- Login후에 Logout으로 변경 -->
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>
</header>

