<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http//www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="icon" href="favicon.ico">
		<title>SBC - ${readContent.board_category }</title>
		<!-- Bootstrap core CSS -->
		<link href="../css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
		<!-- Custom styles for this template -->
		<link href="../css/style.css" rel="stylesheet">
		
		<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
		
		<!-- 지도 api -->
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=67350dbec2efe1663af9ea26ecc6ec71&libraries=services" type="text/javascript"></script>
		
		<style>
		/* 지도 api */
	    .map_wrap {position:relative;width:350px;height:350px;}
	    .title {font-weight:bold;display:block;}
	    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
	    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
	    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
		</style>
		
		
		
		
		
	</head>
	<body id="page-top">
		<section id="about" class="mz-module">
		
				<div class="container light-bg">
					<div class="row">
						<div class="col-lg-12 text-center">
							<div class="section-title">
								<h2>${readContent.board_category}</h2>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 text-center">
							<div class="form-group">
								<input type="text" class="form-control" placeholder='${readContent.address1}&nbsp;&nbsp;${readContent.address2}' style="position: relative;" readonly />
								<input type="hidden" class="form-control" value="${readContent.address1}" name="address1" id="searchAddr" />
							</div>
							<div class="form-group">
								<div id="map" style="width: 550px; height: 350px; margin-top: 10px; position: relative; overflow: hidden;"></div>
							</div>
						</div>
						<div class="col-md-6 text-center">
							<div class="form-group">
								<h3><label for="">${readContent.breed}</label></h3>
							</div>
							<div class="form-group">
								<img class="img-fluid"  src="${root }upload/${readContent.dog_img}" width="100%"/>						
							</div>
						</div>
					</div>
					
					
					
					<div class="row row-0-gutter">
						<!-- about module -->
						
							<!-- end about module -->
						<div class="col-md-6 col-0-gutter ">
							<div class="col-md-12">
								<h3>실 종 일 : <label for="">${readContent.happen_date }</label></h3>
								<h3>실종장소 : <label for="">${readContent.address1}&nbsp;&nbsp;${readContent.address2}</label></h3>
						 		<h3>아 이 디 : <label for="">${readContent.user_id}</label></h3>
								<h3>연 락 처 : <label for="">${readContent.writer_phone}</label></h3>
								<h3>상세정보 : <label for="">${readContent.dog_content}</label></h3>
							</div>
						</div>
						
						
						
						<div class="col-md-6 col-0-gutter ">
							<div class="col-md-12">
								<h3>성 별 : <label for="">${readContent.sex }</label></h3>
								
								<c:choose>
									<c:when test="${readContent.age eq '나이 모름'}">
										<h3>나 이 : <label for="">${readContent.age }</label></h3>
									</c:when>
									<c:otherwise>
										<h3>나 이 : <label for="">${readContent.age } 살</label></h3>
									</c:otherwise>
								</c:choose>
								
								<c:choose>
									<c:when test="${readContent.age eq '몸무게 모름'}">
										<h3>몸무게 : <label for="">${readContent.weight}</label></h3>
									</c:when>
									<c:otherwise>
										<h3>몸무게 : <label for="">${readContent.weight} kg</label></h3>
									</c:otherwise>
								</c:choose>
								
								<h3>중성화 : <label for="">${readContent.neutering}</label></h3>
								<h3>털 색 : <label for="">${readContent.color}</label></h3>
								<h3>특 징 : <label for="">${readContent.charcteristic}</label></h3> 
								
								<c:choose>
									<c:when test="${null eq readContent.chip_num}">
										<h3>칩셋유무 : <label for="">X</label></h3>
									</c:when>
									<c:otherwise>
										<h3>칩셋유무 : <label for="">O</label></h3>
										<h3>이 름 : <label for="">${readContent.dog_name}</label></h3>
									</c:otherwise>
								</c:choose>
								
							</div>
						</div>
					</div>
					
					
					<div class="form-group">
						<div class="text-center">
							<c:if test="${loginUserBean.user_idx == readContentBean.content_writer_idx}">
								<a href="${root }board/modify?b_no=${b_no}&page=${page}" class="btn btn-info">수정하기</a>
								<a href="${root }board/delete?b_no=${b_no}&page=${page}&chip=${readContent.chip_num}" class="btn btn-danger deleteBtn">삭제하기</a>
							</c:if>
						</div>
					</div>
				</div>
			
			<!-- /.container -->
		</section>
	</body>

<script>
let msg=${msg}
if(msg=="success"){
	alert('성공적으로 삭제 되었습니다.');
}
if(msg=="fail"){
	alert('삭제 실패 되었습니다.')
} 

</script>		
	


<script>
$(document).ready(function(){
	$('.deleteBtn').on("click",function(){
		if(!confirm("정말 삭제 하시겠습니까?")){
			return;
		}
	});
})









var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 5 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
var address1 = document.getElementById("searchAddr").value;

geocoder.addressSearch(address1, function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">여기에요!!</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});    


</script>

		<!-- Bootstrap core JavaScript
			================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/SmoothScroll.js"></script>
		<script src="../js/theme-scripts.js"></script>

	</body>
</html>