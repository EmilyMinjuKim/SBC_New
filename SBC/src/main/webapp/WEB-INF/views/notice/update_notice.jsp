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
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>

<!-- 어느 기능을 하는지 잘 모르겟음 -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<!-- 어느 기능을 하는지 잘 모르겟음 -->       
<!--         <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script> -->
        
<!-- 큰 틀을 구성함(중요한거 같음) -->        
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
      
<!-- 형태를 구성함(약간 중요한거 같음) -->         
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>                     
 
    
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
	max-width: 30%;
	max-height: 30%;
}
</style>
</head>
<body>
	<div class="mt-2 card shadow" style="position:relative; border:1px solid lightgray; width: 60%; left:20%;">
		<div class="text-center mb-3 mt-3">
			<img class="pb-1" src="${root }img/notice.png" style="height: 40%; width: 40%;" />
		</div>
		<main role="main" class="container">
			<form name="form" action="${root }notice/update_pro" method="post" enctype="multipart/form-data">
				<div class="pt-1 text-center">
					<input type="hidden" name="notice_idx" value="${noticeBean.notice_idx }" />
					<input type="hidden" name="page" value="${page }"/>
					<input class="te" type="text" name="notice_subject" value="${updateNoticeBean.notice_subject}" required>
				<div class="invalid-feedback" data-sb-feedback="name:required`">2글자 이상 작성해주세요</div>
				</div>
				<div class="mt-4 text-center">
					<input class="te" type="text" name="notice_writer" value="${updateNoticeBean.notice_writer}" readonly>
				</div>
				<div class="text-center mt-4">
					<textarea class="tea" name="notice_text" required>${updateNoticeBean.notice_text}</textarea>
				</div>
				<div class="text-center mt-4">
				<c:if test="${updateNoticeBean.notice_file != null}">
					<img class="im1" src="${root }upload/${updateNoticeBean.notice_file}" />	
					<input type="hidden" name="notice_file"/> <!-- 첨부파일 주입시 이미지가 변경없이 유지되기 위한 코드 -->
				</c:if>
				</div>
				<div class="mt-4 fi1" style="position: relative; left: 30%;">
<!-- 				<input class="fi" id="upload_file" name="upload_file" type="file" placeholder="" data-sb-validations="required" /> -->
				
					<input type="file" name="upload_file" accept="image/*" id="bizFile" style="display: none;">
					<label class="justify-content-center btn btn-primary btn-xl aa4" for="bizFile" class="btn fileBtn">파일선택</label>
					<span id="fileName" style="color:gray; font-size: 15px;">선택된 파일없음</span>
				
				</div>
				
				<div class="mt-4 mb-3 text-center">
					<button class="btn btn-primary btn-xl aa3" id="Button" type="submit">수정 완료</button>
					<a class="btn btn-primary btn-xl aa3" href="${root }notice/read?notice_idx=${noticeBean.notice_idx}">취소</a>
				</div>
			
			</form>
		</main>
	</div>
	
	
	<script>
	
	document.getElementById('bizFile').addEventListener('change', function(){
		var filename = document.getElementById('fileName');
		if(this.files[0] == undefined){
			filename.innerText = '선택된 파일없음';
			return;
		}
		filename.innerText = this.files[0].name;
	});
	</script>
</body>
</html>