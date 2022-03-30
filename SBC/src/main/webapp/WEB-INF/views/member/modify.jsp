<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- 절대 경로 지정해주기.  -->
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Modify</title>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script> 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- Bootstrap core CSS -->
<link href="${root }css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Custom styles for this template -->
<link href="${root }css/style.css" rel="stylesheet">

<!-- BootStrap LoginForm -->
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${root }images/icons/favicon.ico"/>
<!--===============================================================================================-->
<%-- 	<link rel="stylesheet" type="text/css" href="${root }vendor/bootstrap/css/bootstrap.min.css"> --%>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${root }fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${root }fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${root }vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${root }vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${root }vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${root }vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${root }vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${root }css/util.css">
	<link rel="stylesheet" type="text/css" href="${root }css/main.css">
<!--===============================================================================================-->

<script>

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
<body>

<!-- header -->
<c:import url='/WEB-INF/views/include/header_menu2.jsp'/>

<!-- <div class="container" style="margin-top:100px"> -->
<div class="limiter">

<div class="container-login100"> <!-- 뒷배경 -->

<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">	
<!-- <div class="container" style="margin-top:100px"> -->
<!--	<div class="row">   -->
		<div class="col-sm-12">
	<!--  	<div class="col-sm-6">  -->
			<div class="card shadow">
				<div class="card-body">
					<!-- 절대 경로 -->
					<form:form action="${root }member/modify_pro" method="post"
						modelAttribute="modifyUserBean">
						<span class="login100-form-title p-b-40">
							정보수정</span><hr>
							
<!-- 회원정보수정(userlist 비밀번호, membership 이름, 핸드폰번호, 우편번호, 상세주소1, 상세주소2, 성별, 생일)  -->							
					<div class="form-group">
							<form:label path="user_name">이름</form:label>
							<form:input path="user_name" class='form-control' />
					</div>
				
					<div class="form-group">
							<form:label path="user_id">아이디</form:label>
							<form:input path="user_id" class='form-control' readonly="true"/>
					</div>
					
					<div class="form-group">
							<form:label path="user_password">비밀번호 변경</form:label>
							<form:password path="user_password" class='form-control'/>
							<form:errors path='user_password' style='color:red'/>
						</div>
					<div class="form-group">
							<form:label path="user_password2">비밀번호 확인</form:label>
							<form:password path="user_password2" class='form-control'/>
							<form:errors path='user_password2' style='color:red'/>
					</div>
					
					<div class="form-group">
							<form:label path="email">이메일</form:label>
							<form:input path="email" class='form-control' readonly="true"/>
					</div>
					
					<div class="form-group">
							<form:label path="phone">전화번호</form:label>
							<form:input type="text" class="form-control" placeholder="phone" path="phone"/>
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
					<!--  
						<div class="text-right">
							<button type="submit" class="btn btn-primary">정보수정</button>
						</div>
					</div> -->
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button type="submit" class="login100-form-btn">
								정보수정
							</button>
						</div> 		
					</div>  
					</form:form>	
					<br>
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn"
							onclick="signout();">
								회원탈퇴
							</button>
						</div> 		
					</div>  	
					
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>

</div>
<!-- </div> -->
<!-- footer  -->
<script>
function signout(){
	location.href=${root }+"member/modify_delete";
}


</script>
<c:import url='/WEB-INF/views/include/footer_menu2.jsp'/>
</body>
</html>