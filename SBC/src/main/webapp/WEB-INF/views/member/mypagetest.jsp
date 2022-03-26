<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 절대 경로 지정해주기.  -->
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동적 마이페이지 뷰</title>
<link rel="stylesheet" href="board.css" type="text/css" />

<style>
	
.nr {
float : left;
} 
.test {
float : right;
}
#h4 {
text-align: center;
text-style: bold;
}

/* aside{
    float: left;
    width: 200px;
    min-height: 250px;

}
article{
    float: right;
    width: 100%;                  //적절한 퍼센트
    margin-left: -215px;           // aside 크기보다 조금더 
    padding-left: 215px;           // 마진만큼 안쪽 여백
    
    box-sizing: border-box;
    
}
 */

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 

<script>
$(document).ready(function(){

	//test
	$('#one a').click(function() {
		$('.content').load("${root}member/Likeanimals");
		return false;
	});
	
	/*
	$('#two a').click(function() {
		$('#content').load("${root}member/mypage");
		return false;
	});
	
	/*
	$('#five a').click(function() {
		$('#content').load("${root}member/modifytest");
		return false;
	});
	*/

	
});
</script>
<!-- header -->
<c:import url='/WEB-INF/views/include/header_menu2.jsp'/>

</head>
<body>

<%-- nav를 왼쪾에 두고 오른쪽에 section 페이지만 바뀌게  --%>
<div class="container" style="margin-top:50px">
<div class="nav-wrapper nr">
	<div class="nav pagewidth np">
	<section>	
			<!-- MENU -->
			<%-- 각자의 경로에 맞게 수정 --%>
			<h4>MyPage</h4>
			<br>
			<article id="one"> <!-- views/Likeanimals.jsp -->
				<a href="${root}member/Likeanimals">관심동물</a> </article>
				<br>
				<hr/>
			<article id="one">
				<a href="${root}member/Likeanimals">관심글</a> </article>
				<br>
				<hr/>
			<article id="three">
				<a href="${root }board/mywrite">내가쓴글</a> </article>
				<br>
				<hr/>
			<article id="four">
				<a href="${root }member/modifytest">내정보수정</a> </article>
				<br>
				<hr/>
			<article id="five">
				<a href="${root }product/orderlist">주문정보</a> </article>
				<br>
				<hr/>
			<!-- END MENU -->
	</section>
	</div>
</div>


<%-- 광고 들어갈 영역 --%>
<!-- <section class="test">

			 <article>
                 <h3>DOG FOOD</h3>
                 <p>광고 이미지 공간</p>
             </article>
             <hr />
            <article>
                 <h3>DOG FOOD</h3>
                 <p>맛있는 수제 강아지 음식</p>
             </article>
             <hr />
             <article>
                 <h3>DOG CLOTHES</h3>
                 <p>귀여운 강아지 옷</p>
             </article>
             <hr />
             <article>
                 <h3>DOG FOUND</h3>
                 <p>사지말고 입양하세요!</p>
             </article>
             <hr />
        </section> -->
        
        <div class="content">
     <!--    <aside class="mypage">
             <h3 style="text-style : bold">MYPAGE</h3>
        </aside> -->
        <hr />
        
        <div class="content" style="text-align : center;"> 
        	<p>로드될 jsp 파일</p>
        </div>
        </div>
        
        <div class="content">
        	<p>동적 이동 테스트</p>
        </div>

</div>

<!-- footer -->
<c:import url='/WEB-INF/views/include/footer_menu2.jsp'/>

</body>
</html>