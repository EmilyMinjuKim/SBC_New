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
    
    //아이디 유효한 형식 패턴 체크
    //아이디 정규식
    let idCheck = /^[a-zA-Z0-9_-]{4,20}$/;
    
    if(!idCheck.test(user_id)) {
    	alert("올바른 형식의 아이디가 아닙니다.")
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
          $("#user_id").attr("readonly", "true");
          $("#user_id_errors").empty();
       }else{
          alert("사용할 수 없는 아이디입니다")
          $("#userIdExist").val("false")
          
       }
    }
 });
}

function checkUserEmailExist() {
    //변수 선언 : 사용자가 입력한 id가져오기
    var email=$("#email").val()
    
    //입력값이 없을시에 요청
    if(email.length==0){
       alert("이메일을 입력 해 주세요.")
       return
    }
    
    //이메일 패턴 체크
    //아이디 정규식
    let reg_email =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    
    if(!reg_email.test(email)) {
    	alert("올바른 형식의 이메일이 아닙니다.")
    	return
    }


$.ajax({
    url:"${root}member/checkUserEmailExist/" + email,  //요청할 페이지 주소
    type:"get",   
    dataType:"text",  //넘어올 문자열
    success: function(result){
    	console.log('성공함')
       if(result.trim() =="true"){
          alert("사용할 수 있는 이메일입니다")
          $("#userEmailExist").val("true")
          $("#email").attr("readonly", "true");
          $("#user_eamil_errors").empty();
       }else{
          alert("사용할 수 없는 이메일입니다")
          $("#userEmailExist").val("false")
          
       }
    }
 });
}

/* 사용할수 없는 아이디로 구현하는 코드 */
function resetUserIdExist() {
 $("#userIdExist").val("false")
}

