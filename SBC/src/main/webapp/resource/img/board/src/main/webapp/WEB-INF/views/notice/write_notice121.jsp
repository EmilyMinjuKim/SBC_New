<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>글쓰기</title>
<!-- Favicon-->
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${root }css/styles.css" rel="stylesheet" />

<style>
.size {
	width: 40%;
	font-size: 25px;
	margin-top: 20%;
}

.size0 {
	color: white;
	font-size: 60px;
	margin-top: 20%;
}

.size1 {
	font-size: 40px;
	font-weight: 900;
	width: 100px;
	color: white;
}

.top1 {
	margin-top: -2%;
	margin-bottom: 5%;
}

.inline {
	width: 50%;
}

.dt{
	width: 180%;
}

.dt1{
	position: relative;
	right: -13%;
}

#ba{
	background-image: url("${root }/image/puppy_notice.png");
}
</style>
</head>
<body>
<!-- Contact-->
        <section class="page-section" id="contact">
                <form id="contactForm" data-sb-form-api-token="API_TOKEN" action="${root }notice/write_pro" method="post">
            <div class="container">
                <div class="text-center">
                    <h2 class="size0 top1">공지글 작성</h2>
                </div>
                    <div class="row align-items-stretch mb-5">
                   
                        <div class="col-md-12 inline">
                            <div class="form-group ">
                    <!-- 작성자 -->
							<table class="dt">
								<tr class="size1"><td><input type="hidden" id="notice_idx" name="notice_idx" value="2"></td>
									<td class="">제목 : &nbsp;</td>
									<td><input class="form-control" id="notice_subject" name="notice_subject" type="text" value=""
										placeholder="작성자를 입력해주세요." data-sb-validations="required" />
									</td>
					<!-- 제목 -->
									<td class="dt1">내용 : &nbsp;</td>
									<td class="dt1"><input class="form-control" id="notice_text" name="notice_text" type="text" value=""
										placeholder="제목을 입력해주세요." data-sb-validations="required" />

									</td>
								</tr>
							</table>
							<div class="invalid-feedback" data-sb-feedback="name:required">2글자 이상 작성해주세요</div>
                            </div>
                            
	                            </div>
                            <div class="form-group mb-md-0">
                                <!-- Phone number input-->
                                <input class="form-control" id="notice_file" name="notice_file" type="file" placeholder="" data-sb-validations="required" 
                                value=""/>
                                <div class="invalid-feedback" data-sb-feedback="phone:required">A phone number is required.</div>
                                
                            </div>
                        </div>
                    </div>
                    <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
               <!-- 작성완료 버튼 및 취소 버튼 -->
                    <div class="text-center">
                    <button class="btn btn-primary btn-xl text-uppercase size" id="Button" type="submit">작성 완료</button>
                    <button class="btn btn-primary btn-xl text-uppercase size" id="Button" type="reset">취소</button>
                    </div>
            
                </form>
        </section>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${root }js/scripts.js"></script>
        
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>