<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- 절대 경로 지정해주기.  -->
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Signup</title>

<!-- maintest와 비교 -->
<!-- Bootstrap core CSS -->
<!-- Bootstrap CDN -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<link href="${root }css/bootstrap.min.css" rel="stylesheet">
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> -->
<!-- Custom styles for this template -->
<link href="${root }css/style.css" rel="stylesheet">

<!-- BootStrap LoginForm -->
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="${root }images/icons/favicon.ico" />
<!--===============================================================================================-->
<%-- 	<link rel="stylesheet" type="text/css" href="${root }vendor/bootstrap/css/bootstrap.min.css"> --%>
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${root }fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${root }fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${root }vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${root }vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${root }vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${root }vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${root }vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${root }css/util.css">
<link rel="stylesheet" type="text/css" href="${root }css/main.css">
<!--===============================================================================================-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>

function checkUserIdExist() {
    //변수 선언 : 사용자가 입력한 id가져오기
    var user_id=$("#user_id").val()
    //입력값이 없을시에 요청
    if(user_id.length==0){
       alert("아이디를 입력해주세요")
       return
    }
console.log(user_id+"들어오는 값?")
$.ajax({
    url:"${root}member/checkUserIdExist/" + user_id,  //요청할 페이지 주소
    type:"get",   
    dataType:"text",  //넘어올 문자열
    success: function(result){
    	console.log('성공함')
       if(result.trim() =="true"){
          alert("사용할 수 있는 아이디입니다")
          $("#userIdExist").val("true")
       }else{
          alert("사용할 수 없는 아이디입니다")
          $("#userIdExist").val("false")
          $("#userIdExist").attr("readonly", "true");
       }
    }
 });
}

/* 사용할수 없는 아이디로 구현하는 코드 */
function resetUserIdExist() {
 $("#userIdExist").val("false")
}

function execPostCode() {
		new daum.Postcode({
			oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
               var extraRoadAddr = ''; // 도로명 조합형 주소 변수

               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraRoadAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if(extraRoadAddr !== ''){
                   extraRoadAddr = ' (' + extraRoadAddr + ')';
               }
               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
               if(fullRoadAddr !== ''){
                   fullRoadAddr += extraRoadAddr;
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               console.log(data.zonecode);
               console.log(fullRoadAddr);
               
               
               $("[name=postcode]").val(data.zonecode);
               console.log("우편코드?"+ $("[name=signUpUserPostNo]").val(data.zonecode))

               $("[name=address1]").val(fullRoadAddr);
               
               /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
               document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
               document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
           }
		}).open();
	}


