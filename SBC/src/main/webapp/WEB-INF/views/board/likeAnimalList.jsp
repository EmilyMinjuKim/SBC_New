<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http//www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Item - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />
</head>
<body>


	<!-- Related items section-->
	<section class="py-5 bg-light">
	<div class="container px-4 px-lg-5 mt-5">
		<div style="text-align: center;">
			<h1 class="fw-bolder mb-4">나의 관심글</h1>
		</div>
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<%-- <c:set var="info" value="${l }"/> --%>
			<c:forEach var='dog' items='${list}' varStatus="status">
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="${dog['img'] }" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- animal name-->
								<h5 class="fw-bolder">${dog['12']}</h5>
							</div>
							<div class="imgicon" style="text-align: center;">
							${dog['6']}
								<!-- 성별, 품종 아이콘 -->
								<img src="../img/female.png">${dog['3']} <img src="../img/dog.png">
							</div>
							<div style="text-align: center;">${dog['11']}</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="${root}board/i">보러가기</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>




			<%--                <div class="col mb-5">
		                        <div class="card h-100">
		                            <!-- Product image-->
		                            <img class="card-img-top" src="${info}" alt="..." />
		                            <!-- Product details-->
		                            <div class="card-body p-4">
		                                <div class="text-center">
		                                    <!-- animal name-->
		                                    <h5 class="fw-bolder">핑삼이</h5>  
		                                </div>
		                                <div class="imgicon" style="text-align: center;">
		                                <!-- 성별, 품종 아이콘 -->
		                                <img src="../img/female.png">
		                                <img src="../img/dog.png">
		                                </div>
		                                <div style="text-align: center;">
		                               ${info}
		                                </div>
		                            </div>
		                            <!-- Product actions-->
		                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
		                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="${root}board/i">보러가기</a></div>
		                            </div>
		                        </div>
		                    </div>
	                  --%>











		</div>
	</div>
	</section>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">TEAM SBC</p>
	</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../js/scripts.js"></script>
</body>
</html>
