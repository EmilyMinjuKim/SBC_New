<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">
<title>유기동물 조회</title>
<!-- Bootstrap core CSS -->
<link href="${root }css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Custom styles for this template -->
<link href="${root }css/style.css" rel="stylesheet">

<!-- 달력  -->
<!-- <link rel="stylesheet" href="/css/jquery-ui.min.css">-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">

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

.team-item {
   position: relative;
   display: inline-block;
}

.card {
   position: relative;
   display: -ms-flexbox;
   display: flex;
   -ms-flex-direction: column;
   flex-direction: column;
   min-width: 0;
   word-wrap: break-word;
   background-color: #fff;
   background-clip: border-box;
   border: 1px solid rgba(0, 0, 0, .125);
   border-radius: .25rem;
}

.card1 {
   position: relative;
   display: -ms-flexbox;
   -ms-flex-direction: column;
   flex-direction: column;
   min-width: 0;
   word-wrap: break-word;
   background-color: #fff;
   background-clip: border-box;
   border: 1px solid rgba(0, 0, 0, .125);
   border-radius: .25rem;
}

.card2 {
   position: relative;
   display: -ms-flexbox;
   -ms-flex-direction: column;
   flex-direction: column;
   min-width: 0;
   word-wrap: break-word;
   background-clip: border-box;
   border: 3px solid rgba(255, 248, 132, .80);
   border-radius: 5px;
   background: #FCFCF9;
}

.shadow {
   box-shadow: 0 .5rem 3rem rgba(255, 240, 174, .80) !important;
}

.img-responsive {
   width: 100%;
   height: 250px;
   max-height: 80%;
}

.img-responsive-1 {
   position: relative;
   width: 350px;
   height: 350px;
}

.h3 {
   text-align: center;
   font-size: 30px;
   font-weight: 500;
}

.size {
   position: relative;
   height: 500px;
   margin-top: 5%;
   margin-bottom: 5%;
   margin-left: -2.5%;
   margin-right: -2.5%;
   background: black;
}

.row {
   margin-right: -41%;
   margin-left: -15%;
}

.center {
   position: relative;
   text-align: center;
   align-content: center;
   -ms-flex-pack: center!important;
   justify-content: center!important;
   
}

/*달력  */
body {
   color: #000;
   overflow-x: hidden;
   height: 100%;
   background-color: white !important;
   background-repeat: no-repeat
}

.container {
   padding-top: 120px;
   padding-bottom: 120px
}

input {
   padding: 10px 15px !important;
   border: 1px solid lightgrey !important;
   border-radius: 10px;
   box-sizing: border-box;
   background-color: #fff !important;
   color: #2C3E50;
   font-size: 14px;
   letter-spacing: 1px;
   position: relative
}

input:focus {
   -moz-box-shadow: none !important;
   -webkit-box-shadow: none !important;
   box-shadow: none !important;
   border: 1px solid #512DA8;
   outline-width: 0
}

::placeholder {
   color: #BDBDBD;
   opacity: 1
}

:-ms-input-placeholder {
   color: #BDBDBD
}

::-ms-input-placeholder {
   color: #BDBDBD
}

button:focus {
   -moz-box-shadow: none !important;
   -webkit-box-shadow: none !important;
   box-shadow: none !important;
   outline-width: 0
}

.datepicker {
   background-color: #fff;
   border: none;
   border-radius: 0 !important
}

.datepicker-dropdown {
   top: 0;
   left: 0
}

