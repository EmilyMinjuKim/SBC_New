<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 <c:set var="root" value="${pageContext.request.contextPath }/" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http//www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
    <meta charset="utf-8">
    <title>게시글 리스트</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
   	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous" />
  
   
   
   

   
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
   
   
   
   <style type="text/css">
body{
    background-color: #f8f9fa!important
}
.p-4 {
    padding: 1.5rem!important;
}
.mb-0, .my-0 {
    margin-bottom: 0!important;
}
.shadow-sm {
    box-shadow: 0 .125rem .25rem rgba(0,0,0,.075)!important;
}    

/* user-dashboard-info-box */
.user-dashboard-info-box .candidates-list .thumb {
    margin-right: 20px;
}
.user-dashboard-info-box .candidates-list .thumb img {
    width: 150px;
    height: 150px;
    -o-object-fit: cover;
    object-fit: cover;
    overflow: hidden;
    border-radius: 50%;
}

.user-dashboard-info-box .title {
    display: -webkit-box;
    display: -ms-flexbox;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    padding: 30px 0;
}

.user-dashboard-info-box .candidates-list td {
    vertical-align: middle;
}

.user-dashboard-info-box td li {
    margin: 0 4px;
}

.user-dashboard-info-box .table thead th {
    border-bottom: none;
}

.table.manage-candidates-top th {
    border: 0;
}

.user-dashboard-info-box .candidate-list-favourite-time .candidate-list-favourite {
    margin-bottom: 10px;
}

.table.manage-candidates-top {
    min-width: 650px;
}

.user-dashboard-info-box .candidate-list-details ul {
    color: #969696;
}

/* Candidate List */
.candidate-list {
    background: #ffffff;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    border-bottom: 1px solid #eeeeee;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    padding: 20px;
    -webkit-transition: all 0.3s ease-in-out;
    transition: all 0.3s ease-in-out;
}
.candidate-list:hover {
    -webkit-box-shadow: 0px 0px 34px 4px rgba(33, 37, 41, 0.06);
    box-shadow: 0px 0px 34px 4px rgba(33, 37, 41, 0.06);
    position: relative;
    z-index: 99;
}
.candidate-list:hover a.candidate-list-favourite {
    color: #e74c3c;
    -webkit-box-shadow: -1px 4px 10px 1px rgba(24, 111, 201, 0.1);
    box-shadow: -1px 4px 10px 1px rgba(24, 111, 201, 0.1);
}

.candidate-list .candidate-list-image {
    margin-right: 25px;
    -webkit-box-flex: 0;
    -ms-flex: 0 0 80px;
    flex: 0 0 80px;
    border: none;
}
.candidate-list .candidate-list-image img {
    width: 150px;
    height: 150px;
    -o-object-fit: cover;
    object-fit: cover;
}

.candidate-list-title {
    margin-bottom: 5px;
}

.candidate-list-details ul {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    margin-bottom: 0px;
}
.candidate-list-details ul li {
    margin: 5px 10px 5px 0px;
    font-size: 13px;
}

.candidate-list .candidate-list-favourite-time {
    margin-left: auto;
    text-align: center;
    font-size: 13px;
    -webkit-box-flex: 0;
    -ms-flex: 0 0 90px;
    flex: 0 0 90px;
}
.candidate-list .candidate-list-favourite-time span {
    display: block;
    margin: 0 auto;
}
.candidate-list .candidate-list-favourite-time .candidate-list-favourite {
    display: inline-block;
    position: relative;
    height: 40px;
    width: 40px;
    line-height: 40px;
    border: 1px solid #eeeeee;
    border-radius: 100%;
    text-align: center;
    -webkit-transition: all 0.3s ease-in-out;
    transition: all 0.3s ease-in-out;
    margin-bottom: 20px;
    font-size: 16px;
    color: #646f79;
}
.candidate-list .candidate-list-favourite-time .candidate-list-favourite:hover {
    background: #ffffff;
    color: #e74c3c;
}

