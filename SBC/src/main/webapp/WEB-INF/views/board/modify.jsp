<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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

<link
   href='https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'
   rel='stylesheet'>
<link href='' rel='stylesheet'>



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
.map_wrap {
   position: relative;
   width: 350px;
   height: 350px;
}

.title {
   font-weight: bold;
   display: block;
}

.hAddr {
   position: absolute;
   left: 10px;
   top: 10px;
   border-radius: 2px;
   background: #fff;
   background: rgba(255, 255, 255, 0.8);
   z-index: 1;
   padding: 5px;
}

#centerAddr {
   display: block;
   margin-top: 2px;
   font-weight: normal;
}

.bAddr {
   padding: 5px;
   text-overflow: ellipsis;
   overflow: hidden;
   white-space: nowrap;
}

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
<title>실종/발견 글 작성</title>

<script type='text/javascript'
   src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script type='text/javascript'
   src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
<script type='text/javascript'
   src='https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js'></script>


<!-- 지도 api -->
<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=67350dbec2efe1663af9ea26ecc6ec71&libraries=services"
   type="text/javascript"></script>

<!-- 달력 -->
<!-- <link rel="stylesheet" href="/css/jquery-ui.min.css"> -->
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script
   src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
<script type='text/javascript'
   src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>

</head>


