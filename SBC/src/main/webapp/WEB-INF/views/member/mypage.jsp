<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 절대 경로 지정해주기.  -->
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MyPage</title>

<!-- header -->
<c:import url='/WEB-INF/views/include/header_menu2.jsp'/>

<style>
.h3 {
position: center;
text-align: center;
}
</style>

</head>
<div class="container" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
					<!-- 절대 경로 -->
					<form action="${root }member/mypage" method="get">  
					<div>
						<h3>MyPage</h3>
					</div>
					<br>
					<div class="form-group">
						<label for="user_name">이름</label>
						<input type="text" id="user_name" name="user_name" class="form-control" value="테스트" disabled="disabled"/>
					</div>
					<div class="form-group">
						<label for="user_id">아이디</label>
						<input type="text" id="user_id" name="user_id" class="form-control" value="ilovesleep" disabled="disabled"/>
					</div>
					<div class="form-group">
						<label for="user_phone">전화번호</label>
						<input type="text" id="user_phone" name="user_phone" class="form-control" value="ilovesleep" />
					</div>
					<div class="form-group">
						<label for="user_email">이메일</label>
						<input type="text" id="user_email" name="user_email" class="form-control" value="ilovesleep"/>
					</div>
					<div class="form-group">
						<label for="user_postcode">우편번호</label>
						<input type="text" id="user_postcode" name="user_postcode" class="form-control" value="ilovesleep" />
					</div>
					<div class="form-group">
						<label for="user_address1">기본주소</label>
						<input type="text" id="user_address1" name="user_address1" class="form-control" value="ilovesleep" />
					</div>
					<div class="form-group">
						<label for="user_address2">상세주소</label>
						<input type="text" id="user_address2" name="user_address2" class="form-control" value="ilovesleep" />
					</div>
					<!-- 바꿔야함 -->
					<div class="form-group">
						<label for="user_gender">성별</label>
						<input type="text" id="user_gender" name="user_gender" class="form-control" value="남여자" disabled="disabled"/>
					</div>
					<div class="form-group">
						<label for="user_birthdate">생일</label>
						<input type="text" id="user_birthdate" name="user_birthdate" class="form-control" value="ilovesleep" />
					</div>
					<!-- 바꿔야함 -->
					<div class="form-group">
						<label for="user_id">개인정보수집 및 이용동의</label>
						<input type="text" id="user_id" name="user_id" class="form-control" value="ilovesleep" disabled="disabled"/>
					</div>
					<div class="form-group">
						<div class="text-right">
							<button type="submit" class="btn btn-primary">정보수정</button>
						</div>
					</div>
					<br>
					
					</form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>

<!-- footer  -->
<c:import url='/WEB-INF/views/include/footer_menu2.jsp'/>
</body>
</html>