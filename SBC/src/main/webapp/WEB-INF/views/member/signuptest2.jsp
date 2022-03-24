<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<link href="${root }css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
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

</script>

<style>

</style>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Signup</title>
</head>
<!-- header -->
<c:import url='/WEB-INF/views/include/header_menu2.jsp' />

<div class="limiter">

<div class="container-login100"> <!-- 뒷배경 -->

<div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-3" style="width: 55%">
                <div class="login-panel panel panel-default" style="margin-top: 10%; margin-bottom: 10%;">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign Up</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="${root }member/signup_load" method="post" modelAttribute="signupUserBean">
                        <!-- <form role="form"> -->
                            <fieldset>
                            	<div class="form-group" id="divInputId">
                            		<label>아이디</label> 
                            		<input class="form-control" style="width: 40%; display: inline;" placeholder="아이디" name="signUpUserId" id="signUpUserId" type="text" />
                            		<button type="button" class="btn btn-default" style="width: 30%;" onclick="duplicationId();">중복확인</button>
                            		<!-- <input type="button" class="btn btn-default" style="width: 30%;" value="중복확인" onclick="duplicationId();" /> -->
                            		<!-- onclick에 아이디 중복확인 되게 -->
                            	</div>
                            	                	
                            	<div class="form-group">
                            		<label>비밀번호</label>
                            		<input class="form-control" placeholder="비밀번호" name="signUpUserPwd" id="signUpUserPwd" type="password" />
                            	</div>
                            	<div class="form-group">
                            		<label>비밀번호 확인</label>
                            		<input class="form-control" placeholder="비밀번호 확인" name="signUpUserPwdCfm" id="signUpUserPwdCfm" type="password" />
                            	</div>
                        
                            	<div class="form-group">
                            		<label>전화번호</label>
                            		<input class="form-control" placeholder="전화번호" name="signUpUserTelNo" id="signUpUserTelNo" type="text" />
                            	</div>
                            	<div class="form-group">
                            		<label>이메일</label>
                            		<input class="form-control" placeholder="이메일" name="signUpUserEmail" id="signUpUserEmail" type="text" />
                            	</div>
                            	
                            <!-- 	<div class="form-group">
                            		<label>회사명</label>
                            		<input class="form-control" placeholder="회사명" name="signUpUserCompanyName" id="signUpUserCompanyName" type="text" />
                            	</div>
                            	
                            	<div class="form-group">
                            		<label>사업자번호</label>
                            		<input class="form-control" placeholder="사업자번호" name="signUpUserCompanyNo" id="signUpUserCompanyNo" type="text" />
                            	</div> -->
                            	
                            	<div class="form-group">
                            		<label style="display: block;" >기본주소</label>
                            		<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="signUpUserPostNo" id="signUpUserPostNo" type="text" readonly="readonly" >
                            		<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
                            		<!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                                <div class="modal-dialog">
	                                    <div class="modal-content">
	                                        <div class="modal-header">
	                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                                            <h4 class="modal-title" id="myModalLabel">우편번호 서비스</h4>
	                                        </div>
	                                        <div class="modal-body">
	                                        	<label>주소 입력</label>
	                                        	<div class="form-group input-group">
		                                           <input type="text" class="form-control" name="dlgSearchAddress" onclick="execPostCode();">
			                                           <span class="input-group-btn">
			                                               <button class="btn btn-default" type="button"><i class="fa fa-search"></i>
			                                               </button>
			                                           </span>
		                                       </div>
	                                            <p class="help-block">아래와 같은 조합으로 검색을 하시면 더욱 정확한 결과가 검색됩니다.</p>
	                                            <p class="help-block">도로명 + 건물번호</p>
	                                            <p class="text-primary">예) 판교역로 235, 제주 첨단로 242</p>
	                                            <p class="help-block">지역명(동/리) + 번지</p>
	                                            <p class="text-primary">예) 삼평동 681, 제주 영평동 2181</p>
	                                            <p class="help-block">지역명(동/리) + 건물명(아파트명)</p>
	                                            <p class="text-primary">예) 분당 주공, 연수동 주공3차</p>
	                                            <p class="help-block">사서함명 + 번호</p>
	                                            <p class="text-primary">예) 분당우체국사서함 1~100</p>
	                                        </div>
	                                        <div class="modal-footer">
	                                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	                                            <button type="button" class="btn btn-primary">저장</button>
	                                        </div>
	                                    </div>
	                                    /.modal-content
	                                </div>
	                                /.modal-dialog
	                            </div> -->
                            	</div>
                            	<div class="form-group">
                            		<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="signUpUserCompanyAddress" id="signUpUserCompanyAddress" type="text" readonly="readonly" />
                            	</div>
                            	<div class="form-group">
                            		<input class="form-control" placeholder="상세주소" name="signUpUserCompanyAddressDetail" id="signUpUserCompanyAddressDetail" type="text" />
                            	</div>

								<div class="form-group">
									<label>성별</label> 
									<select name="성별" style="width: 90%;">
										<option value="default">남자</option>
										<option value="1900">여자</option>
										<option value="1910">기타</option>
									</select>
								</div>
							
								<div class="form-group">
                            		<label>생년월일</label>
                            		<input class="form-control" placeholder="6자 입력(EX 950503)" name="signUpUserbirthdate" id="signUpUserbirthdate" type="text" maxlength='6'/>
                            	</div>
                            	
                            <%-- 개인정보수집 및 이용동의 모달창으로 pre --%>
							<label><h4>개인정보수집 및 이용동의</h4></label>
							<div class="form-group">
								<ul class="policy">
									<li>
									<label for="service" class="ttl">
									서비스 이용 약관
									<em>(필수)</em>
									</label>
								<label check class="circle-chx"  id="#Modal-1"> </label>
									<a class="btn sm largy line w-80" data-toggle="modal" data-target="#popup_box">전문 보기</a>
									</li>
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
											data-dismiss="modal" style="position:center;">동의하기</button>
									</div>
								</div>
							</div>
						</div>

						<!-- 모달창을 모달았음 -->
							<div class="form-group">
								<ul class="policy">
									<li>
									<label for="service" class="ttl">
									개인정보 수집 및 이용안내
									<em>(필수)</em>
									</label>
								<label check class="circle-chx"  id="#Modal-2"> </label>
									<a class="btn sm largy line w-80" data-toggle="modal" data-target="#popup_box2">전문 보기</a>
									</li>
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
									<div class="modal-footer" style="position:center;">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">동의하기</button>
									</div>
									
								</div>
							</div>
						</div>
						
						<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button type="submit" class="login100-form-btn"
							onclick="${root }member/maintest">
								SignUp
							</button>
						</div> 		
					</div>  
						
								<!-- <button class="btn btn-lg btn-success btn-block">회원가입</button> -->
                            	<!-- <input type="button" class="btn btn-lg btn-success btn-block" value="회원가입" onclick="DosignUp();" /> -->
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
 <script type="text/javascript">
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
                
                
                $("[name=signUpUserPostNo]").val(data.zonecode);
                $("[name=signUpUserCompanyAddress]").val(fullRoadAddr);
                
                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
            }
 		}).open();
 	}
 </script>
 
 </div>
 </div>

<!-- footer  -->
<c:import url='/WEB-INF/views/include/footer_menu2.jsp' />
</body>
</html>