<body oncontextmenu='return false' class='snippet-body'>

   <form:form action="${root}board/modify_pro?chipExit=${chipExit}" modelAttribute="modifyBean" method="post" onsubmit="return formCheck(this)" enctype="multipart/form-data">
      <input type="hidden" name='page' value='${page }' />
      <form:hidden path="board_num" />
      <form:hidden path="user_id" />
      <form:hidden path="reg_time" />
      <form:hidden path="readcount" />
      <form:hidden path="dog_num" />

      <div class="container register mb-5">
         <div class="row">
            <div class="col-md-3 register-left">
               <img class="cir mb-5" src="${root }img/sul.jpg" alt="" />
               <h1 class="mb-4">Welcome</h1>
               <h2 class="mb-5">사지말고 <br />입양하세요.</h2>
               <form:button class="btn btn-primary aa3 mb-3" type="submit" name="" path="수정완료" >수정완료</form:button><br /> 
               <a class="btn btn-primary aa3 mb-3" href="${root }board/read?b_no=${b_no}&page=${page}">취소</a>
            </div>
            <div class="col-lg-9 register-right hb">
               <ul class="nav nav-tabs nav-justified aa2b" id="myTab" role="tablist">
                  <li class="nav-item"><a class="nav-link aa1 active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">기본 정보</a></li>
                  <li class="nav-item"><a class="nav-link aa1" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">강아지 정보</a></li>
               </ul>
               <div class="tab-content" id="myTabContent">
                  <div class="tab-pane fade show active pt-5" id="home" role="tabpanel" aria-form:labelledby="home-tab">
                    <h3 class="register-heading ha">기본 정보</h3>
                     <div class="row register-form">
                     <div class="col-md-6">
                           <div class="form-group">
                              <form:select class="form-control" id="category" path="board_category" required='true'>
                                 <form:option class="hidden" value="" selected="true" disabled="true">구분</form:option>
                                 <form:option value="실종">실종</form:option>
                                 <form:option value="보호">보호</form:option>
                                 <form:option value="보호요청">보호요청</form:option>
                                 <form:option value="목격">목격</form:option>
                                 <form:option value="완료">완료</form:option>
                              </form:select>
                           </div>
                           <div class="form-group ">
                              <div class="input-group date">
                                 <form:input type="text" path="happen_date" class="form-control" id='datepicker' />
                                 <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                              </div>
                           </div>
                           <div class="form-group">
                              <form:input type="text" path="writer_phone" name="txtEmpPhone" class="form-control" placeholder="연락받을번호 *" value="" required='true' />
                              <form:errors path="writer_phone" style="color:red" />
                           </div>
                           <div class="form-group">
                              <div class="map_wrap col-md-5">
                                 <div id="map"
                                    style="width: 600px; height: 400px; margin-top: 10px; position: relative; overflow: hidden;"></div>
                                 <div class="hAddr">
                                    <span class="title" style='text-align:center; height: 20px; width: 275px;'>지도중심기준
                                       행정동 주소정보</span> <span style="text-align:center;" id="centerAddr"></span>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6">
                           <div class="form-group">
                              <form:input type="text" class="form-control" path="address1" name="address1" id="sample5_address" placeholder="주소" style="position: relative;" readonly="true" required='true' />
                           </div>
                           <div class="form-group">
                              <form:input type="text" class="form-control" path="address2" name="address2" placeholder="상세주소" />
                           </div>
                           <div class="form-group">
                              <input type="button" class="form-control" onclick="sample5_execDaumPostcode()" value="주소 검색">
                           </div>
                        </div>
                     </div>
                  </div>



                  <div class="tab-pane fade show pt-5" id="profile" role="tabpanel" aria-form:labelledby="profile-tab">
                     <h3 class="register-heading ha">강아지 정보</h3>
                     <div class="row register-form">
                        <div class="col-md-6">
                           <div class="form-group">
                              <form:select path="breed" class="form-control" required='true'>
                                 <form:option class="hidden" value="" selected="true" disabled="true">품종 선택</form:option>
                                 <form:option value="골든 리트리버">골든 리트리버</form:option>
                                 <form:option value="닥스훈트">닥스훈트</form:option>
                                 <form:option value="라브라도리트리버">라브라도리트리버</form:option>
                                 <form:option value="말티즈">말티즈</form:option>
                                 <form:option value="비숑프리제">비숑프리제</form:option>
                                 <form:option value="보더콜리">보더콜리</form:option>
                                 <form:option value="삽살개">삽살개</form:option>
                                 <form:option value="스피츠">스피츠</form:option>
                                 <form:option value="시바">시바</form:option>
                                 <form:option value="시츄">시츄</form:option>
                                 <form:option value="슈나우저">슈나우저</form:option>
                                 <form:option value="요크셔테리어">요크셔테리어</form:option>
                                 <form:option value="웰시 코기">웰시 코기</form:option>
                                 <form:option value="진도견">진도견</form:option>
                                 <form:option value="차우차우">차우차우</form:option>
                                 <form:option value="치와와">치와와</form:option>
                                 <form:option value="코카스파니엘">코카스파니엘</form:option>
                                 <form:option value="퍼그">퍼그</form:option>
                                 <form:option value="푸들">푸들</form:option>
                                 <form:option value="풍산견">풍산견</form:option>
                                 <form:option value="포메라니안">포메라니안</form:option>
                                 <form:option value="프렌치불독">프렌치불독</form:option>
                                 <form:option value="패키니즈">패키니즈</form:option>
                                 <form:option value="믹스견">믹스견</form:option>
                                 <form:option value="기타">기타</form:option>
                              </form:select>
                           </div>

                           <div class="age_weight">
                              <div class="form-group">
                                 <form:select class="form-control mm" path="age" required='true'>
                                    <form:option class="hidden" value="" selected="true" disabled="true">나이 선택</form:option>
                                    <form:option value="나이 모름">나이 모름</form:option>
                                    <c:forEach var="age" begin="1" end="30">
                                       <form:option value="${age}">${age} 살</form:option>
                                    </c:forEach>
                                 </form:select>
                              </div>
                              <div>
                                 <form:select class="form-control mn" path="weight" required='true'>
                                    <form:option class="hidden" value="" selected="true" disabled="true">몸무게 선택</form:option>
                                    <form:option value="몸무게 모름">몸무게 모름</form:option>
                                    <c:forEach var="weight" begin="1" end="50">
                                       <form:option value="${weight}">${weight} kg</form:option>
                                    </c:forEach>
                                 </form:select>
                              </div>
                           </div>
                           <div class="form-group">
                              <div class="maxl">
                                 <form:label class="radio inline" path="sex">
                                    <span> 성별 </span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                       </form:label>
                                 <form:label class="radio inline" path="sex">
                                    <form:radiobutton path="sex" checked='true' value="수컷" />
                                    <span>&nbsp;수컷 </span>&nbsp;&nbsp;&nbsp;&nbsp;
                                 </form:label>
                                 <form:label class="radio inline" path="sex">
                                    <form:radiobutton path="sex" value="암컷" />
                                    <span>&nbsp;암컷 </span>&nbsp;&nbsp;&nbsp;&nbsp;
                                 </form:label>
                                 <form:label class="radio inline" path="sex">
                                    <form:radiobutton path="sex" value="미확인" />
                                    <span>&nbsp;미확인 </span>
                                 </form:label>
                              </div>
                           </div>
                           <div class="form-group">
                              <div class="maxl">
                                 <c:if test='${"o" eq modifyBean.neutering}'>
                                    <form:label class="radio inline" path="neutering">
                                       <form:checkbox path="neutering" name="neutering"
                                          value="false" id="neutering" checked='true' />
                                       <span>중성화</span>
                                    </form:label>
                                 </c:if>
                                 <c:if test='${"x" eq modifyBean.neutering}'>
                                    <form:label class="radio inline" path="neutering">
                                       <form:checkbox path="neutering" name="neutering"
                                          value="false" id="neutering" />
                                       <span>중성화</span>
                                    </form:label>
                                 </c:if>

                                 <c:if test="${not empty modifyBean.chip_num}">
                                    <form:label class="radio inline cc" path="chip_num">
                                       <input type="checkbox" id="chip_num_ck" name="chip_num_ck"
                                          value="" checked disabled />
                                       <input type="hidden" id='havechip' value='1' />
                                       <span>칩셋 보유</span>
                                    </form:label>
                                 </c:if>

                                 <c:if test="${empty modifyBean.chip_num}">
                                    <form:label class="radio inline cc" path="chip_num">
                                       <input type="checkbox" id="chip_num_ck" name="chip_num_ck"
                                          value="" />
                                       <span>칩셋 보유</span>
                                    </form:label>
                                 </c:if>
                              </div>
                           </div>
                           <div class="form-group chipDiv">
                              <form:input type='text' class='form-control rfid mb-3' id='chip_num' path='chip_num' minlength="15" maxlength="15"
                                 onkeypress="resetIdExist()" placeholder='칩셋번호입력' />
                              <form:errors path="chip_num" style="color:red" />
                              <form:input type='text' path='dog_name'
                                 class='form-control rfid mb-3' placeholder='강아지이름' />
                              <form:input type='text' path='phone' class='form-control rfid mb-3'
                                 placeholder='주인연락처' />
                              <button type="button"
                                 class="form-control btn btn-primary rfid aa4"
                                 onclick="checkRFID()">중복확인</button>
                              <input type="hidden" id='chip_ck' value='0' />
                           </div>
                           <div class="form-group">
                              <form:input type="text" class="form-control" placeholder="털색"
                                 path="color" required='true' />
                              <form:errors path="color" style="color:red" />
                           </div>
                           <div class="form-group">
                              <form:input type="text" class="form-control" placeholder="특징"
                                 path="charcteristic" required='true' />
                              <form:errors path="charcteristic" style="color:red" />
                           </div>
                           <div class="form-group">
                              <form:textarea rows="4" cols="37" class="form-control"
                                 placeholder="상세내용" style="resize:none;" path="dog_content" />
                           </div>

                           
                        </div>
                        <div class="col-md-6">
                           <div class="form-group">
                              <form:label path="dog_img">첨부 이미지</form:label>
                              <div class="file-edit-icon"></div>
                           </div>
                           <div class="form-group">
                              <form:input class="upload-box upload-plus" type="file"
                                 name="dog_img" id="dog_img" path="originFile"
                                 accept="image/*" />
                              <form:errors path="originFile" style="color:red" />
                              <form:hidden path="dog_img" />
                              <div id="preview" style="margin-top:15px; size: 30%;">
                                 <img src="${root }upload/${modifyBean.dog_img}" width="100%" />
                              </div>
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


