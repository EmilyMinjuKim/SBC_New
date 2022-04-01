<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 절대 경로 지정해주기.  -->
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>SBC</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Bootstrap core CSS -->
<link href="${root }css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<link href="${root }css/style.css" rel="stylesheet">

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
   
   

.img-r {
background-size: cover;
width: 100%;
height: 400px;
} 

.img-responsive {
   width: 100%;
   height: 300px;
}

.img-responsive-1 {
   position: relative;
   width: 350px;
   height: 350px;
}

.justify-content-center {
	position:relative;
	text-align: center;
   -ms-flex-pack: center!important;
   justify-content: center!important
}

footer {
	background: #FFB6C1;
}

#header{
	background: #FFB6C1;
}

/* 반짝이는 효과 */
.blinking{ -webkit-animation:blink 1.5s ease-in-out infinite alternate; -moz-animation:blink 1.5s ease-in-out infinite alternate; animation:blink 1.5s ease-in-out infinite alternate; } @-webkit-keyframes blink{ 0% {opacity:0;} 100% {opacity:1;} } @-moz-keyframes blink{ 0% {opacity:0;} 100% {opacity:1;} } @keyframes blink{ 0% {opacity:0;} 100% {opacity:1;} }

/* 글자 통통이는 효과 */
h1 span {
  position: relative;
  top: 20px;
  display: inline-block;
  animation: bounce .3s ease infinite alternate;
  font-family: 'Titan One', cursive;
  font-size: 80px;
  color: #FFF;
  text-shadow: 0 1px 0 #CCC,
               0 2px 0 #CCC,
               0 3px 0 #CCC,
               0 4px 0 #CCC,
               0 5px 0 #CCC,
               0 6px 0 transparent,
               0 7px 0 transparent,
               0 8px 0 transparent,
               0 9px 0 transparent,
               0 10px 10px rgba(0, 0, 0, .4);
}

h1 span:nth-child(2) { animation-delay: .1s; }
h1 span:nth-child(3) { animation-delay: .2s; }
h1 span:nth-child(4) { animation-delay: .3s; }
h1 span:nth-child(5) { animation-delay: .4s; }
h1 span:nth-child(6) { animation-delay: .5s; }
h1 span:nth-child(7) { animation-delay: .6s; }
h1 span:nth-child(8) { animation-delay: .7s; }

@keyframes bounce {
  100% {
    top: -20px;
    text-shadow: 0 1px 0 #CCC,
                 0 2px 0 #CCC,
                 0 3px 0 #CCC,
                 0 4px 0 #CCC,
                 0 5px 0 #CCC,
                 0 6px 0 #CCC,
                 0 7px 0 #CCC,
                 0 8px 0 #CCC,
                 0 9px 0 #CCC,
                 0 50px 25px rgba(0, 0, 0, .2);
  }
}

/* shopping */
	.card{
		border: none;
	}

	.card-img-top {
      cursor: pointer;
	  opacity: 1;
	  display: block;
	  transition: .5s ease;
	  backface-visibility: hidden;
	}
	
	.middle {
	  transition: .5s ease;
	  opacity: 0;
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  -ms-transform: translate(-50%, -50%);
	  text-align: center;
	}
	
	.card:hover .card-img-top {
	  opacity: 0.3;
	}
	
	.card:hover .middle {
	  opacity: 1;
	}
	
	.product_detail {
	  font-size: 16px;
	  width: 250px;
	}
	
	.bfSale{
		text-decoration: line-through;
		font-size: 14px;
		color: #696969;
	}
	.dshadow{
	box-shadow: 0 .5rem 2.5rem rgba(212, 157, 216, .30) !important;
	}
</style>
<script>

