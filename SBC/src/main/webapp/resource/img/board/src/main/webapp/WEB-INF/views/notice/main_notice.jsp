<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http//www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta charset="utf-8">
<!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
<!--  All snippets are MIT license http://bootdey.com/license -->
<title>light user list - Bootdey.com</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" nonce="b53b0a014ba94d4a9d21a20025b"
	src="//local.adguard.org?ts=1647676406029&amp;type=content-script&amp;dmn=www.bootdey.com&amp;pth=%2Fsnippets%2Fexecute_download%2Ft3&amp;app=msedge.exe&amp;css=3&amp;js=1&amp;rel=1&amp;rji=1&amp;sbe=1&amp;stealth=1&amp;uag="></script>
<script type="text/javascript" nonce="b53b0a014ba94d4a9d21a20025b"
	src="//local.adguard.org?ts=1647676406029&amp;name=AdGuard%20Extra&amp;name=AdGuard%20Popup%20Blocker&amp;type=user-script"></script>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css"
	integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA="
	crossorigin="anonymous" />

</head>
<body>
	<div class="container mt-5">
		<div class="col-lg-12">
			<div class="row">
				<div class="col-sm-12">
					<div class="user-dashboard-info-box table-responsive mb-0 bg-white p-4 shadow-sm">
						<div class="text-right mr-5 pr-5">
							<img class="pb-5" src="${root }image/notice.png" style="position: relative; right: 12%;" /> 
							<a class="mr-1" href="${root }notice/write"><input class="btn btn-primary" type="button" value="글추가" /></a>
						</div>
						<table class="table manage-candidates-top mb-0">
							<thead>
								<tr>
									<th class="text-center" style="font-size:25px;">글 번호</th>
									<th class="text-center" style="font-size:25px;">제목</th>
									<th class="text-center" style="font-size:25px;">작성자</th>
									<th class="text-center" style="font-size:25px;">작성날짜</th>
									<th class="action text-center" style="font-size:25px;">수정&nbsp; / &nbsp;삭제</th>

								</tr>
							</thead>
							<c:forEach var="obj" items="${NoticeList }">
								<tbody>
									<tr class="candidates-list">

										<td class="candidate-list-favourite-time text-center" style="font-weight: 600; vertical-align: middle"><a>
												${obj.notice_idx }</a></td>

										<td class="candidate-list-favourite-time text-center" style="font-weight: 600; vertical-align: middle"><a
											href="${root }notice/read?notice_idx=${obj.notice_idx}&page=${page}">
												${obj.notice_subject }</a></td>
												
										<td class="candidate-list-favourite-time text-center" style="font-weight: 600; vertical-align: middle"><a>
												${obj.notice_writer }</a></td>

										<td class="candidate-list-favourite-time text-center" style="font-weight: 600; vertical-align: middle"><a>
												${obj.notice_date }</a></td>
											
										<td>
											<ul class="list-unstyled mb-1 d-flex justify-content-center">

												<li style="font-size: 22px; width: 30%; vertical-align: middle;"><a
													href="${root }notice/update?notice_idx=${obj.notice_idx}&page=${page}"
													class="text-info" data-toggle="tooltip" title=""
													data-original-title="Edit"><i class="fas fa-pencil-alt"></i></a></li>
												<li style="font-size: 22px; vertical-align: middle;"><a
													href="${root }notice/delete?notice_idx=${obj.notice_idx}&page=${page}"
													class="text-danger" data-toggle="tooltip" title=""
													data-original-title="Delete"><i
														class="far fa-trash-alt"></i></a></li>
											</ul>
										</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
						
						<div class="d-none d-md-block">
				<ul class="pagination justify-content-center" style="">
		<!-- 이전 페이지로 이동하려는게 1이하이면 disabled(비활성화) -->
					<c:choose>
					
					<c:when test="${pageBean.prevPage <= 0 }">
					<li class="page-item disabled">
						<a href="#" class="page-link">이전</a>
					</li>
					</c:when>
					
					<c:otherwise>
					
					<li class="page-item">
						<a href="${root }notice/noticemain?notice_idx=${noticeBean.notice_idx}&page=${pageBean.prevPage}" class="page-link">이전</a>
					</li>
					</c:otherwise>
					
					</c:choose>
					
					<c:forEach var="idx" begin="${pageBean.min }" end="${pageBean.max }">
					
		<!-- 페이지 아이콘 표시 -->
		<!-- 현재페이지면 active(부트스트랩) -->
					<c:choose>
					
					<c:when test="${idx == pageBean.currentPage}">
					
					<li class="page-item active">
						<a  style="background: lightorange" href="${root }notice/noticemain?notice_idx=${noticeBean.notice_idx}&page=${idx}" class="page-link">${idx}</a>
					</li>
					
					</c:when>
					
					<c:otherwise>
					
					<li class="page-item">
						<a href="${root }notice/noticemain?notice_idx=${noticeBean.notice_idx}&page=${idx}" class="page-link">${idx}</a>
					</li>
					
					</c:otherwise>
					
					</c:choose>
					
					</c:forEach>
					
		<!-- Max값이 전체페이지보다 크거나 같으면 비활성화 disabled -->
					<c:choose>
					
					<c:when test="${pageBean.max >= pageBean.pageCnt }">
					<li class="page-item disabled">
						<a href="#" class="page-link">다음</a>
					</li>
					</c:when>
					
					<c:otherwise>
					<li class="page-item">
						<a href="${root }notice/noticemain?notice_idx=${noticeBean.notice_idx}&page=${pageBean.nextPage}" class="page-link">다음</a>
					</li>
					</c:otherwise>
					
					</c:choose>
					
				</ul>
			</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<script type="text/javascript">
		
	</script>
</body>
</html>