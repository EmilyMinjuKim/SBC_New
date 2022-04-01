<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap Simple Data Table</title>
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	


<style>

/* .footer-font {
	font-family: 'Cafe24Dongdong' !important;
}

.header-font {
	font-family: 'Cafe24Dongdong' !important;
} 
 
body > div > div {
	font-family: 'Roboto', sans-serif !important;
} */

footer p a span {
    color: #FF9F46;
    font-size: 10px;
    letter-spacing: 1px;
    font-weight: 700;
}

body {
	color: #566787;
	background: #ffffff;
	font-family: 'Roboto', sans-serif;
}

.table-responsive {
	margin: 30px 0;
}

.table-wrapper {
	min-width: 1000px;
	background: #fff;
	padding: 20px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title {
	padding-bottom: 10px;
	margin: 0 0 10px;
}

.table-title h2 {
	margin: 8px 0 0;
	font-size: 22px;
}

.search-box {
	position: relative;
	float: right;
}

.search-box input {
	height: 34px;
	border-radius: 20px;
	padding-left: 35px;
	border-color: #ddd;
	box-shadow: none;
}

.search-box input:focus {
	border-color: #3FBAE4;
}

.search-box i {
	color: #a0a5b1;
	position: absolute;
	font-size: 19px;
	top: 8px;
	left: 10px;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}

table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table td:last-child {
	width: 130px;
}

table.table td a {
	color: #a0a5b1;
	display: inline-block;
	margin: 0 5px;
}

table.table td a.view {
	color: #03A9F4;
}

table.table td a.edit {
	color: #FFC107;
}

table.table td a.delete {
	color: #E34724;
}

table.table td i {
	font-size: 19px;
}

.pagination {
	float: right;
	margin: 0 0 5px;
}

.pagination li a {
	border: none;
	font-size: 95%;
	width: 30px;
	height: 30px;
	color: #999;
	margin: 0 2px;
	line-height: 30px;
	border-radius: 30px !important;
	text-align: center;
	padding: 0;
}

.pagination li a:hover {
	color: #666;
}

.pagination li.active a {
	background: #03A9F4;
}

.pagination li.active a:hover {
	background: #0397d6;
}

.pagination li.disabled i {
	color: #ccc;
}

.pagination li i {
	font-size: 16px;
	padding-top: 6px
}

.hint-text {
	float: left;
	margin-top: 6px;
	font-size: 95%;
}

.status {
	font-size: 30px;
	margin: 2px 2px 0 0;
	display: inline-block;
	vertical-align: middle;
	line-height: 10px;
}

.text-success {
	color: #10c469;
}

.text-danger {
	color: #ff5b5b;
}

a:link {
	text-decoration: none;
	color: #566787;
}

.justify-content-center {
	-ms-flex-pack: center !important;
	justify-content: center !important;
}
</style>
<script>
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
	});
	
	function enterkey() {
        if (window.event.keyCode == 13) {
        	
        	var searchUser_id = $('#searchUser_id').val()

        	//입력값이 없을시에 요청
			if (searchUser_id.length == 0) {
			alert('아이디를 입력해주세요.')
			return
			} 
        	
        	$.ajax({
        	    url:"${root}member/checkUserIdExist/" + searchUser_id,  //요청할 페이지 주소
        	    type:"get",   
        	    dataType:"text",
        	    success: function(result){
        	    	console.log('성공함')
        	       if(result.trim() =="true"){
        	          alert("존재 하지 않는 데이터 입니다.")
        	       }else{
        	    	   location.href='${root}admin/userlist?searchUser_id=' + searchUser_id
        	       }
        	    }
        	 });
		}
	}
 	
	function updateRole(user_id, authority) {
	
		console.log('움직임?')
		
		console.log('테스트' + user_id + authority);
		
		if (authority == 'ROLE_ADMIN') {
			if (confirm("관리자 권한을 삭제하시겠습니까?")){
				location.href ='${root}admin/updateRole?user_id=' + user_id + '&authority=' + authority
			} else {
				return;
			}	
		} else
			if (confirm("관리자 권한을 부여하시겠습니까?")){
				location.href ='${root}admin/updateRole?user_id=' + user_id + '&authority=' + authority
			} else {
				return;
			}	
	}

	

	function openWin(f,s)
	{
	adWindow=window.open(f,s,'width=500,height=800,status=no,scrollbars=auto');
	}




 
