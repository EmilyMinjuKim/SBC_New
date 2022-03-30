<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http//www.w3.org/TR/html4/loose.dtd">

<html>

<head>


<meta charset="UTF-8">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link href='https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
<link href='' rel='stylesheet'>

<c:import url='/WEB-INF/views/include/header_menu4.jsp' />

<style>
#multiple-container {
display grid;
grid-template-columns 1fr 1fr 1fr;
}

.image {
display block;
width 100%;
}


.register {
    background: -webkit-linear-gradient(left, #fff066, orange);
    margin-top: 3%;
    padding: 3%;
}

.register-left {
    text-align: center;
    color: #fff;
    margin-top: 4%;
}

.register-left input {
    border: none;
    border-radius: 1.5rem;
    padding: 2%;
    width: 60%;
    background: #f8f9fa;
    font-weight: bold;
    color: #383d41;
    margin-top: 30%;
    margin-bottom: 3%;
    cursor: pointer;
}

.register-right {
    background: #f8f9fa;
    border-top-left-radius: 10% 50%;
    border-bottom-left-radius: 10% 50%;
}

.register-left img {
    margin-top: 15%;
    margin-bottom: 5%;
    width: 60%;
    -webkit-animation: mover 2s infinite alternate;
    animation: mover 1s infinite alternate;
}

@-webkit-keyframes mover {
    0% {
        transform: translateY(0);
    }

    100% {
        transform: translateY(-20px);
    }
}

@keyframes mover {
    0% {
        transform: translateY(0);
    }

    100% {
        transform: translateY(-20px);
    }
}

.register-left p {
    font-weight: lighter;
    padding: 12%;
    margin-top: -9%;
}

.register .register-form {
    padding: 10%;
    margin-top: 10%;
}

.btnRegister {
    float: right;
    margin-top: 10%;
    border: none;
    border-radius: 1.5rem;
    padding: 2%;
    background: #0062cc;
    color: #fff;
    font-weight: 600;
    width: 50%;
    cursor: pointer;
}

.register .nav-tabs {
    margin-top: 3%;
    border: none;
    background: #ffc655;
    border-radius: 1.5rem;
    width: 28%;
    float: right;
}

.register .nav-tabs .nav-link {
    padding: 2%;
    height: 36px;
    font-weight: 600;
    color: #fff;
    border-top-right-radius: 1.5rem;
    border-top-left-radius: 1.5rem;
    border-bottom-right-radius: 1.5rem;
    border-bottom-left-radius: 1.5rem;
    
}

.register .nav-tabs .nav-link:hover {
    border: none;
}

.register .nav-tabs .nav-link.active {
    width: 100%;
    height: 39px;
    color: #e6b400;
    border: 2px solid #e6b400;
    border-top-right-radius: 1.5rem;
    border-top-left-radius: 1.5rem;
    border-bottom-right-radius: 1.5rem;
    border-bottom-left-radius: 1.5rem;
}

.register-heading {
    text-align: center;
    margin-top: 8%;
    margin-bottom: -15%;
    color: #495057;
}

.age_weight{
display:flex;
flex-wrap:wrap;
margin-right:0px;
margin-left:0;

}

.image-label {
position: relative;
bottom: 22px;
left: 5px;
color: white;
text-shadow: 2px 2px 2px black;
}



/* 지도 api */
    .map_wrap {position:relative;width:350px;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}


/* 이미지 추가 삭제 */
.thumb {
 margin: 0.2em -0.7em 0 0;
 width: 600px;
 height: 500px;
 object-fit: contain;

}
.remove_img_preview {
    position:relative;
    top:-25px;
    right:5px;
    background:black;
    color:white;
    border-radius:50px;
    font-size:0.9em;
    padding: 0 0.3em 0;
    text-align:center;
    cursor:pointer;
}
</style>
<style>






/* 동현 추가 css */
.cir{
   border: 2px solid #ffc655;
   width: 300px;
   height: 150px;
   -o-object-fit: cover;
   object-fit: cover;
   border-radius: 50%;
   vertical-align: middle;
   display: inline-block;
   }
   
.mm{
   
   margin-right:24px;
}
   
.mn{
   margin-left:3px;
   margin-right:17px;
}

.cc{
   margin-left: 80px;
}

.cv{
   width: 50%;
   margin-top: 40px;
   margin-left: 330px;
}

.cvv{
   margin-top: 10px;
   background: white;
   border: 3px solid #ffc655;
   border-radius: 6%;
   width: 28.5%;
   color:#ffc655;
   font-weight: 600;
}

.aa{
    font-weight: 600;
    color: #ffc655;
    border: 3px solid #ffc655;
    background: white;
    border-top-right-radius: 1.5rem;
    border-bottom-right-radius: 1.5rem;
    border-top-left-radius: 1.5rem;
    border-bottom-left-radius: 1.5rem;
}

.aa:hover{
   background: #ffc655;
   border: 2px solid #ffc655;
}

.aa1{
   width: 100%;
   border: 3px solid #ffc655;
   border: 3px solid #ffc655;
   color: #ffc655;
   font-weight: 600;
   font-size: 18px;
   /* border-top-right-radius: 1.5rem;
   border-bottom-right-radius: 1.5rem;
   border-top-left-radius: 1.5rem;
   border-bottom-left-radius: 1.5rem; */
}

.aa1:hover {
   border: 3px solid #ffc655;
   color: #ffc655;
}

/* aa1:visited{
   background: white;
   border: 3px solid #ffc655;
   color: #ffc655;
}

.aa1:active{
   background: white;
   border: 3px solid #ffc655;
   color: #ffc655;
} */

.aa2{
   width: 100%;
   border: none;
   background: #ffc655;
   color: white;
   font-weight: 600;
   font-size: 18px;
   border-top-right-radius: 1.5rem;
   border-bottom-right-radius: 1.5rem;
   border-top-left-radius: 1.5rem;
   border-bottom-left-radius: 1.5rem;
}

.aa3{
   
   width: 50%;
    border: 3px solid white;
    background: #ffc655;
    color: white;
    font-weight: 900;
    font-size: 18px;
    border-top-right-radius: 1.5rem;
    border-bottom-right-radius: 1.5rem;
    border-top-left-radius: 1.5rem;
    border-bottom-left-radius: 1.5rem;
}

.aa3:hover{
   width: 50%;
    border: 3px solid #ffc699;
    background: white;
    color: #ffc699;
    font-weight: 900;
    font-size: 18px;
    border-top-right-radius: 1.5rem;
    border-bottom-right-radius: 1.5rem;
    border-top-left-radius: 1.5rem;
    border-bottom-left-radius: 1.5rem;
}

.aa2b{
   width: 100%;
   background: #ffc655;
   vertical-align: middle;
   border-top-right-radius: 1.5rem;
   border-bottom-right-radius: 1.5rem;
   border-top-left-radius: 1.5rem;
   border-bottom-left-radius: 1.5rem;
}

.ha{
   
   color:  #ffcd41;
   font-size: 40px;
   font-weight: 900;
   
   
}

.h3{
    margin-top: 7%; 
    margin-bottom: 7%;
}

.h4{
   margin-top: 7%;
}

.hb{
   background: white;
}

.rf{
   font-size: 20px;
   font-weight: 600;
}

.rf_a{
   font-size: 20px; 
   text-decoration: none; 
   font-weight: 600;
   color: black;
}

.rf_a:hover{
   color: orange;
}
</style>
<title>실종/발견 글 작성</title>

<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script type='text/javascript' src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
<script type='text/javascript' src='https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js'></script>


<!-- 지도 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=67350dbec2efe1663af9ea26ecc6ec71&libraries=services" type="text/javascript"></script>

<!-- 달력 -->
<!-- <link rel="stylesheet" href="/css/jquery-ui.min.css"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>

</head>



<body oncontextmenu='return false' class='snippet-body'>

      <!--enctype="multipart/form-data"  -->
      <div class="container register mb-5">
         <div class="row">
            <div class="col-sm-3 register-left">
            <img class="cir mb-5" src="${root }img/sul.jpg" alt="" />
               <h1 class="mb-4">Welcome</h1>
               <h2 class="mb-5">사지말고 <br />입양하세요.</h2>
                <a class="btn btn-primary aa3 mb-3" href="${root }board/boardList?board_category=all">목록보기</a>
                <c:if test="${readContent.user_id eq loginUserBean.user_id}">
	               <a href="${root }board/modify?b_no=${b_no}&page=${page}" class="btn btn-primary aa3 mb-3">수정하기</a>
	               <a href="${root }board/delete?b_no=${b_no}&page=${page}&chip_num=${readContent.chip_num}" class="btn btn-primary aa3 mb-3" onclick="return deleteCk();">삭제하기</a>
                 </c:if>
               </div> 
              <div class="col-lg-9 register-right hb"> 
<!-- 기본정보 -->
            <div class="row">
               <div class="col-md-6">
                 <h2 class="register-heading ha mb-5">&nbsp;&nbsp;&nbsp;&nbsp;${readContent.board_category}</h2>
                  <div class="form-group ha1">
                     <div class="form-group">
                        <div class="map_wrap col-md-6">
                           <div class="form-group">
                              <div id="map" style="width: 370px; height: 300px;"></div>
                           </div>
                           <div class="hAddr">
                              <span class="title" style='text-align: center; height: 20px; width: 275px;'>지도중심기준 행정동 주소정보</span> <span style="text-align: center;" id="centerAddr">${readContent.address1}</span>
                           </div>
                        </div>
                     </div>	
                     <div class="form-group">
                        <p><a href="${root }board/userBoard?user=${readContent.user_id}" class="rf_a" style='text-decoration-line:none;'>아이디 : &nbsp;&nbsp;${readContent.user_id}</a></p>
                        <p class="rf">실종일 : &nbsp;&nbsp;${readContent.happen_date }</p>
                        <p class="rf">연락처 : &nbsp;&nbsp;${readContent.writer_phone}</p>
                        <table>
                           <tr>
                              <td class="rf">주소 : <p>${readContent.address1}</p>
                              </td>
                           </tr>
                           <tr>
                              <td class="rf">상세 주소 : <p>${readContent.address2}</p>
                              </td>
                           </tr>
                        </table>
                        <input type="hidden" class="form-control" value="${readContent.address1}" name="address1" id="searchAddr" />
                     </div>
                  </div>
               </div>
               <!-- 강아지 정보 -->
               <div class="col-lg-6">
                  <h3 class="register-heading ha">${readContent.breed}</h3>
                  <div class="row register-form">
                     <div class="form-group" style="margin-top: 12px;">
                        <div class="file-edit-icon"></div>
                     </div>
                     <div class="form-group">
                        <img class="img-fluid"
                           src="${root }upload/${readContent.dog_img}" width="100%" />

                        <div id="preview" style="size: 100%;"></div>
                     </div>
                  </div>
                  <div class="age_weight">
                     <div class="form-group">
                        <c:choose>
                           <c:when test="${readContent.age eq '나이 모름'}">
                              <p class="rf">나이 : &nbsp;&nbsp;${readContent.age }</p>
                           </c:when>
                           <c:otherwise>
                              <p class="rf">나이 : &nbsp;&nbsp;${readContent.age } 살</p>
                           </c:otherwise>
                        </c:choose>
                     </div>
                  </div>
                  <div>
                     <div class="form-group">
                        <c:choose>
                           <c:when test="${readContent.age eq '몸무게 모름'}">
                              <p class="rf">몸무게 : &nbsp;&nbsp;${readContent.weight}</p>
                           </c:when>
                           <c:otherwise>
                              <p class="rf">몸무게 : &nbsp;&nbsp;${readContent.weight} kg</p>
                           </c:otherwise>
                        </c:choose>
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="maxl">
                        <p class="rf">성 별 : &nbsp;&nbsp;${readContent.sex }</p>
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="maxl">
                        <p class="rf">중성화 : &nbsp;&nbsp;${readContent.neutering}</p>

                        <c:choose>
                           <c:when test="${null eq readContent.chip_num}">
                              <p class="rf">칩셋유무 : &nbsp;&nbsp;X</p>
                           </c:when>
                           <c:otherwise>
                              <p class="rf">칩셋유무 : &nbsp;&nbsp;O</p>
                              <p class="rf">이 름 : &nbsp;&nbsp;${readContent.dog_name}</p>
                           </c:otherwise>
                        </c:choose>
                        <div class="form-group">
                           <p class="rf">털 색 : &nbsp;&nbsp;${readContent.color}</p>
                        </div>
                        <div class="form-group">
                           <p class="rf">특 징 : &nbsp;&nbsp;${readContent.charcteristic}</p>
                        </div>
                        <div class="form-group">
                           <p class="rf">상세정보 : &nbsp;&nbsp;${readContent.dog_content}</p>
                        </div>
                     </div>
                  </div>
               </div>
            </div>




            <div class="tab-pane fade show" id="profile" role="tabpanel" aria-form:labelledby="profile-tab">
                     
                  </div>
               </div>
            </div>
            
         </div>







   <script>
   
  
				function deleteCk() {
					return confirm("삭제 하시겠습니까?")
				}

				/* 원래 리드폼에 있는거 복붙 */

				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					level : 5
				// 지도의 확대 레벨
				};

				//지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption);

				//주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();

				//주소로 좌표를 검색합니다
				var address1 = document.getElementById("searchAddr").value;

				geocoder
						.addressSearch(
								address1,
								function(result, status) {

									// 정상적으로 검색이 완료됐으면 
									if (status === kakao.maps.services.Status.OK) {

										var coords = new kakao.maps.LatLng(
												result[0].y, result[0].x);

										// 결과값으로 받은 위치를 마커로 표시합니다
										var marker = new kakao.maps.Marker({
											map : map,
											position : coords
										});

										// 인포윈도우로 장소에 대한 설명을 표시합니다
										var infowindow = new kakao.maps.InfoWindow(
												{
													content : '<div style="width:150px;text-align:center;padding:6px 0;">여기에요!!</div>'
												});
										infowindow.open(map, marker);

										// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										map.setCenter(coords);
									}
								});
			</script>

		<c:import url='/WEB-INF/views/include/footer_menu2.jsp' />
</body>
</html>