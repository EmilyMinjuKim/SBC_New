<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html lang="en">
    <head>
      	
        <!-- include libraries(jQuery, bootstrap) -->
<!-- 전체적으로 크기를 줄여줌 -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
 		<link rel="stylesheet" href="${root}css/bootstrap4.4.1.css" />
<!-- 텍스트 AREA 크기 -->
 
    
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <!-- 방금 다운받은거 --> 
<!--         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">  -->
				<link rel="stylesheet" href="${root}css/bootstrap4.0.0.css" />
        <title>공지글 수정</title>

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

.aa3 {
	background: white;
	color: #FDB85E;
	font-size: 18px;
	font-weight: 900;
	border: 3px solid #FDB85E;
}

.aa3:hover {
	background: #FDB85E;
	color: white;
	font-size: 19px;
	font-weight: 900;
	border: 3px solid #00ff0000;
	
}

.aa4 {
	background: #FDB85E;
	color: white;
	font-size: 15px;
	font-weight: 600;
	border: 3px solid white;
	border-radius: 10%;
}

.aa4:hover {
	background: white;
	color: #FDB85E;
	font-size: 16px;
	font-weight: 600;
	border: 3px solid #FDB85E;
	border-radius: 5%;
}

.aa3:visited {
	background: #FDB85E;
	color: white;
	font-size: 19px;
	font-weight: 900;
	border: 3px solid #00ff0000;
	
}
.aa3:link {
	background: #FDB85E;
	color: white;
	font-size: 19px;
	font-weight: 900;
	border: 3px solid #00ff0000;
	
}
.aa3:active {
	background: #FDB85E;
	color: white;
	font-size: 19px;
	font-weight: 900;
	border: 3px solid #00ff0000;
	
}
.aa3:disabled {
	background: #FDB85E;
	color: white;
	font-size: 19px;
	font-weight: 900;
	border: 3px solid #00ff0000;
	
}

.te{
	border-radius:5px; 
	border:2px solid #FDB85E;
	width:40%; 
	height: 50px;
}

.te:target{
	border-radius:5px; 
	border:2px solid #FDB85E;
	width:50%; 
	height: 50px;
}

.tea{
	border-radius:5px; 
	width:40%; 
	height: 250px; 
	border:2px solid #FDB85E; 
	resize: none; 
	autocomplete:on;
}

.fi{
	width:40%;
	border-radius:5px; 
	border:2px solid #FDB85E; 
}

.fi1{
	width: 40%;
	height: 44px;
	border-radius:5px; 
	border:2px solid #FDB85E; 
}

.justify-content-center {
	-ms-flex-pack: center!important;
	justify-content: center!important
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

.shadow {
   box-shadow: 0 .5rem 1rem rgba(0, 0, 0, .15) !important;
}

.im1{
	border: 2px solid #FDB85E;
	border-radius: 5px;
	width: 50%;
	height: 50%;
}

hr{
	width:50%; 
	height:3px; 
	background:#FDB85E;
}

.hr1{
	width:100%; 
	height:1.5px; 
	background:#FD9b5E;
}
</style>
</head>
<body>
	<div class="mt-2 card shadow" style="position:relative; border:1px solid lightgray; width: 60%; left:20%;">
		<div class="text-center mb-2 mt-3">
			<img class="pb-1" src="${root }img/notice.png" style="height: 40%; width: 40%;" />
		</div>
		<main role="main" class="container">
				<div class="pt-1 mb-2 text-center" style="font-weight: 900; font-size:20px;"><hr/>
					${readNoticeBean.notice_subject}
				</div><hr/>
				<div class=" mt-4" style="vertical-align: middle; font-weight: 500;"><hr class="hr1"/>
					<br /><p style="margin-left:25%; width: 50%;">${readNoticeBean.notice_text}</p>
				</div><br />
				<div class="text-center mt-4">
					<img class="im1" src="${root }upload/${readNoticeBean.notice_file }"onerror="this.src='${root}/img/logo_sbc.png'" />
				</div>
				<hr class="hr1" />
				<div class="mt-4 mb-3 text-center">
					<a class="btn btn-primary btn-xl aa3" href="${root }notice/noticemain?notice_idx=${noticeBean.notice_idx }&page=${page}">목록 보기</a>
				</div>
		</main>
	</div>
	
	
	<!-- <script>
	
	document.getElementById('bizFile').addEventListener('change', function(){
		var filename = document.getElementById('fileName');
		if(this.files[0] == undefined){
			filename.innerText = '선택된 파일없음';
			return;
		}
		filename.innerText = this.files[0].name;
	});
	</script> -->
</body>
</html>