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
   
   margin-right:18px;
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

.aa4{
    font-weight: 900;
    color: #ffc655;
    
    border: 3px solid #ffc655;
    background: white;
    /* border-top-right-radius: 1.5rem;
    border-bottom-right-radius: 1.5rem;
    border-top-left-radius: 1.5rem;
    border-bottom-left-radius: 1.5rem; */
}

.aa4:hover{
   font-weight: 900;
    color: white;
    border: none;
    background: #ffc699;
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
<%-- <script src="${root }/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script> --%>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>

</head>


<body oncontextmenu='return false' class='snippet-body'>



	<!-- footer  -->
	<c:import url='/WEB-INF/views/include/header_menu4.jsp' />






   <form:form action="${root}board/write" modelAttribute="db" method="post" enctype="multipart/form-data" onsubmit="return formCheck(this)">
      <!--enctype="multipart/form-data"  -->
      <div class="container register mb-5">
         <div class="row">
            <div class="col-md-3 register-left">
               <img class="cir mb-5" src="${root }img/sul.jpg" alt="" />
               <h1 class="mb-4">Welcome</h1>
               <h2 class="mb-5">???????????? <br />???????????????.</h2> 
                <form:button class="btn btn-primary aa3 mb-3" type="submit" path="${root}board/write" role="tab">??? ??????</form:button>
                <a class="btn btn-primary aa3 mb-3" href="${root }board/boardList?board_category=all" type="" path="" role="tab">??????</a>
            </div>
            <div class="col-lg-9 register-right hb">
               <ul class="nav nav-tabs nav-justified aa2b"style="vertical-align: middle;" id="myTab" role="tablist">
                  <li class="nav-item"><a  class="nav-link aa1 active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">?????? ??????</a></li>
                  <li class="nav-item"><a class="nav-link aa1" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">????????? ??????</a></li>
               </ul>
               <div class="tab-content" id="myTabContent">
                  <div class="tab-pane fade show active pt-5" id="home" role="tabpanel" aria-form:labelledby="home-tab">
                     <h3 class="register-heading ha">?????? ??????</h3>
                     <div class="row register-form">
                        <div class="col-md-6">
                           <div class="form-group">
                              <form:select class="form-control" id="category"
                                 path="board.board_category" required='true'>
                                 <form:option class="hidden" value="" selected="true" disabled="true">??????</form:option>
                                 <form:option value="??????">??????</form:option>
                                 <form:option value="??????">??????</form:option>
                                 <form:option value="????????????">????????????</form:option>
                                 <form:option value="??????">??????</form:option>
                                 <form:option value="??????">??????</form:option>
                              </form:select>
                           </div>
                           <div class="form-group ">
                              <div class="input-group date">
                                 <form:input type="text" path="dog.happen_date" class="form-control" id='datepicker' />
                                 <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                              </div>
                           </div>
                           <div class="form-group">
                              <form:input type="text" path="board.writer_phone" minlength="10" maxlength="11" name="txtEmpPhone" class="form-control" placeholder="?????????????????? *" value="" required='true' />
                           </div>
                           <div class="form-group">
                              <div class="map_wrap col-md-5">
                                 <div id="map" style="width: 600px; height: 400px; margin-top: 10px; position: relative; overflow: hidden;"></div>
                                 <div class="hAddr">
                                    <span class="title" style='text-align: center; height: 20px; width: 275px;'>?????????????????? ????????? ????????????</span> <span style="text-align: center;" id="centerAddr">${readContent.address1}</span>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6">
                        <div class="form-group">
                              <form:input type="text" class="form-control" path="dog.address1" name="address1" id="sample5_address" placeholder="??????" style="position: relative;" readonly="true" required='required' />
                           </div>
                           <div class="form-group">
                              <form:input type="text" class="form-control" path="dog.address2" name="address2" placeholder="????????????" />
                           </div>
                           <div class="form-group">
                              <input type="button" class="form-control" onclick="sample5_execDaumPostcode()" value="?????? ??????">
                           </div>
                        </div>
                     </div>
                  </div>



                  <div class="tab-pane fade show pt-5" id="profile" role="tabpanel" aria-form:labelledby="profile-tab">
                     <h3 class="register-heading ha">????????? ??????</h3>
                     <div class="row register-form">
                        <div class="col-md-6">
                           <div class="form-group">
                              <form:select path="dog.breed" class="form-control"
                                 required='true'>
                                 <form:option class="hidden" value="" selected="true" disabled="true">?????? ??????</form:option>
                                 <form:option value="?????? ????????????">?????? ????????????</form:option>
                                 <form:option value="????????????">????????????</form:option>
                                 <form:option value="????????????????????????">????????????????????????</form:option>
                                 <form:option value="?????????">?????????</form:option>
                                 <form:option value="???????????????">???????????????</form:option>
                                 <form:option value="????????????">????????????</form:option>
                                 <form:option value="?????????">?????????</form:option>
                                 <form:option value="?????????">?????????</form:option>
                                 <form:option value="??????">??????</form:option>
                                 <form:option value="??????">??????</form:option>
                                 <form:option value="????????????">????????????</form:option>
                                 <form:option value="??????????????????">??????????????????</form:option>
                                 <form:option value="?????? ??????">?????? ??????</form:option>
                                 <form:option value="?????????">?????????</form:option>
                                 <form:option value="????????????">????????????</form:option>
                                 <form:option value="?????????">?????????</form:option>
                                 <form:option value="??????????????????">??????????????????</form:option>
                                 <form:option value="??????">??????</form:option>
                                 <form:option value="??????">??????</form:option>
                                 <form:option value="?????????">?????????</form:option>
                                 <form:option value="???????????????">???????????????</form:option>
                                 <form:option value="???????????????">???????????????</form:option>
                                 <form:option value="????????????">????????????</form:option>
                                 <form:option value="?????????">?????????</form:option>
                                 <form:option value="??????">??????</form:option>
                              </form:select>
                           </div>

                           <div class="age_weight">
                              <div class="form-group">
                                 <form:select class="form-control mm" path="dog.age" required='true'>
                                    <form:option class="hidden" value="" selected="true" disabled="true">?????? ??????</form:option>
                                    <form:option value="?????? ??????">?????? ??????</form:option>
                                    <c:forEach var="age" begin="1" end="30">
                                       <form:option value="${age}">${age} ???</form:option>
                                    </c:forEach>
                                 </form:select>
                              </div>
                              <div>
                                 <form:select class="form-control mn" path="dog.weight" required='true'>
                                    <form:option class="hidden" value="" selected="true" disabled="true">????????? ??????</form:option>
                                    <form:option value="????????? ??????">????????? ??????</form:option>
                                    <c:forEach var="weight" begin="1" end="50">
                                       <form:option value="${weight}">${weight} kg</form:option>
                                    </c:forEach>
                                 </form:select>
                              </div>
                           </div>
                           <div class="form-group">
                              <div class="maxl">
                                 <form:label class="radio inline" path="dog.sex">
                                    <span>?????? </span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                       </form:label>
                                 <form:label class="radio inline" path="dog.sex">
                                    <form:radiobutton path="dog.sex" checked='true' value="??????" />
                                    <span>&nbsp;?????? </span>&nbsp;&nbsp;&nbsp;&nbsp;
                                 </form:label>
                                 <form:label class="radio inline" path="dog.sex">
                                    <form:radiobutton path="dog.sex" value="??????" />
                                    <span>&nbsp;?????? </span>&nbsp;&nbsp;&nbsp;&nbsp;
                                 </form:label>
                                 <form:label class="radio inline" path="dog.sex">
                                    <form:radiobutton path="dog.sex" value="?????????" />
                                    <span>????????? </span>
                                 </form:label>
                              </div>
                           </div>
                           <div class="form-group">
                              <div class="maxl">
                                 <form:label class="radio inline" path="dog.neutering">
                                    <form:checkbox path="dog.neutering" name="neutering" value="false" id="neutering" />
                                    <span>?????????</span>
                                 </form:label>
                                 <form:label class="radio inline cc" path="chip.chip_num">
                                    <input type="checkbox" id="chip_num_ck" name="chip_num_ck" value="" />
                                    <span>?????? ??????</span>
                                 </form:label>
                            <div class="form-group chipDiv">
                              <form:input type='text' class='form-control rfid mb-3' id='chip_num' path='chip.chip_num' onkeypress="resetIdExist()" minlength="15" maxlength="15" placeholder='??????????????????' />
                              <form:input type='text' path='chip.dog_name' class='form-control rfid mb-3' id='dog_name' placeholder='???????????????' />
                              <form:input type='text' path='chip.phone' class='form-control rfid mb-3' minlength="10" maxlength="11" placeholder='???????????????' />
                              <button type="button" class="form-control btn btn-primary rfid aa4" onclick="checkRFID()">????????????</button>
                              <input type="hidden" id='chip_ck' value='0'/>
                           </div>        
                           <div class="form-group">
                              <form:input type="text" class="form-control" placeholder="??????" path="dog.color" required='true' />
                           </div>
                           <div class="form-group">
                              <form:input type="text" class="form-control" placeholder="??????" path="dog.charcteristic" required='true' />
                           </div>
                           <div class="form-group">
                              <form:textarea rows="4" cols="37" class="form-control" placeholder="????????????" style="resize:none;" path="dog.dog_content" />
                           </div>
                           
                              </div>
                           </div>
                        </div>

                        <div class="col-md-6">
                           <div class="form-group">
                              <form:label path="dog.dog_img">?????? ?????????</form:label>
                              <div class="file-edit-icon"></div>
                           </div>
                           <div class="form-group">
                              <form:input class="upload-box upload-plus" type="file" name="dog_img" id="dog_img" path="dog.originFile" accept="image/*" required='true' />
                              <div id="preview" style="margin-top:150px; size: 30%;"></div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </form:form>








   <script>
   
   //??? ?????? ?????? ???????????????(???)
    function formCheck(frm) {
       var ck = $('#chip_ck').val();
       var add =$('#sample5_address').val();
       console.log("address?"+add)
       
       if(add==''){
          alert('????????? ??????????????????.');
          return false;
       }
       
       if(add == null){
          alert('????????? ??????????????????.')
          return false;
       }
         if ($('#chip_num_ck').is(":checked")){
            if(ck=='0'){
                   alert('?????? ?????? ????????? ????????????');
                   return false;
            }
         }
           return true;
       }
     
   
   /* ???????????? ?????? ?????? ??????*/
   function resetIdExist() {
   $("#chip_ck").attr('value', '0');
    console.log("???????????"+$("#chip_ck").value())
   }
    
      //????????? ??????
        $('.chipDiv').hide();
        $('.rfid').val(''); 
        $('#chip_num_ck').click(function() {
            if ($('#chip_num_ck').is(":checked")) {
               $('.chipDiv').show();
               $('#chip_num').attr('required', true);
               $('#dog_name').attr('required', true);
               
               }else{
                  $('.chipDiv').hide();
                   $('#chip_num').attr('required', false);
                  $('#dog_name').attr('required', false);
                   $('.rfid').val('');              
            }
       }) 

   
   
   
   
   function checkRFID() {
       //?????? ?????? : ???????????? ????????? id????????????
       var rfid=$("#chip_num").val()
       console.log(rfid+"??")
       //???????????? ???????????? ??????
       if(rfid.length<15){
          alert("????????? ????????? ??????????????????")
          return
       }
       
       
    $.ajax({
       url:"${root}board/checkRFID/" + rfid,  //????????? ????????? ??????
       type:"get",   
       dataType:"text",  //????????? ?????????
       success: function(result){
          console.log(result)
          if(result.trim()=="true"){
             alert("????????????")
            /*   $("#chip_num").attr('readonly',true); */
                $("#chip_ck").val("1")
          }else{
             alert("?????? ??? ?????? ?????????. ?????? ??????")
             $("#chip_num").val('')
              $("#chip_ck").val("0")
          }
       }
    });
   }

   
    
   
   
      var mapContainer = document.getElementById('map'), // ????????? ????????? div
      mapOption = {
         center : new daum.maps.LatLng(37.56956672095332, 126.98600383248464),
         level : 5
      // ????????? ?????? ??????
      };

      //????????? ?????? ??????
      var map = new daum.maps.Map(mapContainer, mapOption);

      //??????-?????? ?????? ????????? ??????
      var geocoder = new daum.maps.services.Geocoder();

      //????????? ?????? ??????
      var marker = new daum.maps.Marker({ // ????????? ????????? ????????? ???????????????
         position : new daum.maps.LatLng(37.56956672095332, 126.98600383248464),
         map : map
      });

      infowindow = new kakao.maps.InfoWindow({
         zindex : 1
      }); // ????????? ????????? ?????? ????????? ????????? ????????????????????????

      function sample5_execDaumPostcode() {
         new daum.Postcode({
            oncomplete : function(data) {
               var addr = data.address; // ?????? ?????? ??????

               // ?????? ????????? ?????? ????????? ?????????.
               document.getElementById("sample5_address").value = addr;
               // ????????? ?????? ????????? ??????
               geocoder.addressSearch(data.address, function(results,
                     status) {
                  // ??????????????? ????????? ???????????????
                  if (status === daum.maps.services.Status.OK) {

                     var result = results[0]; //????????? ????????? ?????? ??????

                     // ?????? ????????? ?????? ????????? ?????????
                     var coords = new daum.maps.LatLng(result.y, result.x);
                     // ????????? ????????????.
                     mapContainer.style.display = "block";
                     map.relayout();
                     // ?????? ????????? ????????????.
                     map.setCenter(coords);
                     // ????????? ??????????????? ?????? ????????? ?????????.
                     marker.setPosition(coords)
                     
                     console.log("???????????? "+result.y, result.x);
                  }
               });
            }
         }).open();
      }

      // ?????? ?????? ??????????????? ????????? ???????????? ?????? ?????? ????????? ???????????????
      searchAddrFromCoords(map.getCenter(), displayCenterInfo);

      // ????????? ???????????? ??? ?????? ?????? ????????? ?????? ??????????????? ??????????????? ???????????? ???????????????
      kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
         searchDetailAddrFromCoords(mouseEvent.latLng, function(result,
               status) {
            if (status === kakao.maps.services.Status.OK) {
               var detailAddr = !!result[0].road_address ? '<div>??????????????? : '
                     + result[0].road_address.address_name + '</div>'
                     : '';
               detailAddr += '<div>?????? ?????? : '
                     + result[0].address.address_name + '</div>';

               var content = '<div class="bAddr">'
                     + '<span class="title">????????? ????????????</span>'
                     + detailAddr + '</div>';

               // ????????? ????????? ????????? ??????????????? 
               marker.setPosition(mouseEvent.latLng);
               marker.setMap(map);

               // ?????????????????? ????????? ????????? ?????? ????????? ?????? ??????????????? ???????????????
               $('#sample5_address').val(result[0].address.address_name);
               infowindow.setContent(content);
               infowindow.open(map, marker);
               
            }
         });
      });

      // ?????? ????????? ?????? ????????? ???????????? ??? ?????? ?????? ????????? ?????? ?????? ????????? ??????????????? ???????????? ???????????????
      kakao.maps.event.addListener(map, 'idle', function() {
         searchAddrFromCoords(map.getCenter(), displayCenterInfo);
      });

      function searchAddrFromCoords(coords, callback) {
         // ????????? ????????? ?????? ????????? ???????????????
         geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),
               callback);
      }

      function searchDetailAddrFromCoords(coords, callback) {
         // ????????? ????????? ?????? ?????? ????????? ???????????????
         geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
      }

      // ?????? ??????????????? ?????? ??????????????? ?????? ??????????????? ???????????? ???????????????
      function displayCenterInfo(result, status) {
         if (status === kakao.maps.services.Status.OK) {
            var infoDiv = document.getElementById('centerAddr');

            for (var i = 0; i < result.length; i++) {
               // ???????????? region_type ?????? 'H' ?????????
               if (result[i].region_type === 'H') {
                  infoDiv.innerHTML = result[i].address_name;
                  break;
               }
            }
         }
      }
      
      //????????? ??????, ????????? ????????????
      $('#dog_img').change(handleFileSelect);
         
       function handleFileSelect(event) {
          var input = this;
             if(input.files.length>1){
                alert('??? ?????? ????????? ???????????????.');
                return false;
             }
              if(input.files.length==1){
                 var reader = new FileReader();
                 this.enabled = false
                 reader.onload = (function (e) {
                       console.log(e)
                     $("#preview").html(['<img style="margin-top:-45%; width:100%; height:50%;" class="thumb"  src="', e.target.result, '" title="', escape(e.name), '"/>'].join('')) 
                  $('.file-edit-icon').html(["<button type='button' class='delBtn cvv'>??????</button>"]);
              });
              reader.readAsDataURL(input.files[0]); 
              }  
      }

      //????????? ??????
      $('.file-edit-icon').on('click', '.delBtn', function () {
          $("#preview").empty()
          $(".file-edit-icon").empty()
          $("#dogImg").val("");
      });

      
         //????????? ??? ??????
        $('#neutering').click(function() {
           if ($(this).is(":checked")) {
              $('#neutering').val('true');
           }else{
              $('#neutering').val('false');
           }
        })
   
        
      
      
       //?????? ??????
       var nowDate = new Date();
       var nYear = nowDate.getFullYear(); //?????? ??????
       var nMonth = nowDate.getMonth()+1; //?????? 0?????? ??????.
       var nDate = nowDate.getDate(); //?????? ???
       if(nMonth<10) nMonth="0"+nMonth;
       if(nDate<10) nDate="0"+nDate;
       var nDt = "" + nYear + "-" + nMonth + "-" + nDate ;
       
        $('#datepicker').val(nDt);  
        
            $(function(){
                $('.input-group.date').datepicker({  
                  beforeShowDay:noBefore,
                  
                  showMonthAfterYear:true,
                  
                   calendarWeeks: false,
   
                   todayHighlight: true,
   
                   autoclose: true,
   
                   format: "yyyy-mm-dd",
   
                   language: "kr"
                   
               });

        }); 
         
         //?????? ?????? ????????? ?????? ???????????? ??????.
         function noBefore(date){
            if(date>new Date()){
               return  false;
            } return true;
         }
           
        
       
         ;(function($){
          $.fn.datepicker.dates['kr'] = {
             days: ["?????????", "?????????", "?????????", "?????????", "?????????", "?????????", "?????????", "?????????"],
             daysShort: ["???", "???", "???", "???", "???", "???", "???", "???"],
             daysMin: ["???", "???", "???", "???", "???", "???", "???", "???"],
             months: ["1???", "2???", "3???", "4???", "5???", "6???", "7???", "8???", "9???", "10???", "11???", "12???"],
             monthsShort: ["1???", "2???", "3???", "4???", "5???", "6???", "7???", "8???", "9???", "10???", "11???", "12???"]
          };
       }(jQuery));  




      
   </script>


</body>
</html>