.datepicker table tr td.today, span.focused {
   border-radius: 50% !important;
   background-image: linear-gradient(#FFF3E0, #FFE0B2)
}

.datepicker table tr td.today.range {
   background-image: linear-gradient(#eeeeee, #eeeeee) !important;
   border-radius: 0 !important
}

thead tr:nth-child(3) th {
   text-align: center;
   font-weight: bold !important;
   padding-top: 10px;
   padding-bottom: 10px
}

.dow, .old-day, .day, .new-day {
   width: 40px !important;
   height: 40px !important;
   border-radius: 0px !important
}

.old-day:hover, .day:hover, .new-day:hover, .month:hover, .year:hover,
   .decade:hover, .century:hover {
   border-radius: 50% !important;
   background-color: #eee
}

.active {
   border-radius: 50% !important;
   background-image: linear-gradient(#90CAF9, #64B5F6) !important;
   color: #fff !important
}

.range-start, .range-end {
   border-radius: 50% !important;
   background-image: linear-gradient(#FFA726, #FFA726) !important
}

.prev, .next, .datepicker-switch {
   border-radius: 0 !important;
   padding: 10px 10px 10px 10px !important;
   text-transform: uppercase;
   font-size: 14px;
   opacity: 0.8
}

.prev:hover, .next:hover, .datepicker-switch:hover {
   background-color: inherit !important;
   opacity: 1
}

.btn-black {
   background-color: #37474F !important;
   color: #fff !important;
   width: 100%
}

.btn-black:hover {
   color: #fff !important;
   background-color: #000 !important
}

.small {
   position: relative;
   margin-left: 6%;
   width: 30%;
   height:10px;
}


.md {
   text-align: center;
   left: 17.2%;
   width: 300px;
   height: 100px;
   border:none;
}

.md1 {
   border:none;
   text-align: center;
   left: 8%;
   width: 300px;
   height: 100px;
}

.cl {
   border: 3px solid rgba(255, 248, 132, .80);
   background: black;
   color: #00ff0000;
   border-radius: 5px;
}

.mr {
   position: relative;
   margin-top: -10%;
   height: 100%;
   margin-bottom: 4%;
}

.br {
   margin-top: 5%;
}

.btnr {
   display: -ms-flexbox;
   display: flex;
   padding-left: 0;
   list-style: none;
   border-radius: .25rem;
}

.btnc {
   position: relative;
   text-align:center;
   -ms-flex-pack: center!important;
   justify-content: center!important;
}

.aa{
	background:orange;
	font-size:20px;
}
.button:hover{
	background: yellow;
}

.aa3:hover {
   background: white;
   color: white;
   font-size: 17px;
   font-weight: 900;
   position: relative;
    margin-left: 4%;
    width: 20%;
    height: 5%;
    border: 2px solid white;
} 

.aa3 {
   background: #FDB85E;
   color: white;
   font-size: 18px;
   font-weight: 900;
   position: relative;
    margin-left: 4%;
    width: 20%;
    height: 5%;
    border: 2px solid #FDB85E;
}

.small span{
	font-family: none !important;
}

.small i{
	font-family: none !important;
}

.fam{
	font-family: none !important;

}
.textl{
position:relative;
left:20%;
}
.textl th{
font-size:22px;
font-weight: 600;
}

.textl td{
font-size:20px;
font-weight: 500;
}

</style>




<script src="http://madalla.kr/js/jquery-1.8.3.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
   crossorigin="anonymous"></script>

<script type="text/javascript">
   //주소값 컨트롤러 넘기기 >> 실패. 자바스크립트 보안 에러 뜸.
      $(document).ready(function() {
      
      var currentPosition = parseInt($(".quickmenu").css("top"));
      $(window).scroll(function() {
         var position = $(window).scrollTop();
         $(".quickmenu").stop().animate({
            "top" : position + currentPosition + "px"
         }, 1000);
      });
      
      

             //검색 종료 금일 날짜
             var nowDate = new Date();
             var nYear = nowDate.getFullYear(); //오늘 년도
             var nMonth = nowDate.getMonth()+1; //월은 0부터 시작.
             var nDate = nowDate.getDate(); //오늘 일
             
             if(nMonth<10)nMonth="0"+nMonth;
             if(nDate<10)nDate="0"+nDate;
             var nDt = "" + nYear + "-" + nMonth + "-" + nDate ;
             console.log(nDt)
                 //검색 시작 날짜 한달 전 세팅
                 nowDate.setMonth(nowDate.getMonth()-1);
                 var sYear = nowDate.getFullYear();      
                 var sMonth = nowDate.getMonth()+1 ;      
                 var sDate = nowDate.getDate();           
                 if(sMonth<10) sMonth = '0'+ sMonth;
                 if(sDate<10) sDate = '0'+ sDate;
                 var setDt = "" + sYear + "-"+ sMonth + "-"+ sDate ;
                 

                  $('#bgnde').val(setDt);
                  $('#endde').val(nDt);

                  /*  $('.input-daterange').val(nDt);   */
                  $(function() {
                     $('.input-group.date').datepicker({

                        showMonthAfterYear : true,

                        calendarWeeks : false,

                        todayHighlight : true,

                        autoclose : true,

                        format : "yyyy-mm-dd",

                        language : "kr"

                     });

                  });

                   ;(function($){
                      $.fn.datepicker.dates['kr'] = {
                         days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"],
                         daysShort: ["일", "월", "화", "수", "목", "금", "토", "일"],
                         daysMin: ["일", "월", "화", "수", "목", "금", "토", "일"],
                         months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                         monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
                      };
                   }(jQuery)); 

                  //도시 선택 이벤트
                  $(document).on("change","select[id='upr_cd']",function() {

                                 var name = document.getElementById('upr_cd'); //도시 선택
                                 var listIndex = name.selectedIndex; //셀렉트의 인덱스

                                 // console.log("listIndex?"+listIndex);
                                 if (listIndex == 0 || listIndex == 8) {
                                    optionHtml = "<option value=''>전체</option>";
                                    $("#org_cd").html(optionHtml);
                                    return false; //전체 선택, 세종시의 경우 옵션 값이 없음.
                                 }

                                 //시군
                                 $("option:selected", this).each(function() {
                                                var org_cd = $("#org_cd");
                                                var thisValue = $(this).val();

                                                var optionHtml = "";
                                                org_cd.find("option").remove();
                                                optionHtml = "<option value=''>전체</option>";

                                                if (thisValue != "") {
                                                   $.ajax({async : false,
                                                            type : "get",
                                                            url : 'area1/' + listIndex,
                                                            dataType : "json",
                                                            success : function(dataObj) {
                                                               if (dataObj == null || dataObj == "") {
                                                                  alert("값이 없습니다. 재선택 바랍니다.");
                                                               } else {
                                                                  optionHtml1 = "";
                                                                  var keys = dataObj.keys();
                                                                  for ( var i in dataObj) {
                                                                     optionHtml1 += "<option value='" + dataObj[i].cityCode + "'>"+ dataObj[i].cityName+ "</option>";
                                                                  }

                                                               }
                                                               optionHtml = optionHtml1;
                                                            },

                                                            "error" : function( x,o,e) {

                                                               alert(x.status + ":" + o + ":" + e);
                                                            }

                                                         });
                                                }
                                                org_cd.append(optionHtml);
                                             }); //function 끝

                              })

                  /*    $.ajaxSetup({
                        contentType: 'application/x-www-form-urlencoded; charset=utf-8', //ajax 한글 깨짐 방지. 
                        success:function(result){
                           alert(result)
                        },
                        error:function(jqXHR){
                           alert("jqXHR status code:"+jqXHR.status+" message:"+jqXHR.responseText);
                        }
                     }); //$.ajaxSetup 끝 */

                  //조회 날짜 체크
                  function ckDate(date) {
                     var yy = date.substring(0, 4)
                     var mn = date.substring(5, 7)
                     var dt = date.substring(8, 10)
                     date = yy + mn + dt
                     return date;
                  }

                  //paging 버튼 이벤트
                  //동적으로 생성 된 페이지에서는  $(document).on("click", "선택자", function(){}); 로 구현해야함.
                  $(document).on("click", ".paging", function() {
                     var value = $(this).val();
                     $("input[name=pageNo]").attr('value', value);
                     document.getElementById('searchBtn').click();
                  });

                  $(document).on("click", ".movePage", function() {
                     var value = $(this).val();
                     console.log("nextBtn?" + value)
                     $("input[name=pageNo]").attr('value', value);
                     document.getElementById('searchBtn').click();
                  });

                  //상태 선택
                  $('input[type="radio"]').click(function() {
                     var value = $(this).val();
                     if ($(this).is(":checked")) {
                        $("input[name=state]").attr('value', value);
                        $("input[name=pageNo]").attr('value', 1);
                     }
                     $('#searchBtn').trigger('click');
                  })

                  
                  
                  
                  
                  
                  
                  
                      
                  //검색 api ajax
                  $("#searchBtn")
                        .click(
                              function() {
                                 var startDate = $("#bgnde").val();
                                 var endDate = $("#endde").val();

                                 if (startDate == ""
                                       || endDate == "") {
                                    alert("날짜를 선택해주세요.");
                                    return false;
                                 }

                                 startDate = ckDate(startDate);
                                 endDate = ckDate(endDate);

                                 if (startDate > endDate) {
                                    alert("검색 시작일자가 또는 검색 종료일자가 올바르지 않습니다.\n(시작일자보다 종료일자가 빠름)");
                                    return false;
                                 }

                                 $.ajax({
                                          "url" : "searchDog_pro",
                                          "type" : "get",
                                          "data" : $("#searchForm").serialize(),
                                          "dataType" : "json",
                                          "async" : "false",
                                          "success" : function(resultMap) {

                                               if(resultMap.Result=='0001'){
                                                   alert("해당 날짜에는 등록된 데이터가 없습니다.")
                                                     $('#dog_info_list1').empty();
                                                     $('#dog_info_list2').empty();
                                                     $('#modalDiv').empty();
                                                   var html = "<div class='row  text-center'><h3>등록된 게시물이 없습니다.</h3></div>";
                                                 
                                                   $('#dog_info_list1').append(html);
                                                   $('#total').text("총 0 건");
                                                       return false;
                                                       
                                                 } else {

                                                console.log("totalPage: "+ resultMap.totalPage);
                                                console.log("beginPage: "+ resultMap.beginPage);
                                                console.log("endPage: "+ resultMap.endPage);
                                                console.log("showPrev: "+ resultMap.showPrev);
                                                console.log("showNext: "+ resultMap.showNext);

                                                //페이징 처리
                                                if (resultMap.pageNo == resultMap.beginPage || resultMap.pageNo == resultMap.endPage) {

                                                   $('#paging-var').find("button").remove();

                                                   if (resultMap.showPrev) {
                                                      $('#paging-var').append("<button type='button' style='background:orange; font-size:18px; font-weight:600;' class='movePage btn btn-primary' id='prevBtn'> << </button>");
                                                      $('#paging-var').append("<button type='button' style='background:orange; font-size:18px; font-weight:600;' class='movePage btn btn-primary' id='prevBtn' value='"
                                                      + (resultMap.beginPage - 1)+ "'> < </button>");
                                                   }

                                                   for (var i = resultMap.beginPage; i <= resultMap.endPage; i++) {

                                                      $('#paging-var').append("<button type='button aa' style='background:orange; font-size:18px; font-weight:600;' class='paging btn btn-primary' value='"+i+"'>"
                                                      + i + "</button>");
                                                   }

                                                   if (resultMap.showNext) {
                                                      $('#paging-var').append("<button type='button aa' style='background:orange; font-size:18px; font-weight:600;' class='movePage btn btn-primary' id='nextBtn' value='"
                                                      + (resultMap.endPage + 1)+ "'> > </button>");
                                                      $('#paging-var').append("<button type='button aa' style='background:orange; font-size:18px; font-weight:600;' class='movePage btn btn-primary' id='nextBtn' value='"
                                                      +resultMap.totalPage+"'> >> </button>");
                                                   }
                                                }

                                                //리스트 뽑아오기
                                                $('#dog_info_list1').empty();
                                                $('#dog_info_list2').empty();

                                                $('#modalDiv').empty();
                                                var modalId = '';
                                                var labelledby = '';
                                                $.each(resultMap.data,
                                                function(key,dogInfo) {
                                                               var html = '';
                                                               var html1 = '';
                                                               modalId = "Modal-" + (key + 1);
                                                               labelledby = "Modal-label-" + (key + 1);
                                                               //console .log(isNan())

                                                               html += "<div class='col-lg-2 col-md-5'><div class='team-item size cl ' style='background:#FFFACD;'><div class='ot-portfolio-item'><figure class='effect-bubba'>"
                                                                     + "<img src='"+dogInfo.popfile+"' alt=img01 class='img-responsive'/><figcaption><h2>"
                                                                     + dogInfo.kindCd
                                                                     + "</h2><p>"
                                                                     + dogInfo.careNm
                                                                     + "</p>"
                                                                     + "<a href='#"+modalId+"' data-toggle='modal' data-target='#"+modalId+"'>"
                                                                     + dogInfo.sexCd
                                                                     + "</a></figcaption></figure></div><div class='team-text'>"
                                                                     + "<h3  style='color:orange; font-weight:600; width:30%; padding-top:2px; padding:5px; border-radius:10px; position:relative; left:35%;'>"
                                                                     + dogInfo.processState
                                                                     + "</h3><p style='font-size:18px; color:'>"
                                                                     + dogInfo.careAddr
                                                                     + "</p><div class='team-position' style='font-size:18px; font-weight:600;'>"
                                                                     + dogInfo.noticeSdt
                                                                     + "</div></div></div></div>";

                                                               if (key < 5) {
                                                                  $('#dog_info_list1').append(html);
                                                               } else {
                                                                  $('#dog_info_list2').append(html);
                                                               }

                                                               html1 += "<div class='modal fade' id='"+ modalId +"'tabindex='-1' role='dialog' aria-labelledby='"+labelledby+"'><div class='modal-dialog' role='document'>"
                                                                     + "<div class='modal-content center'><div class='modal-header'><button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                                                                     + "<h4 class='modal-title' id='"+labelledby+"'>"
                                                                     + "<span style='background:#f5bf23; color:green; padding:3px; font-weight:bold; font-size:20pt;border-radius:10px;'>"+dogInfo.processState+"<img src='${root}img/board/proc.png' style='max-width: 5%;  max-height: 5%;'/></span>"
                                                                     + "</h4></div><div class='modal-body'>"
                                                                     + "<img style='border-radius:10px;' src='"+dogInfo.popfile+"' alt=img01 class='img-responsive-1'/>"
                                                                     + "<div class='modal-works'style='font-size:15px;'><span style='color:blue; font-weight:bold; border-radius:10px;'>"+ dogInfo.kindCd
                                                                     + "</span><span style='color:blue; font-weight:bold; border-radius:10px;'>"+dogInfo.age+"</span><span style='color:blue; font-weight:bold; border-radius:10px;'>"+dogInfo.weight+"</span><span style='color:blue; font-weight:bold; border-radius:10px;'>성별: "+dogInfo.sexCd+"</span></div><table class='modal-body textl'><tr><th>공고번호: </th><td>"+ dogInfo.noticeNo+"</td></tr><tr><th>공고기간: </th><td>"+dogInfo.noticeSdt+" ~ "+dogInfo.noticeEdt +"</td></tr><tr><th>발견장소: </th><td>"+dogInfo.happenPlace+"</td></tr><tr><th>특이사항 : </th><td>"+dogInfo.specialMark+"</td></tr><tr><th>보호센터 : </th><td>"+dogInfo.careNm+"("+dogInfo.careTel+")</td></tr><tr><th>담당부서 : </th><td>"+dogInfo.orgNm+"("+dogInfo.officetel+")</td></tr></table> <div class='modal-footer'>"
                                                                     
                                                                     
                                                                     +"<button style='width:20%; font-size:18px;' class='btn btn-default likebtn' value="+dogInfo.desertionNo+" data-dismiss='modal'>관심추가<img src='${root}img/board/redheart.gif' style='max-width: 30%;  max-height: 30%;'/></span></button><button style='font-size:18px;' type='button' class='btn btn-default' data-dismiss='modal'>Close</button>"
                                                                     +"</div></div></div></div><i id='idxi'>"+key+"</i>";
                                                                     $('#modalDiv').append(html1);

                                                            })
                                                         $('#total').text("총 " + resultMap.totalCount + " 건");

                                                      //모달창 index 받아가기
                                                       $(".likebtn").on("click",function(){
                                                          var desertionNo = $(this).val();
                                                         addLikeFunc(desertionNo);
                                                          //$('#"hiddenLike"').attr("value", desertionNo) 
                                                      }); 
                                                 }   
                                          },

                                          "error" : function(x, o, e) {
                                             alert(x.status + ":" + o + ":" + e);
                                          }
                                       }); //ajax 끝

                              }); //searchBtn 끝

                  document.getElementById('searchBtn').click(); //첫 화면 로드 시키기
 
                  
                  //좋아요 등록
                  function addLikeFunc(desertionNo) {
                      $.ajax({
                      "url" : "${root}board/addAnimal/"+desertionNo,
                      "type" : "get",
                      "dataType" : "text",
                      "async" : "false",
                      "success" : function(result) {
                               console.log("결과값?"+result)
                           if(result.trim()=="true"){
                              alert("관심동물 등록!!")
                           }else{
                              alert("관심동물 삭제!!")
                           }
                           },
                     "error" : function(x, o, e) {
                          alert(x.status + ":" + o + ":" + e);
                       }
                  
                     })
                 }

                  
               });
</script>




<c:import url='/WEB-INF/views/include/header_menu6.jsp' />

</head>
<body>
   
      <form:form modelAttribute="searchDogDTO" id="searchForm" method="get">
         <!-- <input type="hidden" id="hiddenLike" /> -->
         <input type="hidden" id="pageNo" name="pageNo" value="1" />
         <input type="hidden" id="state" name="state" value="" />
         <div class="card2 btnc" style="position:relative; left:30%; width: 40%;">
         
            <h3 class="h3">유기견 조회</h3>
            <br />
            <div class="input-group col-md-6" style="font-size:16px; display:flex; margin: 0px 0px 0px 23%; width: 57.5%;">
                <div style="margin-right: 12.5%;">
                  <form:label path="upkind">종 선택</form:label></div>
                 <div style="margin-right: 12.5%;">
                  <form:label path="upkind"> 
                     <form:radiobutton path="upkind" label="전체" id="all_code" value="" checked="true" />
                  </form:label></div>
                 <div style="margin-right: 12.5%;">
                  <form:label path="upkind">
                     <form:radiobutton path="upkind" label="개" id="dog_code" value="417000" />
                  </form:label></div> 
                 <div style="margin-right: 12.5%;"> 
                  <form:label path="upkind">
                     <form:radiobutton path="upkind" label="고양이" id="cat_code" value="422400" />
                  </form:label></div> 
                 <div> 
                  <form:label path="upkind">
                     <form:radiobutton path="upkind" label="기타" id="etc_code" value="429900" />
                  </form:label></div> 
               
         </div>
			<div
				style="position: relative; display: flex; right: 8%; margin-left: 30%; font-size: 16px;">
				<h4 style="font-size: 16px; position: relative; left: 9px; font-weight: 600;">날짜&nbsp; </h4>
				<div class="input-group date input-daterange small fam">
					<form:input type="text" placeholder="시작 날짜" class="form-control fam" id="bgnde" name="bgnDate" path="bgnDate" />
					<span class="input-group-addon fam"><img src="${root }img/board/cal.png"></span>
				</div>
				<h1 style="position: relative; left: 19px; font-size: 30px; font-weight: 400; top: -19px;">~</h1>
				<div class="input-group date input-daterange small fam">
					<form:input type="text" class="form-control" id="endde" path="endDate" />
					<span class="input-group-addon"><img src="${root }img/board/cal.png"></span>
				</div>
			</div>

			<div class="row">
               <div class="col-sm-6 md" style="font-size: 16px; height: 30px; margin: -15px 0px 0px -32px;">
                  <label>시도 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                  <div class="col-sm-6 md" style="font-size: 16px; height: 30px; margin: -28px 0px 0px 42px;">
                  <form:select path="areaCode" id="upr_cd" style="width:158px;">
                     <form:options items="${city_list }" itemLabel="name" itemValue="code" />
                  </form:select></div>
               </div>
               <div class="col-sm-6 md1" style="font-size: 16px; height: 30px; margin: -15px 0px 0px 98px;">
                  <label>&nbsp;시군구 </label> 
                  <select name="cityCode" id="org_cd" style="width: 158px;">
                     <option value="">전체선택</option>
                  </select> <br />
               </div>
            </div>
            <div class="row" style="font-size:16px; margin: 5px 0px 0px 23%; display: flex;">
               <div style="margin-right: 12.5%;">
                  <label for="searchState">상태</label>
               </div>   
               <div style="margin-right: 12.5%;">
                  <label><input type="radio" class='searchState' name="searchState" value="">전체선택</label> 
               </div>   
               <div style="margin-right: 12.5%;">   
                  <label><input type="radio" class='searchState' name="searchState" id="notice" value="notice">공고중</label> 
               </div> 
               <div style="margin-right: 12.5%;">  
                  <label><input type="radio" class='searchState' name="searchState" id="protect" value="protect">보호중</label>
               </div>
               </div>
            <a style="margin: 1.2% 0px 1% 0px;" class="btn btn-primary searchBtn aa3" type="button" id="searchBtn" >유기견 조회</a>
               </div>
      
      </form:form>
   <div class="text-center" style="margin: 10px 0px 0px 0px; font-size: 16px;">
      <p style="font-size: 15px;">공고중인 동물 소유자는 <span style="color: red;">"자세히 보기" </span>를 참고하시어
      해당 시군구 및 <span style="color: blue;">동물보호센터</span> 또는 <span style="color: blue;">동물보호상담센터</span> 
      <span style="color: red;"><a href='tel:1577-0954' style="vertical-align: top;">1577-0954</a> </span> 로 문의하시기 바랍니다.
      <p></p>
      동물보호센터 및 동물병원 근무시간은 <span class="red regular" style="color: red; vertical-align: top;">
      09:00 ~ 18:00</span> 이므로 문의전화는 근무시간에만 가능합니다. <br />
      <h4 class="center" style="margin-top: 1.5%; padding-top: 10px; width: 77.5%; margin-left:11.45%; border-radius:5px; background: #FFD776;"><label id="total">총 0 건</label></h4>
   </div>
   <section id="team">
         <div class="container" style="position:relative; top:-150px;" >
            <div class="row" id="dog_info_list1"></div>
            <div class="row" id="dog_info_list2"></div>
            <div>
               <div class="br" >
                  <div class="div-parent btn-toolbar col-lg-12 btnr btnc" role="toolbar" aria-label="Toolbar with button groups"></div>
                  <div class="div-parent btn-toolbar col-lg-12 btnr btnc" role="group" aria-label="First group" id="paging-var"></div>
               </div>
            </div>
         </div>
      </section>
       <c:import url='/WEB-INF/views/include/footer_menu.jsp' />
      <!-- 위로가기 버튼  -->
      <p id="back-top">
         <a href="#top"><i class="fa fa-angle-up"></i></a>
      </p>
      <div id="modalDiv"></div>

      <!-- Bootstrap core JavaScript
         ================================================== -->
      <!-- Placed at the end of the document so the pages load faster -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
      <script src="${root }js/bootstrap.min.js"></script>
      <!--   <script src="../js/SmoothScroll.js"></script> -->
      <script src="${root }js/theme-scripts.js"></script>

      <!-- 달력  -->
      <script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
      <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
      <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
      <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
      <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
         
        

</body>
</html>