</script>
</head>
<body>
<c:import url='/WEB-INF/views/include/header_menu11.jsp' />

	<div class="container">
		<div class="table-responsive">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-8">
							<h2>
								User <b>Details</b>
							</h2>
						</div>
						<div class="col-sm-8">회원 관리</div>
						<div class="col-sm-4">
							<div class="search-box">
								<i class="material-icons">&#xE8B6;</i> <input id="searchUser_id"
									name="searchUser_id" type="text" onkeyup="enterkey();"
									class="form-control" placeholder="SearchByID&hellip; "><br>
							</div>
						</div>
					</div>
				</div>
				현재 페이지 : ${pageBean.currentPage}/${pageBean.max }<br /> 전체 다시 불러오기 : <a
					href="${root}admin/userlist" class="replace" title="Replace"
					data-toggle="tooltip"><i class="material-icons">cached</i></a>
				<div>
					<table class="table table-striped table-hover table-bordered">
						<thead>
							<tr>
								<th>#</th>
								<th>Id <!-- <a href="javascript:void(0)" onclick="sortById()"><i
										class="fa fa-sort"></i></a> --></th>
								<th>Name</th>
								<th>Role <i class="fa fa-sort"></i></th>
								<th>Last Login Time <i class="fa fa-sort"></i></th>
								<th>Recent Login IP</th>
								<th>Enabled</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${userlist }" var="obj">
								<tr>
									<td>${obj.index }</td>
									<td><a href="${root }board/userBoard?user=${obj.user_id }">${obj.user_id }</a></td>
									<td>${obj.user_name }</td>
									<td>${obj.authority }<%-- <a href="${root}admin/updateRole?user_id=${obj.user_id}&authority=${obj.authority}" class="settings"
										title="Settings" data-toggle="tooltip"><i
											class="material-icons">&#xE8B8;</i></a> --%> <a
										href="javascript:void(0)"
										onclick="updateRole('${obj.user_id}', '${obj.authority}')"
										class="settings" title="Settings" data-toggle="tooltip"><i
											class="material-icons">&#xE8B8;</i></a>

									</td>
									<td>${obj.last_login_time }</td>
									<td>${obj.recentlogin_ip }</td>
									<td><c:if test="${obj.enabled eq '1'}">
											<span class="status text-success">&bull;</span> Active
										</c:if> <c:if test="${obj.enabled eq '0'}">
											<span class="status text-danger">&bull;</span> Inactive
										</c:if></td>
									<td>
									<a href="javascript:openWin('${root }admin/modifyUser?user_id=${obj.user_id }','0')"
										class="edit" title="Edit" data-toggle="tooltip"><i
											class="material-icons">&#xE254;</i></a> 
											
										<c:if test="${obj.enabled eq '1'}">
											<a href="${root}admin/userDelete?user_id=${obj.user_id }"
												class="delete" title="Delete" data-toggle="tooltip"><i
												class="material-icons">&#xE872;</i></a>
										</c:if> 
										
										<c:if test="${obj.enabled eq '0'}">
											<a href="${root}admin/userAbled?user_id=${obj.user_id }"
												class="user_unlock" title="User_unlock"
												data-toggle="tooltip"><i class="material-icons">lock_open</i></a>
										</c:if></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- <div class="clearfix">
						
						<ul class="pagination">
							<li class="page-item disabled"><a href="#"><i
									class="fa fa-angle-double-left"></i></a></li>
							<li class="page-item"><a href="#" class="page-link">1</a></li>
							<li class="page-item"><a href="#" class="page-link">2</a></li>
							<li class="page-item active"><a href="#" class="page-link">3</a></li>
							<li class="page-item"><a href="#" class="page-link">4</a></li>
							<li class="page-item"><a href="#" class="page-link">5</a></li>
							<li class="page-item"><a href="#" class="page-link"><i
									class="fa fa-angle-double-right"></i></a></li>
						</ul>
					</div> -->
					<div class="d-md-block justify-content-center">
						<ul class="pagination mt-4 justify-content-center">
							<!-- 이전 페이지로 이동하려는게 1이하이면 disabled(비활성화) -->
							<c:choose>

								<c:when test="${pageBean.prevPage <= 0 }">
									<li class="page-item disabled"><a
										style="text-decoration: none;" href="#" class="page-link">이전</a>
									</li>
								</c:when>

								<c:otherwise>
									<li class="page-item "><a
										href="${root}admin/userlist?page=${pageBean.prevPage}"
										class="page-link">이전</a></li>
								</c:otherwise>

							</c:choose>

							<c:forEach var="idx" begin="${pageBean.min }"
								end="${pageBean.max }">

								<!-- 페이지 아이콘 표시 -->
								<!-- 현재페이지면 active(부트스트랩) -->
								<c:choose>

									<c:when test="${idx == pageBean.currentPage}">

										<li class="page-item active"><a
											style="background: lightorange"
											href="${root}admin/userlist?page=${idx}" class="page-link">${idx}</a>
										</li>

									</c:when>

									<c:otherwise>

										<li class="page-item"><a style="text-decoration: none;"
											href="${root}admin/userlist?page=${idx}" class="page-link">${idx}</a>
										</li>

									</c:otherwise>

								</c:choose>

							</c:forEach>

							<!-- Max값이 전체페이지보다 크거나 같으면 비활성화 disabled -->
							<c:choose>

								<c:when test="${pageBean.max >= pageBean.pageCnt }">
									<li class="page-item disabled"><a href="#"
										class="page-link" style="text-decoration: none;">다음</a></li>
								</c:when>

								<c:otherwise>
									<li class="page-item"><a
										href="${root}admin/userlist?page=${pageBean.nextPage}"
										style="text-decoration: none;" class="page-link">다음</a></li>
								</c:otherwise>

							</c:choose>

						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer  -->
	<c:import url='/WEB-INF/views/include/footer_menu2.jsp' />
	
</body>
</html>