$(document).ready(function() {

if ($('#chip_num_ck').is(":checked")){
     $('.chipDiv').show();
     $('#chip_num').attr('readonly', true);
     $('#dog_name').attr('required', true);
   }else{
       $('.chipDiv').hide();
   }

});

</script>





   <script>
   
   //글 입력 저장 유효성검사(칩)
    function formCheck(frm) {
       var ck = $('#chip_ck').val();
       var have = $('#havechip').val();
         if ($('#chip_num_ck').is(":checked")){
            if(have =='1'){
               //ck=='1';
               return true;
            }
            if(ck=='0'){
                   alert('칩셋 중복 체크를 해주세요');
                   return false;
            }
         }
          return confirm("수정 완료 하시겠습니까?");
      }
    
     
   
   /* 사용할수 없는 칩셋 번호*/
   function resetIdExist() {
   $("#chip_ck").attr('value', '0');
    console.log("체크값??"+$("#chip_ck").value())
   }
    
      //칩셋값 주기
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
       //변수 선언 : 사용자가 입력한 id가져오기
       var rfid=$("#chip_num").val()
       console.log(rfid+"??")
       //입력값이 없을시에 요청
       if(rfid.length<15){
          alert("올바른 번호를 입력해주세요")
          return
       }
       
       
    $.ajax({
       url:"${root}board/checkRFID/" + rfid,  //요청할 페이지 주소
       type:"get",   
       dataType:"text",  //넘어올 문자열
       success: function(result){
          console.log(result)
          if(result.trim()=="true"){
             alert("사용가능")
            /*   $("#chip_num").attr('readonly',true); */
                $("#chip_ck").val("1")
          }else{
             alert("등록 된 번호 입니다. 사용 불가")
             $("#chip_num").val('')
              $("#chip_ck").val("0")
          }
       }
    });
}
   
   
   

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
   var address1 = document.getElementById("sample5_address").value;
   var marker='';
   

      geocoder.addressSearch(address1, function(result, status) {
   
      // 정상적으로 검색이 완료됐으면 
       if (status === kakao.maps.services.Status.OK) {
   
          var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
   
          // 결과값으로 받은 위치를 마커로 표시합니다
             marker = new kakao.maps.Marker({
              map: map,
              position: coords
          });
   
          
          
          infowindow = new kakao.maps.InfoWindow({
            zindex : 1
         }); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
          
          // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
          map.setCenter(coords);
         
      } 
   }); 
   
   


      function sample5_execDaumPostcode() {
         new daum.Postcode({
            oncomplete : function(data) {
               var addr = data.address; // 최종 주소 변수

               // 주소 정보를 해당 필드에 넣는다.
               document.getElementById("sample5_address").value = addr;
               // 주소로 상세 정보를 검색
               geocoder.addressSearch(data.address, function(results,
                     status) {
                  // 정상적으로 검색이 완료됐으면
                  if (status === daum.maps.services.Status.OK) {

                     var result = results[0]; //첫번째 결과의 값을 활용

                     // 해당 주소에 대한 좌표를 받아서
                     var coords = new daum.maps.LatLng(result.y, result.x);
                     // 지도를 보여준다.
                     mapContainer.style.display = "block";
                     map.relayout();
                     // 지도 중심을 변경한다.
                     map.setCenter(coords);
                     // 마커를 결과값으로 받은 위치로 옮긴다.
                     marker.setPosition(coords)
                  }
               });
            }
         }).open();
      }

      // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
      searchAddrFromCoords(map.getCenter(), displayCenterInfo);

      // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
      kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
         searchDetailAddrFromCoords(mouseEvent.latLng, function(result,
               status) {
            if (status === kakao.maps.services.Status.OK) {
               var detailAddr = !!result[0].road_address ? '<div>도로명주소 : '
                     + result[0].road_address.address_name + '</div>'
                     : '';
               detailAddr += '<div>지번 주소 : '
                     + result[0].address.address_name + '</div>';

               var content = '<div class="bAddr">'
                     + '<span class="title">법정동 주소정보</span>'
                     + detailAddr + '</div>';

               // 마커를 클릭한 위치에 표시합니다 
               marker.setPosition(mouseEvent.latLng);
               marker.setMap(map);

               // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
               $('#sample5_address').val(result[0].address.address_name);
               infowindow.setContent(content);
               infowindow.open(map, marker);
               
            }
         });
      });

      // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
      kakao.maps.event.addListener(map, 'idle', function() {
         searchAddrFromCoords(map.getCenter(), displayCenterInfo);
      });

      function searchAddrFromCoords(coords, callback) {
         // 좌표로 행정동 주소 정보를 요청합니다
         geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),
               callback);
      }

      function searchDetailAddrFromCoords(coords, callback) {
         // 좌표로 법정동 상세 주소 정보를 요청합니다
         geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
      }

      // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
      function displayCenterInfo(result, status) {
         if (status === kakao.maps.services.Status.OK) {
            var infoDiv = document.getElementById('centerAddr');

            for (var i = 0; i < result.length; i++) {
               // 행정동의 region_type 값은 'H' 이므로
               if (result[i].region_type === 'H') {
                  infoDiv.innerHTML = result[i].address_name;
                  break;
               }
            }
         }
      }
      
      //이미지 등록, 썸네일 미리보기
      $('#dog_img').change(handleFileSelect);
         
       function handleFileSelect(event) {
          var input = this;
             if(input.files.length>1){
                alert('한 장의 사진을 올려주세요.');
                return false;
             }
              if(input.files.length==1){
                 var reader = new FileReader();
                 this.enabled = false
                 reader.onload = (function (e) {
                       console.log(e)
                      $("#preview").empty();
                     $("#preview").html(['<img style=" width:100%; height:50%;" class="thumb"  src="', e.target.result, '" title="', escape(e.name), '"/>'].join('')) 
                  $('.file-edit-icon').html(["<button type='button' class='delBtn cvv'>삭제</button>"]);
              });
              reader.readAsDataURL(input.files[0]); 
              }  
      }

      //이미지 삭제
      $('.file-edit-icon').on('click', '.delBtn', function () {
          $("#preview").empty()
          $(".file-edit-icon").empty()
          $("#dogImg").val("");
      });

      
         //중성화 값 주기
        $('#neutering').click(function() {
           if ($(this).is(":checked")) {
              $('#neutering').val('true');
           }else{
              $('#neutering').val('false');
           }
        })
        
        
      
       //수정날짜
        $('#datepicker').val();  
        
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
         
         //오늘 날짜 이전만 선택 가능하게 구현.
         function noBefore(date){
            if(date>new Date()){
               return  false;
            } return true;
         }
           
        
       
         ;(function($){
          $.fn.datepicker.dates['kr'] = {
             days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"],
             daysShort: ["일", "월", "화", "수", "목", "금", "토", "일"],
             daysMin: ["일", "월", "화", "수", "목", "금", "토", "일"],
             months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
             monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
          };
       }(jQuery));  




      
   </script>


</body>
</html>