/* 사용할수 없는 아이디로 구현하는 코드 */
function resetUserEmailExist() {
 $("#userEmailExist").val("false")
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
<style type="text/css">
 #joinForm{width: 460px;margin: 0 auto;}
ul.join_box{border: 1px solid #ddd;background-color: #fff;}
.checkBox,.checkBox>ul{position: relative;}
.checkBox>ul>li{float: left;}
.checkBox>ul>li:first-child{width: 85%;padding: 15px;font-weight: 600;color: #888;}
.checkBox>ul>li:nth-child(2){position: absolute;top: 50%;right: 30px;margin-top: -12px;}
.checkBox textarea{width: 96%;height: 90px; margin: 0 2%;background-color: #f7f7f7;color: #888; border: none;}
.footBtwrap{margin-top: 15px;}
.footBtwrap>li{float: left;width: 50%;height: 60px;}
.footBtwrap>li>button{display: block; width: 100%;height: 100%; font-size: 20px;text-align: center;line-height: 60px;}
.fpmgBt1{background-color: #fff;color:#888}
.fpmgBt2{background-color: lightsalmon;color: #fff}

/* @font-face {
    font-family: 'air';
    src: url('${root}fonts/Cafe24Ohsquareair.ttf') format('truetype');
	}
	*{
	font-family: 'air';
	}

@font-face {
    font-family: 'air';
    src: url('${root}fonts/Cafe24Ohsquare.ttf') format('truetype');
    font-weight: bold;
	}
	
input[type=password] {
	    font-family: "serif";
	
	    &::placeholder {
	        font-family: "air";
	    }
	}	
 */
</style>



</head>
<!-- header -->
<body>
	<c:import url='/WEB-INF/views/include/header_menu2.jsp' />
	<hr />
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
								<h6 style="text-align: right; color: gray;">* 전 항목 필수사항입니다.</h6>
							</div>
							<div class="panel-body">
								<form:form action="${root }member/signup_pro" method="post"
									modelAttribute="signupBean">
									<form:hidden path="userIdExist"/>
									<form:hidden path="userEmailExist"/>
									<fieldset>
										<div class="form-group">
											<form:label path="user_name">이름
											<h6 style="color: gray;">한글만을 허용합니다. (2~10자리)</h6>
											</form:label>
											<form:input path="user_name" class="form-control"
												placeholder="이름" type="text" />
											<form:errors path="user_name" style="color:red"/>

										</div>

										<div class="form-group">
											<form:label path="user_id">아이디
											<h6 style="color: gray;">영문 대소문자, 로마 숫자, -, _ 을 허용합니다. (4~20자리)</h6>
											</form:label>
											<form:input class="form-control" placeholder="아이디"
												path="user_id" onkeypress="resetUserIdExist()" />	
											<form:errors path="user_id" id="user_id_errors" style="color:red"/>
											<button type="button"
												class="btn btn-warning m-t-5 m-b-5 m-l-5 m-r-5"
												style="float: right" onclick="checkUserIdExist()">중복확인</button>
											<br>
										</div>


										<div class="form-group">
											<form:label path="user_password">비밀번호
											<h6 style="color: gray;">문자와 숫자를 1개이상 조합하여야 합니다. (8자리 이상)</h6>
											</form:label>
											<form:password class="form-control" placeholder="비밀번호"
												path="user_password" />
											<form:errors path="user_password" style="color:red"/>
										</div>

										<div class="form-group">
											<form:label path="user_password2">비밀번호 확인
											<h6 style="color: gray;">입력한 비밀번호와 동일하여야 합니다.</h6>
											</form:label>
											<form:password class="form-control" placeholder="비밀번호 재입력"
												path="user_password2" />
											<form:errors path="user_password2" style="color:red"/>
										</div>

										<div class="form-group">
											<form:label path="email">이메일</form:label>
											<form:input type="text" path="email" class="form-control"
												placeholder="이메일" onkeypress="resetUserEmailExist()"/>
											<form:errors path="email" class="user_eamil_errors" style="color:red"/>
											<button type="button"
												class="btn btn-warning m-t-5 m-b-5 m-l-5 m-r-5"
												style="float: right" onclick="checkUserEmailExist()">중복확인</button>
											<br>
										</div>

										<div class="form-group">
											<form:label path="phone">휴대전화
											<h6 style="color: gray;">휴대전화번호를 입력하세요(하이픈(-)제외)</h6>
											</form:label>
											<form:input type="text" class="form-control"
												placeholder="휴대전화(EX 0102349876)" path="phone"/>
											<form:errors path="phone" style="color:red"/>

										</div>

										<div class="form-group">
											<form:label path="postcode" style="display: block;">기본주소</form:label>
											<form:input class="form-control"
												style="width: 40%; display: inline;" placeholder="우편번호"
												path="postcode" type="text" readonly="true" required="true"/>
											<button type="button" class="btn btn-default"
												onclick="execPostCode();">
												<i class="fa fa-search"></i> 우편번호 찾기
											</button>
										</div>

										<div class="form-group">
											<form:input class="form-control" style="top: 5px;"
												placeholder="도로명 주소" path="address1" type="text"
												readonly="true" required="true"/>
										</div>

										<div class="form-group">
											<form:input class="form-control" placeholder="상세주소"
												path="address2" />
										</div>

										<div class="form-group">
											<form:label path="gender">성별
											</form:label>
											<br>
											<form:radiobutton path="gender" value="male" checked="true"/>
											남
											<form:radiobutton path="gender" value="female" />
											여
										</div>

										<div class="form-group">
											<form:label path="birthdate">생년월일
											<h6 style="color: gray;">생년월일 6자릴 입력해주세요(YYMMDD)</h6>
											</form:label>
											<form:input class="form-control"
												placeholder="6자 입력(EX 950503)" path="birthdate"
												maxlength='6' />
											<form:errors path="birthdate" style="color:red"/>

										</div>

										<form action="" id="joinForm">
            <ul class="join_box">
                <li class="checkBox check01">
                    <ul class="clearfix">
                        <li>이용약관, 개인정보 수집 및 이용에 대하여 모두 동의합니다.</li>
                        <li class="checkAllBtn">
                            <form:checkbox path="personal_info_agmt" class="chkAll" value="1" required="true"/>
                        </li>
                    </ul>
                </li>
                <li class="checkBox check02">
                    <ul class="clearfix">
                        <li>이용약관 동의(필수)</li>
                        <li class="checkBtn">
                        </li>
                    </ul>
                    <textarea name="" id="">이 약관은 SBC 회사(전자상거래 사업자)가 운영하는 SBC 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.

  ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」

       </textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
                        <li class="checkBtn">
                        </li>
                    </ul>
 
                    <textarea name="" id=""> 개인정보 수집 및 이용안내
                    
  ① “몰”이란 SBC 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.

  ② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.

  ③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.

  ④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.
                    
       </textarea>
                </li>
                
            </ul>
            
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