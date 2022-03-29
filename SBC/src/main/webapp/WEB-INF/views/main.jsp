<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--@ taglib prefix="form" uri="http://www.springframework.org/tags/form"--%>
<!-- 절대 경로 지정해주기.  -->
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">
<title>SBC MAIN</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="${root }css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Custom styles for this template -->
<link href="${root }css/style.css" rel="stylesheet">

<!-- header -->
<c:import url='/WEB-INF/views/include/header_menu2.jsp' />

<style>

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

                            html1 += "<div class='modal fade ' id='"+ modalId +"'tabindex='-1' role='dialog' aria-labelledby='"+labelledby+"'><div class='modal-dialog' role='document'>"
                                  + "<div class='modal-content justify-content-center'><div class='modal-header'><button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                                  + "<h4 class='modal-title' id='"+labelledby+"'>"
                                  + "<img src='${root}img/logo_sbc.jpg'/>"
                                  + "</h4></div><div class='modal-body'>"
                                  + "<img src='"+dogInfo.popfile+"' class='img-responsive-1'/>"
                                  + "<div class='modal-works'><span>"
                                  + dogInfo.kindCd
                                  + "</span><span>"+dogInfo.processState+"</span><span>"+dogInfo.age+"살</span><span>"+dogInfo.processState+"</span><span>"+dogInfo.weight+"kg</span><span>"+key+"kg</span></div><div class='text-left'><p>"
                                  + dogInfo.careNm
                                  + "</p><p>공고번호: "+ dogInfo.noticeNo+"</p><p>공고기간: "+dogInfo.noticeSdt+" ~ "+dogInfo.noticeEdt +"</p><p>발견장소: "+dogInfo.happenPlace+"</p><p>특이사항 :"+dogInfo.specialMark+"</p><p>보호센터 : "+dogInfo.careNm+"</p><p>"+dogInfo.careTel+"</p><p>담당부서 : "+dogInfo.orgNm+"</p><p>"+dogInfo.officetel+"</p></div> <div class='modal-footer'><button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>"
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

</script>


</head>

<body id="page-top">

	<!-- 여기서부터 진짜 body -->
	<section id="portfolio">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="section-title">
						<h2>WELCOME to SBC</h2>
						<p>지금 막 구조된 아이들입니다. 따뜻한 손길을 내밀어주세요 ♥</p>
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

	<section id="team">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="section-title">
						<h2>Our Team</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- team member item -->
				<div class="col-md-4">
					<div class="team-item">
						<div class="team-image">
							<img src="${root }img/main/author-2.jpg" class="img-responsive"
								alt="author">
						</div>
						<div class="team-text">
							<h3>Hyangwon Lee</h3>
							<div class="team-position">CEO & Web Design</div>
							<p>Mida sit una namet, cons uectetur adipiscing adon elit.
								Aliquam vitae barasa droma.</p>
						</div>
					</div>
				</div>
				<!-- end team member item -->
				<!-- team member item -->
				<div class="col-md-4">
					<div class="team-item">
						<div class="team-image">
							<img src="${root }img/main/author-6.jpg" class="img-responsive"
								alt="author">
						</div>
						<div class="team-text">
							<h3>KyungChul Lee</h3>
							<div class="team-position">Photography</div>
							<p>Worsa dona namet, cons uectetur dipiscing adon elit.
								Aliquam vitae fringilla unda mir.</p>
						</div>
					</div>
				</div>
				<!-- end team member item -->
				<!-- team member item -->
				<div class="col-md-4">
					<div class="team-item">
						<div class="team-image">
							<img src="${root }img/main/author-4.jpg" class="img-responsive"
								alt="author">
						</div>
						<div class="team-text">
							<h3>Minjoo Kim</h3>
							<div class="team-position">Marketing</div>
							<p>Dolor sit don namet, cons uectetur beriscing adon elit.
								Aliquam vitae fringilla unda.</p>
						</div>
					</div>
				</div>
				<!-- end team member item -->
				<div class="col-md-4">
					<div class="team-item">
						<div class="team-image">
							<img src="${root }img/main/author-4.jpg" class="img-responsive"
								alt="author">
						</div>
						<div class="team-text">
							<h3>DongHyun Kim</h3>
							<div class="team-position">Marketing</div>
							<p>Dolor sit don namet, cons uectetur beriscing adon elit.
								Aliquam vitae fringilla unda.</p>
						</div>
					</div>
				</div>
				<!-- end team member item -->
				<div class="col-md-4">
					<div class="team-item">
						<div class="team-image">
							<img src="${root }img/main/author-4.jpg" class="img-responsive"
								alt="author">
						</div>
						<div class="team-text">
							<h3>SeungE Kim</h3>
							<div class="team-position">Marketing</div>
							<p>Dolor sit don namet, cons uectetur beriscing adon elit.
								Aliquam vitae fringilla unda.</p>
						</div>
					</div>
				</div>
				<!-- end team member item -->
				<div class="col-md-4">
					<div class="team-item">
						<div class="team-image">
							<img src="${root }img/main/author-4.jpg" class="img-responsive"
								alt="author" style="margin: auto;">
						</div>
						<div class="team-text">
							<h3>Yujin Jeong</h3>
							<div class="team-position">Marketing</div>
							<p>Dolor sit don namet, cons uectetur beriscing adon elit.
								Aliquam vitae fringilla unda.</p>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>

	<p id="back-top">
		<a href="#top"><i class="fa fa-angle-up"></i></a>
	</p>

	<!-- footer  -->
	<c:import url='/WEB-INF/views/include/footer_menu2.jsp' />
	
	<div id="modalDiv"></div>

	<!-- Bootstrap core JavaScript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="${root }js/bootstrap.min.js"></script>
	<script src="${root }js/SmoothScroll.js"></script>
	<script src="${root }js/theme-scripts.js"></script>

</body>
</html>