$(document).ready(function() {
	
	$.ajax({
        "url" : "searchDog_pro",
        "type" : "get",
        "dataType" : "json",
        "async" : "false",
        "success" : function(resultMap) {
        	
              $('#dog_info_list1').empty();
              
              $('#modalDiv').empty();
              var modalId = '';
              var labelledby = '';
              
              $.each(resultMap.data,
              function(key,dogInfo) {
                            var html = '';
                            var html1 = '';
                            modalId = "Modal-" + (key + 1);
                            labelledby = "Modal-label-" + (key + 1);
							
                            document.getElementById("dog_info_list"+(key+1)).innerHTML = 
                            "<img src='"+dogInfo.popfile+"' class='img-responsive'/><figcaption><h2>"
                            + dogInfo.kindCd
                            + "</h2><p>"
                            + dogInfo.careNm
                            + "</p>"
                            + "<a href='#"+modalId+"' data-toggle='modal' data-target='#"+modalId+"'>"
                            + dogInfo.sexCd
                            + "</a></figcaption>";

                            html1 += "<div class='modal fade' id='"+ modalId +"'tabindex='-1' role='dialog' aria-labelledby='"+labelledby+"'><div class='modal-dialog' role='document'>"
                                  + "<div class='modal-content justify-content-center'><div class='modal-header'><button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                                  + "<h4 class='modal-title' id='"+labelledby+"'>"
                                  + "<img src='${root}img/logo_sbc.jpg'/>"
                                  + "</h4></div><div class='modal-body'>"
                                  + "<img src='"+dogInfo.popfile+"' class='img-responsive-1'/>"
                                  + "<div class='modal-works'style='font-size:15px;'><span>"+ dogInfo.processState+ "</span><span>"+ dogInfo.kindCd+ "</span>"
                                  +"<span>"+dogInfo.age+"살</span><span>"+dogInfo.weight+"</span></div><div class='modal-body text-left' style='font-weight:900;'><p>공고번호: "+ dogInfo.noticeNo+"</p><p>공고기간: "+dogInfo.noticeSdt+" ~ "+dogInfo.noticeEdt +"</p><p>발견장소: "+dogInfo.happenPlace+"</p><p>특이사항 :"+dogInfo.specialMark+"</p><p>보호센터 : "+dogInfo.careNm+"("+dogInfo.careTel+")</p><p>담당부서 : "+dogInfo.orgNm+"("+dogInfo.officetel+")</p></div> <div class='modal-footer'><button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>"
                                  +"<button type='button' class='btn btn-default likebtn' onclick='hello()''>유기동물 조회</button>"
                                  +"</div></div></div></div><i id='idxi'>"+key+"</i></div>";
                           $('#modalDiv').append(html1);

                         }
             );//each	
            	  			 
       	},	//success

        "error" : function(x, o, e) {
           alert(x.status + ":" + o + ":" + e);
        }	//error
     }); //ajax 끝
	
});	//document.ready

function hello() {
	location.href = "${root}/board/searchDog";
}

function formSubmit(type) {
	$("#frm_"+type).submit();
}

</script>


</head>

