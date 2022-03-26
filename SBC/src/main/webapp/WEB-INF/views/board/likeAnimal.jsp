<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 <c:set var="root" value="${pageContext.request.contextPath }/" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http//www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>관심글 상세페이지</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!">Start Bootstrap</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex">
                       
                    </form>
                </div>
            </div>
        </nav>
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="${root }img/yu1.jpg" alt="..." /></div>
                    <div class="col-md-6">
                        <div class="small mb-1">보호 중 동물</div>
                        <div class="imglike">
                        <h1 class="display-5 fw-bolder">정 알렉산더 핑삼</h1>
                        <img src="../img/like.png">
                        </div>
                        <div class="fs-5 mb-5">
                            <span>잘 모르겠어요</span><br>
                            <span>암컷(중성화 x)/흰색/2019(년생)/4(kg)</span>
                        </div>
                        <table class="animalinfo">
                        <tr>
                        <th>공고번호</th>
                        <td>경남-합천-2022-00123</td>
                        </tr>
                        <tr>
                        <th>품종</th>
                        <td>[개]믹스견</td>
                        </tr>
                        <tr>
                        <th>색상</th>
                        <td>화이트</td>
                        </tr>
                        <tr>
                        <th>성별</th>
                        <td>잘 모르겠어요</td>
                        </tr>
                        <tr>
                        <th>나이/체중</th>
                        <td>2021(년생) / 15.00 (kg)</td>
                        </tr>
                        <tr>
                        <th>발생장소</th>
                        <td>경상남도 합천군청</td>
                        </tr>
                        <tr>
                        <th>접수일시</th>
                        <td>2022-03-23</td>
                        <th>중성화</th>
                        <td>아니오</td>
                        </tr>
                        <tr>
                        <th>특징</th>
                        <td>예쁨</td>
                        </tr>
                        <tr>
                        <th>등록번호</th>
                        <td>0000</td>
                        <th>RFID_CD</th>
                        <td>9999</td>
                        </tr>
                         <tr>
                        <th>특징</th>
                        <td>예쁨</td>
                        </tr>
                         <tr>
                        <th>관할기관</th>
                        <td>경상북도 울진군</td>
                        </tr>
                         <tr>
                        <th>상태</th>
                        <td>보호중</td>
                        </tr>
                         <tr>
                        <th>보호센터</th>
                        <td>울진군동물보호센터</td>
                        <th>보호센터연락처</th>
                        <td>010-0000-0000</td>
                        </tr>
                         <tr>
                        <th>보호장소</th>
                        <td>경상북도 울진군</td>
                        </tr>
                        </table>
                        <p class="lead"></p>
                        <div class="d-flex">
                            

                            
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">TEAM SBC</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../js/scripts.js"></script>
    </body>
</html>