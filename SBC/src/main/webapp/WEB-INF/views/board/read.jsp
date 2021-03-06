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




<%-- <c:import url='/WEB-INF/views/include/header_menu4.jsp' />
 --%>
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



/* ?????? api */
    .map_wrap {position:relative;width:350px;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}


/* ????????? ?????? ?????? */
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






/* ?????? ?????? css */
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
    font-weight: 450;
    font-size: 22px;
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
    font-weight: 450;
    font-size: 22px;
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
   margin-left: 18%;
}

.rf1{
   margin-left: 18%;
   margin-top: -14%;
}

.rf1 th{
   font-size: 22px;
   
}

.rf1 td{
   font-size: 20px;
   color:gray;
   font-weight: 580;
   width:200px;
}

.rf th{
   font-size: 22px;
   font-weight: 600;
}

.rf td{
   font-size: 19px;
   font-weight: 580;
   color:gray;
}

.trr{
   position: relative; 
   top: -35px;
   left: -10%;
}
.trr1{
   position: relative; 
   top: -40px;
   right: -20%;
}

.rf_a {
   font-size: 20px;
   font-weight: 600;
   text-decoration: none;
   color:orange;
}

.rf_a:hover {
   color: #29bba0
}

.hh2{
   /* width:40%; 
   padding: 5px 0px; 
   border-radius: 5px; 
   color:#ffcd41; 
   left:30%; 
   background:white; 
   border:2px solid white;  */
   position:relative; 
   top: 7.5%;
   text-align: center;
   font-size: 40px;
   font-weight: 900;
   color: #1e9191
}

.mti{
   position: relative;
   top: 8%;
}

.hh4{
   position:relative; 
   top: 6%;
   text-align: center;
   font-size: 25px;
   font-weight: 900;
   color: #29bba0;
   margin-bottom: 15px;
}
</style>
<title>??????/?????? ??? ??????</title>

<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script type='text/javascript' src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
<script type='text/javascript' src='https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js'></script>


<!-- ?????? api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=67350dbec2efe1663af9ea26ecc6ec71&libraries=services" type="text/javascript"></script>

<!-- ?????? -->
<!-- <link rel="stylesheet" href="/css/jquery-ui.min.css"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>

</head>



<body oncontextmenu='return false' class='snippet-body'>
 <c:import url='/WEB-INF/views/include/header_menu4.jsp' />
      <!--enctype="multipart/form-data"  -->
      <div class="container register mb-5">
         <div class="row">
            <div class="col-sm-3 register-left">
               <h2 class="mb-4 mt-3 hh2">${readContent.board_category}</h2>
            <img class="cir mb-4 mti" src="${root }img/sul.jpg" alt="" />
               <h4 class="mb-5 mt-4 hh4">${readContent.breed}</h4>
                <a class="btn btn-primary aa3 mb-4 mt-5" href="${root }board/boardList?board_category=all">????????????</a>
                 <c:if test="${readContent.user_id eq loginUserBean.user_id}">
                  <a href="${root }board/modify?b_no=${b_no}&page=${page}" class="btn btn-primary aa3 mb-4">????????????</a>
                  <a href="${root }board/delete?b_no=${b_no}&page=${page}&chip_num=${readContent.chip_num}" class="btn btn-primary aa3 mb-3" onclick="return deleteCk();">????????????</a>
                  </c:if>
               </div> 
              <div class="col-lg-9 register-right hb"> 