<body id="page-top">
<!-- header -->
<c:import url='/WEB-INF/views/include/header_menu1.jsp' />

	<section id="header" style="height: 8%">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="section-title">
						<h1>
						  <span>W</span>
						  <span>E</span>
						  <span>L</span>
						  <span>C</span>
						  <span>O</span>
						  <span>M</span>
						  <span>E</span>
						  <span>!</span>
						</h1>
						<br />
						<h3 style="color: #FFF">유기동물 조회 사이트입니다. 따뜻한 가정을 찾아주세요.</h3>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="team">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="section-title">
						<h3 class="blinking">🌷최신글🌷</h3>
               </div>
            </div>
            <!-- team member item -->
            <c:forEach items='${list }' var='dog'>
            <div class="col-md-4">
               <div class="team-item dshadow" style="background: white; border-radius: 10px;">
                  <div class="team-image" style="height: 300px; width: 100%; border-radius: 10px;">
                     <a href="${root }board/read?b_no=${dog.board_num}" >
                        <img style="border-radius: 10px;" src="${root }upload/${dog.dog_img}" class="img-responsive" alt="author">
                     </a>
                  </div>
                  <div class="team-text">
                     <h3 style="border-radius:5px; background:#EBDD1E; color: gray; font-weight:900; margin-left:30%; width:40%; padding: 9px 0px 3px 0px;">${dog.board_category}</h3>
                     <div class="team-position"style="font-weight: 600; font-size: 22px;">${dog.breed}
                        <c:set var="sex" value="${dog.sex}" scope="session"/>
                        <c:choose>
                           <c:when test="${sex=='수컷'||sex==' 수컷'||sex=='수컷 '||sex==' 수컷 '}">
                              <img src="${root}img/board/male.png">
                           </c:when>

                           <c:when test="${sex=='암컷'||sex==' 암컷'||sex=='암컷 '||sex==' 암컷 '}">
                              <img src="${root}img/board/female.png">
                           </c:when>
                           
                           <c:otherwise>
                              <img src="${root}img/board/gender.png">
                           </c:otherwise>
                        </c:choose>
                     </div>
                     <p style="font-size: 20px; font-weight: 600;">${dog.sex}&nbsp;/&nbsp;${dog.color }&nbsp;/&nbsp;age: ${dog.age }&nbsp;/&nbsp;kg: ${dog.weight}</p>
                     <p style="margin-top: -40px; font-size: 20px; font-weight: 600;"><img src="${root }img/board/clock.png" style="max-width: 7%; max-height: 7%;"/>${dog.happen_date}&nbsp;</p>
                     <p style="margin-top: -40px; font-size: 20px; font-weight: 600;"><img src="${root }img/board/place.png" style="max-width: 7%; max-height: 7%;"/>${dog.address1}&nbsp;</p>
                     
                          
                  </div>
					</div>
				</div>
				</c:forEach>

			</div>
		</div>
	</section>

	<hr />
	<!-- 여기서부터 진짜 body -->
	<section id="portfolio">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="section-title">
						<h3 class="blinking"> 🐶유기동물 조회 🐶</h3>
					</div>
				</div>
			</div>
			
			<div class="row row-0-gutter">
				<c:forEach begin="1" end="6" varStatus="vs">
				<!-- start portfolio item -->
				<div class="col-md-4 col-0-gutter">
					<div class="ot-portfolio-item">
						<figure class="effect-bubba">
							<div class="row" id="dog_info_list${vs.index }"></div>
						</figure> 
					</div>
				</div>
				<!-- end portfolio item -->
				</c:forEach>
			
			</div>
		</div>
		<!-- container -->
	</section>

	<hr />
	<section id="team">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="section-title">
						<h3 class="blinking">🎁쇼핑🎁</h3>
					</div>
				</div>
				<!-- team member item -->
				<c:forEach begin="1" end="6" varStatus="vs" var="list" items="${productList }">
				<form id="frm_${vs.index }" action="${root }product/productPage" method="post">
				<input type="hidden" name="product_name" value="${list.product_name }" />
				<div class="col-md-4">
					<div class="card">
						<div class="card-img-top "style="height: 300px; width: 100%">
							<img class='img-responsive card-img-top' src="${root }images/product/${list.product_id}.jpg" onclick="formSubmit(${vs.index })"/>
							<div class="middle">
							    <div class="product_detail">
							    	상품 보러가기! Click!
							    </div>
							</div>
						</div>
						<div class="card-body" style="background: none;">
							<div class="text-center">
								<!-- Product name-->
                                <h3>${list.product_name }</h3>
                                <!-- Product price-->
                                <h4><span style="color: #FF1493">25%</span>&nbsp;&nbsp;<fmt:formatNumber value="${list.price }" pattern="#,###"/>원</h4>
                                <span class="bfSale"><fmt:formatNumber value="${(list.price)*1.25 }" pattern="#,###"/>원</span>
                           	</div>
						</div>
					</div>
				</div>
				</form>
				</c:forEach>
			</div>
		</div>
	</section>

	
<!-- 	<p id="back-top">
		<a href="#top"><i class="fa fa-angle-up"></i></a>
	</p> -->

	<!-- footer  -->
	<c:import url='/WEB-INF/views/include/footer_menu2.jsp' />
	
	<div id="modalDiv"></div>

	<!-- Bootstrap core JavaScript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	
	<script src="${root }js/bootstrap.min.js"></script>
<%-- 	<script src="${root }js/SmoothScroll.js"></script> --%>
	<script src="${root }js/theme-scripts.js"></script>

</body>
</html>