.candidate-banner .candidate-list:hover {
    position: inherit;
    -webkit-box-shadow: inherit;
    box-shadow: inherit;
    z-index: inherit;
}

.bg-white {
    background-color: #ffffff !important;
}
.p-4 {
    padding: 1.5rem!important;
}
.mb-0, .my-0 {
    margin-bottom: 0!important;
}
.shadow-sm {
    box-shadow: 0 .125rem .25rem rgba(0,0,0,.075)!important;
}

.user-dashboard-info-box .candidates-list .thumb {
    margin-right: 20px;
}


/* 동현이가 추가한 STYLE */

.big{
   width: 100%;
   height: 100%;
}

.cc{
   font-size: 25px;
   font-weight: 900;
    color: #ffc699;
    background: white;
    text-decoration: 2px solid black;
    margin: 0% 0% 5% 5%;
}
   
.cc1{
    background: white;
    border: 2px solid #ffc655;
}

.cc2{
   font-size: 15px;
   font-weight: 900;
    color: gray;
    background: white;
    margin: -13% 0% 0% 5%;
}

.cc2:hover{ /* 색상 수정이 필요함 */
   color: #E1AFFA;
}   

.card{
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

.shadow{
   box-shadow: 0 .5rem 1rem rgba(0, 0, 0, .15) !important;
}

.bc1{
   border-radius: 2%;
   
}

.fs{
   font-size: 20px;
}

.asd{
	width: 20px;
}
</style>
   
   
   
   

   
</head>
<body>

<div class="container mt-5 mb-5 pt-5 pb-5 pl-4 pr-4 card shadow bg-color">
<div class="col-lg-12 ">
    <div class="row ">
      <div class="col-md-12">
        <div class="user-dashboard-info-box table-responsive mb-0 bg-white p-4 shadow-sm bc1">
          <table class="table manage-candidates-top mb-0">
            <thead>
              <tr>
                <th style="font-size: 15px; text-align: center;">
                   <label style=" margin-right: 5%;"><input type="radio" name='category' value="전체" checked>&nbsp;전체&nbsp;</label>
                   <label style=" margin-right: 5%;"><input type="radio" name='category' value="실종">&nbsp;실종&nbsp;</label>
                   <label style=" margin-right: 5%;"><input type="radio" name='category' value="목격">&nbsp;목격&nbsp;</label>
                   <label style=" margin-right: 5%;"><input type="radio" name='category' value="보호">&nbsp;보호&nbsp;</label>
                   <label style=" margin-right: 5%;"><input type="radio" name='category' value="보호요청">&nbsp;보호요청&nbsp;</label>
                   <label style=" margin-right: 5%;"><input type="radio" name='category' value="완료">&nbsp;완료&nbsp;</label>
                </th>
                <th class="text-center">Status</th>
                <th class="action text-right">Action</th>
              </tr>
            </thead>
             <c:forEach var="item" items="${list }">
              <tr class="candidates-list">
                <td class="title">
                  <div class="thumb">
                 	 <h5 class="mb-2"><a href="#">${item.board_category}</a></h5>
                    <img class="img-fluid" src="${root }upload/${item.dog_img}"  alt="">
                  </div>
                  <div class="candidate-list-details">
                    <div class="candidate-list-info">
                      <div class="candidate-list-title">
                        <h5 class="mb-0"><a href="${root}board/read?b_no=${item.dog_num}&page=${page}">${item.breed}</a></h5>
                      </div>
                      <div class="candidate-list-option">
                        <ul class="list-unstyled">
                          <li><i class="fas fa-filter pr-1"></i>${item.happen_date}</li>
                          <li><i class="fas fa-map-marker-alt pr-1"></i>${item.address1} </li>
                          <li><i class="fas fa-map-marker-alt pr-1"></i>성별: ${item.sex} / ${item.color} / age: ${item.age} / kg: ${item.weight} </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </td>
                <td class="candidate-list-favourite-time text-center">
                  <a class="candidate-list-favourite order-2 text-danger" href="javascript:like('${item.board_num}');"><i class="fas fa-heart"></i></a>
                  <span class="candidate-list-time order-1">좋아요</span>
                  <a href="#" class="candidate-list-favourite order-2 text-primary" data-toggle="tooltip" title="" data-original-title="view"><i class="far fa-eye"></i></a>
                  <span class="candidate-list-time order-1">조회수 ${item.readcount}</span>
                </td>
                <!-- 로그인 회원이 글쓴이랑 같은 경우만 보이게 -->
                <td>
                  <ul class="list-unstyled mb-0 d-flex justify-content-end">
        			  <li><a href="#" class="text-info" data-toggle="tooltip" title="" data-original-title="Edit"><i class="fas fa-pencil-alt"></i></a></li>
         			  <li><a href="#" class="text-danger" data-toggle="tooltip" title="" data-original-title="Delete"><i class="far fa-trash-alt"></i></a></li>
       		 		  <li>${item.reg_time}</li>
                  </ul>
                </td>
	                <!-- 글쓴이 아닌 경우, 작성시간만 보이게  -->
              </tr>
              </c:forEach>
            
            
            
            
            
            <!--페이징  -->
          </table>
          <div class="text-center mt-3 mt-sm-3">
            <ul class="pagination justify-content-center mb-0">
                  <c:choose>
                     <c:when test="${pageBean.prevPage<=0}">
                        <li class="page-item disabled"> <a href="#" class="page-link">이전</a></li>
                     </c:when>
                     
                     <c:otherwise>
                        <li class="page-item">
                           <a class="page-link" href="${root }board/boardList?page=${pageBean.prevPage}">이전</a>
                        </li>
                     </c:otherwise>
               </c:choose>
               
               
               <c:forEach var='idx' begin="${pageBean.min}" end="${pageBean.max}">
                  <c:choose>
                     <c:when test="${idx==pageBean.currentPage}">
                        <li class="page-item active"  aria-current="page">
                           <a href="${root }board/boardList?page=${idx}" class="page-link" >${idx}</a>
                        </li>
                     </c:when>
                     <c:otherwise>
                        <li class="page-item">
                           <a href="${root }board/boardList?page=${idx}" class="page-link">${idx}</a>
                        </li>
                     </c:otherwise>
                  </c:choose>
               </c:forEach>
               
               
               
               <c:choose>
                  <c:when test="${pageBean.max >= pageBean.pageCnt}">
                     <li class="page-item disabled">
                        <a href="#" class="page-link">다음</a>
                     </li>
                  </c:when>
                  <c:otherwise>
                     <li class="page-item">
                        <a href="${root }board/boardList?board_info_idx?page=${pageBean.prevPage}" class="page-link">다음</a>
                     </li>
                  </c:otherwise>
               </c:choose>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>



<script type="text/javascript">
	
	//좋아요 글 입력
		function like(boardNo) {
			console.log("버튼 테스트"+boardNo);
			$.ajax({
				url:"${root}board/likeCheck/"+boardNo,
				type:"get",
				dataType:"text",
				success:function(result){
					console.log("결과값?"+result)
					if(result.trim()=="true"){
						alert("좋아요 등록!!")
					}else{
						alert("좋아요 삭제!!")
					}
				}
			})
		}
	
	
	
    //카테고리 선택
    $('input[type="radio"]').click(function() {
    	$.ajax({
    		url:"${root}board/category/"+$(this).val(),
			type:"get",
			dataType:"text",
			success:function(result){
				console.log("결과값?"+result)
				if(result.trim()=="true"){
					alert("좋아요 등록!!")
				}else{
					alert("좋아요 삭제!!")
				}
			}
    		
    	})
    	
    })
    	
    	
   
	
	
	
	
	
</script>





</body>
</html>