<!-- ???????????? -->
            <div class="row">
               <div class="col-md-6">
                  <div class="form-group ha1">
                     <div class="form-group">
                        <div class="map_wrap col-md-6 ml-4 mt-5">
                           <div class="form-group">
                              <div id="map" style="width: 350px; height: 300px; border:2px solid #ffc699; border-radius:2%;"></div>
                           </div>
                           <div class="hAddr">
                              <span class="title" style='text-align: center; height: 20px; width: 275px;'>?????????????????? ????????? ????????????</span> <span style="text-align: center;" id="centerAddr">${readContent.address1}</span>
                           </div>
                        </div>
                     </div>   
                     <div class="form-group rf">
                     <table>
                        <tr class="trr">
                           <th>????????? : </th>
                           <td><a href="${root }board/userBoard?user=${readContent.user_id}" class="rf_a">${readContent.user_id}</a></td>
                        </tr>   
                        <tr class="trr">
                           <th><br />????????? : </th>
                           <td><br />${readContent.happen_date }</td>
                        </tr>   
                        <tr class="trr">
                           <th><br />????????? : </th>
                           <td><br />${readContent.writer_phone}</td>
                        </tr>   
                        <tr class="trr">
                           <th><br />?????? : </th>
                           <td><br />${readContent.address1}</td>
                        </tr>   
                        <tr class="trr">
                           <th><br />????????????: </th>
                        </tr>
                        <tr class="trr1">
                           <td>${readContent.address2}</td>
                        
                        </tr>   
                     </table>
                        <input type="hidden" class="form-control" value="${readContent.address1}" name="address1" id="searchAddr" />
                     </div>
                  </div>
               </div>
               <!-- ????????? ?????? -->
               <div class="col-lg-6">
                  <div class="row register-form">
                     <div class="form-group" style="margin-top: 12px;">
                        <div class="file-edit-icon"></div>
                     </div>
                     <div class="form-group ml-3"style="width:470px;height:300px; border:2px solid #ffc699;border-radius:2%; position: relative; top:-55px; left:-1.5%;">
                        <img class="img-fluid" src="${root }upload/${readContent.dog_img}" style="width:100%; height:100%; object-fit:scale-down"/>
                     <div id="preview" style="size: 100%;"></div>
                       </div>
                  </div>
                     <div class="age_weight">
                        <div class="form-group rf1">
                           <table>
                              <tr class="trr">
                                 <th>?????? : </th>
                                <c:choose>
                                   <c:when test="${readContent.age eq '?????? ??????'}">
                                      <td>${readContent.age }</td>
                                   </c:when>
                                   <c:otherwise>
                                      <td>${readContent.age } ???</td>
                                   </c:otherwise>
                                </c:choose>
                              </tr>
                              <tr class="trr">
                                 <th><br />????????? : </th>
                                <c:choose>
                                   <c:when test="${readContent.age eq '????????? ??????'}">
                                      <td><br />${readContent.weight}</td>
                                   </c:when>
                                   <c:otherwise>
                                      <td><br />${readContent.weight} kg</td>
                                   </c:otherwise>
                                </c:choose>
                              </tr>
                              <tr class="trr">
                                 <th><br />?????? : </th>
                                 <td><br />${readContent.sex }</td>
                              </tr>
                              <tr class="trr">
                                 <th><br />????????? : </th>
                                 <td style="font-size: 18px;"><br />${readContent.neutering}</td>
                              </tr>
                              <tr class="trr">
                                 <th><br />???????????? : </th>
                                 <c:choose>
                                    <c:when test="${null eq readContent.chip_num}">
                                       <td style="font-size: 18px;"><br />x</td>
                                    </c:when>
                                    <c:otherwise>
                                       <td style="font-size: 18px;"><br />o</td>
                                       <th><br />??? ??? : </th><td><br />${readContent.dog_name}</td>
                                    </c:otherwise>
                                 </c:choose>
                              </tr>
                              <tr class="trr">
                                 <th><br />??? ??? : </th>
                                 <td><br />${readContent.color}</td>
                              </tr>
                              <tr class="trr">
                                 <th><br />??? ??? : </th>
                                 <td><br />${readContent.charcteristic}</td>
                              </tr>
                              <tr class="trr">
                                 <th><br />???????????? : &nbsp;</th>
                                 <td><br />${readContent.dog_content}</td>
                              </tr>
                     </table>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
      </div>
   </div>
        







   <script>
   
  
            function deleteCk() {
               return confirm("?????? ???????????????????")
            }

            /* ?????? ???????????? ????????? ?????? */

            var mapContainer = document.getElementById('map'), // ????????? ????????? div 
            mapOption = {
               center : new kakao.maps.LatLng(33.450701, 126.570667), // ????????? ????????????
               level : 5
            // ????????? ?????? ??????
            };

            //????????? ???????????????    
            var map = new kakao.maps.Map(mapContainer, mapOption);

            //??????-?????? ?????? ????????? ???????????????
            var geocoder = new kakao.maps.services.Geocoder();

            //????????? ????????? ???????????????
            var address1 = document.getElementById("searchAddr").value;

            geocoder
                  .addressSearch(
                        address1,
                        function(result, status) {

                           // ??????????????? ????????? ??????????????? 
                           if (status === kakao.maps.services.Status.OK) {

                              var coords = new kakao.maps.LatLng(
                                    result[0].y, result[0].x);

                              // ??????????????? ?????? ????????? ????????? ???????????????
                              var marker = new kakao.maps.Marker({
                                 map : map,
                                 position : coords
                              });

                              // ?????????????????? ????????? ?????? ????????? ???????????????
                              var infowindow = new kakao.maps.InfoWindow(
                                    {
                                       content : '<div style="font-weight:700;color: orange; width:150px;text-align:center;padding:6px 0;">????????????!!</div>'
                                    });
                              infowindow.open(map, marker);

                              // ????????? ????????? ??????????????? ?????? ????????? ??????????????????
                              map.setCenter(coords);
                           }
                        });
         </script>

      <%-- <c:import url='/WEB-INF/views/include/footer_menu2.jsp' /> --%>
      <script>
      <!-- ???????????? -->
      
      /* <!-- Bootstrap core CSS -->
      <link href="${root }css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
      <!-- Custom styles for this template -->
      <link href="${root }css/style.css" rel="stylesheet"> */
      
      
      </script>

</body>
</html>