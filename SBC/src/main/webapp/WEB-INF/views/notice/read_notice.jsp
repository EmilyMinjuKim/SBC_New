<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html lang="en">
    <head>
      	
        <!-- include libraries(jQuery, bootstrap) -->
<!-- 전체적으로 크기를 줄여줌 -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
 
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"> 
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script> 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script> 
        <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet"> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>

        <title>write</title>  
 
 
    </head>
    <body style="padding-top: 5rem;">
        <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
            <a class="navbar-brand" href="#">Home</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
      
            <div class="collapse navbar-collapse" id="navbarsExampleDefault">
              <ul class="navbar-nav mr-auto">
 
              </ul>
              <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
              </form>
            </div>
        </nav>
  
 
        <main role="main" class="container">
            
            <input type="hidden" id="notice_idx" name="notice_idx" value="${readNoticeBean.notice_idx }">
                <div class="pt-1">
                    <input type="text" name="notice_subject" placeholder="제목을 입력하세요"value="${readNoticeBean.notice_subject }" style="border-radius:5px; width:100%; padding:5px;" readonly="readonly">
                </div>
                <div class="pt-1">
                    <textarea  id="summernote" name="notice_text" disabled="disabled" readonly="readonly" value="">${readNoticeBean.notice_text }</textarea>
                    <input class="form-control" id="notice_file" name="notice_file" type="file" placeholder="" data-sb-validations="required" 
                                value="${readNoticeBean.notice_file }" disabled="disabled"/>
                </div>    
                <script>
                    $('#summernote').summernote({
                      placeholder: '내용을 입력해주세요',
                      tabsize: 2,
                      height: 300
                    });
                  </script>                     
                <div class="text-center"><a href="${root }notice/noticemain?notice_idx=${noticeBean.notice_idx }&page=${page}">
                    <button class="btn btn-primary btn-xl text-uppercase size" id="Button" type="submit">목록 보기</button></a>
                    <%-- 
                    <a href="${root }notice/update?notice_idx=${noticeBean.notice_idx}&page=${page}">
                    <button class="btn btn-primary btn-xl text-uppercase size" id="Button" type="submit">공지 글 수정하기</button></a>
                    
                    <a href="${root }notice/delete?notice_idx=${noticeBean.notice_idx}&page=${page}">
                    <button class="btn btn-primary btn-xl text-uppercase size" id="Button" type="submit">공지 글 삭제하기</button></a>
                    </div> --%>
            
                
            </div>    
            </form>
        </main>  
    </body>
</html>