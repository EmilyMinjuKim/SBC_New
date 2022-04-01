<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http//www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta charset="utf-8">
<title>공지사항</title>
<link href="${root }css/bootstrap4.5.0.css" rel="stylesheet">

<!-- 아이콘 -->	
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css"
	integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA="
	crossorigin="anonymous" />


<style>
@font-face {
    font-family: 'Cafe24Dongdong';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Dongdong.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
*{
	font-family: 'Cafe24Dongdong' !important;
}

.aa3 {
	background: white;
	color: #FDB85E;
	font-size: 18px;
	font-weight: 900;
	border: 3px solid #FDB85E;
}

.aa4 {
	background: white;
	color: #FDB85E;
	font-size: 16px;
	font-weight: 600;
	border: 3px solid #FDB85E;
}

.aa3:hover {
	background: #FDB85E;
	color: white;
	font-size: 19px;
	font-weight: 900;
	border: 3px solid white;
	border-radius: 10%;
}

.justify-content-right {
	-ms-flex-pack: right !important;
	justify-content: right !important
}

.justify-content-center {
	position: relative;
	text-align: center;
	-ms-flex-pack: center!important;
	justify-content: center!important;
}

.li1{
	font-size: 25px; 
	width: 30%; 
	vertical-align: middle;
	color:#FDB85E;
}

.lii1{
	color: #F9BF20;
}

.li2{
	font-size: 25px; 
	vertical-align: middle;
	color:#ff6c99;
}

.lii2{
	color:#ff6c99;
}

</style>

<c:import url='/WEB-INF/views/include/header_menu4.jsp' />

</head>
<body>


	<div class="container mt-5">
		<div class="col-lg-12">
			<div class="row">
				<div class="col-sm-12">
					<div class="user-dashboard-info-box table-responsive pb-1 bg-white pb-3">
						<div class="text-center">
							<a href="${root }notice/noticemain"> 
							<img class="pb-3" src="${root }img/notice.png" style="height: 35%; width: 35%;" /></a>
						</div>
						<!-- search 부분 -->
						<nav
							class="navbar navbar-expand-md navbar-dark bg-white justify-content-right">

						<form class="form-inline my-2 my-lg-0">
						
								<!-- <input class="form-control mr-3 aa4" type="text"
									placeholder="Search" aria-label="Search">
								<a class="btn btn-primary aa3 mr-3" href="#">Search</a> -->
<!-- 							<hr style="background-color:#FDB85E;position:relative; top:31px; height: 5px; border-radius: 5px;" /> -->

			<!-- 글 추가 버튼 -->
							<c:if test="${loginUserBean.authority == 'ROLE_ADMIN'}">
							<a class="pr-4 mr-2" href="${root }notice/write">
							<input class="btn btn-primary aa3"  type="button" value="글 추가" /></a>
							</c:if>
					</form>
					</div>
					</nav>
					<table class="table manage-candidates-top">
							<thead>
								<tr>
									<th class="text-center" style="font-size:20px;">글 번호</th>
									<th class="text-center" style="font-size:20px;">제목</th>
									<th class="text-center" style="font-size:20px;">관리자</th>
									<th class="text-center" style="font-size:20px;">작성날짜</th>
									
								<c:if test="${loginUserBean.authority == 'ROLE_ADMIN'}">
									<th class="action text-center" style="font-size:18px;">수정&nbsp; / &nbsp;삭제</th>
								</c:if>
								
								</tr>
							</thead>
							<c:forEach var="obj" items="${NoticeList }">
								<tbody>
									<tr class="candidates-list">

										<td class="candidate-list-favourite-time text-center" style="font-size:17px; font-weight: 400; vertical-align: middle"><a>
												${obj.notice_idx }</a></td>

										<td class="candidate-list-favourite-time text-center" style="font-size:17px; font-weight: 600; vertical-align: middle;"><a style=" color:#FDB85E;"
											href="${root }notice/read?notice_idx=${obj.notice_idx}&page=${page}">
												${obj.notice_subject }</a></td>
												
										<td class="candidate-list-favourite-time text-center" style="font-size:17px; font-weight: 400; vertical-align: middle"><a>
												${obj.notice_writer }</a></td>

										<td class="candidate-list-favourite-time text-center" style="font-size:17px; font-weight: 400; vertical-align: middle"><a>
												${obj.notice_date }</a></td>
											
											
										<c:if test="${loginUserBean.authority == 'ROLE_ADMIN'}">
											<td>
												<ul class="list-unstyled d-flex  justify-content-center">
													<li class="li1 mr-2" >
													<a href="${root }notice/update?notice_idx=${obj.notice_idx}&page=${page}">
													<img style="width: 80%; height: 90%;" src="${root }img/notice/update_notice.png"/></a>
													<li class="li2">
													<a href="${root }notice/delete?notice_idx=${obj.notice_idx}&page=${page}">
													<img class="" style="width: 80%; height: 90%;" src="${root }img/notice/delete_notice.png"/></a>
													
												</ul>
											</td>
										</c:if>
									</tr>
								</tbody>
							</c:forEach>
						</table>
						
				<!-- 페이징 -->
						<div class="d-md-block justify-content-center mb-5">
				<ul class="pagination mt-4 justify-content-center">
		<!-- 이전 페이지로 이동하려는게 1이하이면 disabled(비활성화) -->
					<c:choose>
					
					<c:when test="${pageBean.prevPage <= 0 }">
					<li class="page-item disabled">
						<a style="text-decoration: none;" href="#" class="page-link">이전</a>
					</li>
					</c:when>
					
					<c:otherwise>
					
					<li class="page-item aa2">
						<a style="text-decoration: none;" href="${root }notice/noticemain?notice_idx=${noticeBean.notice_idx}&page=${pageBean.prevPage}" class="page-link">이전</a>
					</li>
					</c:otherwise>
					
					</c:choose>
					
					<c:forEach var="idx" begin="${pageBean.min }" end="${pageBean.max }">
					
		<!-- 페이지 아이콘 표시 -->
		<!-- 현재페이지면 active(부트스트랩) -->
					<c:choose>
					
					<c:when test="${idx == pageBean.currentPage}">
					
					<li class="page-item active">
						<a style="background: lightorange; text-decoration: none;" href="${root }notice/noticemain?notice_idx=${noticeBean.notice_idx}&page=${idx}" class="page-link">${idx}</a>
					</li>
					
					</c:when>
					
					<c:otherwise>
					
					<li class="page-item">
						<a style="text-decoration: none;" href="${root }notice/noticemain?notice_idx=${noticeBean.notice_idx}&page=${idx}" class="page-link">${idx}</a>
					</li>
					
					</c:otherwise>
					
					</c:choose>
					
					</c:forEach>
					
		<!-- Max값이 전체페이지보다 크거나 같으면 비활성화 disabled -->
					<c:choose>
					
					<c:when test="${pageBean.max >= pageBean.pageCnt }">
					<li class="page-item disabled">
						<a href="#" class="page-link" style="text-decoration: none;">다음</a>
					</li>
					</c:when>
					
					<c:otherwise>
					<li class="page-item">
						<a style="text-decoration: none;" href="${root }notice/noticemain?notice_idx=${noticeBean.notice_idx}&page=${pageBean.nextPage}" class="page-link">다음</a>
					</li>
					</c:otherwise>
					
					</c:choose>
					
				</ul>
			</div>
					</div>
				</div>
			</div>
		</div>
	


</body>
</html>