</script>
</head>
<!-- header -->
<body>
	<c:import url='/WEB-INF/views/include/header_menu2.jsp' />
	<div class="limiter">
		<div class="container-login100">
			<!-- 뒷배경 -->
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-md-offset-3" style="width: 55%">
						<div class="login-panel panel panel-default"
							style="margin-top: 10%; margin-bottom: 10%;">
							<div class="panel-heading">
								<h3 class="panel-title">Please Sign Up</h3>
							</div>
							<div class="panel-body">
								<form:form action="${root }member/signup_pro" method="post"
									modelAttribute="signupBean">
									<form:hidden path="userIdExist"/>
									<fieldset>
										<div class="form-group">
											<form:label path="user_name">이름</form:label>
											<form:input path="user_name" class="form-control"
												placeholder="이름" type="text" />
											<form:errors path="user_name" />

										</div>

										<div class="form-group">
											<form:label path="user_id">아이디</form:label>
											<form:input class="form-control" placeholder="아이디"
												path="user_id" onkeypress="resetUserIdExist()" />
											<form:errors path="user_id" />
											<button type="button"
												class="btn btn-warning m-t-5 m-b-5 m-l-5 m-r-5"
												style="float: right" onclick="checkUserIdExist()">중복확인</button>
											<br>
										</div>


										<div class="form-group">
											<form:label path="user_password">비밀번호</form:label>
											<form:password class="form-control" placeholder="비밀번호"
												path="user_password" />
											<form:errors path="user_password" />
										</div>

										<div class="form-group">
											<form:label path="user_password2">비밀번호 확인</form:label>
											<form:password class="form-control" placeholder="비밀번호 재입력"
												path="user_password2" />
											<form:errors path="user_password2" />
										</div>

										<div class="form-group">
											<form:label path="email">이메일</form:label>
											<form:input type="text" path="email" class="form-control"
												placeholder="이메일" />
											<form:errors path="email" />
										</div>

										<div class="form-group">
											<form:label path="phone">전화번호</form:label>
											<form:input type="text" class="form-control"
												placeholder="전화번호" path="phone"/>
											<form:errors path="email" />

										</div>

										<div class="form-group">
											<form:label path="postcode" style="display: block;">기본주소</form:label>
											<form:input class="form-control"
												style="width: 40%; display: inline;" placeholder="우편번호"
												path="postcode" type="text" readonly="true" />
											<button type="button" class="btn btn-default"
												onclick="execPostCode();">
												<i class="fa fa-search"></i> 우편번호 찾기
											</button>
										</div>

										<div class="form-group">
											<form:input class="form-control" style="top: 5px;"
												placeholder="도로명 주소" path="address1" type="text"
												readonly="true" />
										</div>

										<div class="form-group">
											<form:input class="form-control" placeholder="상세주소"
												path="address2" />
										</div>

										<div class="form-group">
											<form:label path="gender">성별</form:label>
											<br>
											<form:radiobutton path="gender" value="male" checked="true"/>
											남
											<form:radiobutton path="gender" value="female" />
											여
										</div>

										<div class="form-group">
											<form:label path="birthdate">생년월일</form:label>
											<form:input class="form-control"
												placeholder="6자 입력(EX 950503)" path="birthdate"
												maxlength='6' />

										</div>

										<%-- 개인정보수집 및 이용동의 모달창으로 pre --%>
										<label><h4>개인정보수집 및 이용동의</h4></label>
										<div class="form-group">
											<ul class="policy">
												<li><label for="service" class="ttl"> 서비스 이용 약관
														<em>(필수)</em>
												</label> <label class="circle-chx" id="#Modal-1"> </label> <a
													class="btn sm largy line w-80" data-toggle="modal"
													data-target="#popup_box">전문 보기</a></li>
											</ul>
										</div>

										<!-- 모달창 -->
										<div class="modal fade" id="popup_box">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal">&times;</button>
														<p>서비스 이용약관</p>
													</div>
													<div class="modal-body">
														<p>개인정보관련 동의서 복붙</p>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="modal" style="position: center;">동의하기</button>
													</div>
												</div>
											</div>
										</div>

										<!-- 모달창을 모달았음 -->
										<div class="form-group">
											<ul class="policy">
												<li><label for="service" class="ttl"> 개인정보 수집 및
														이용안내 <em>(필수)</em>
												</label> <label class="circle-chx" id="#Modal-2"> </label> <a
													class="btn sm largy line w-80" data-toggle="modal"
													data-target="#popup_box2">전문 보기</a></li>
											</ul>
										</div>

										<!-- 모달창 -->
										<div class="modal fade" id="popup_box2">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal">&times;</button>
														<p>개인정보 수집 및 이용안내</p>
													</div>
													<div class="modal-body">
														<p>여기에 개인정보 수집 및 이용안내 복붙</p>
													</div>
													<div class="modal-footer" style="position: center;">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">동의하기</button>
													</div>

												</div>
											</div>
										</div>

										<div class="container-login100-form-btn">
											<div class="wrap-login100-form-btn">
												<div class="login100-form-bgbtn"></div>
												<form:button type="submit" class="login100-form-btn">SignUp</form:button>
											</div>
										</div>
									</fieldset>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<c:import url='/WEB-INF/views/include/footer_menu2.jsp' />
</body>
</html>