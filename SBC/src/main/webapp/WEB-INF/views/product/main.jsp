<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script> 

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>Shop</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- Core theme CSS (includes Bootstrap)-->
<link href="${root }css/product-style.css" rel="stylesheet" />

<style>
	.card-img-top{
		cursor: pointer;
	}
</style>

<script>

	function formSubmit(type) {
		$("#frm_"+type).submit();
	}

</script>
</head>    
    <body>
    <!-- Navigation-->
    <c:import url="/WEB-INF/views/include/header_menu.jsp" />
		 
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">애견 용품</h1>
                </div>
            </div>
        </header>
        
        
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:forEach var="list" items="${productList }" varStatus="vs">
                    <form id="frm_${vs.index }" action="${root }product/productPage" method="post">
                		<input type="hidden" name="product_name" value="${list.product_name }" />
	                    <div class="col mb-5">
	                        <div class="card h-100">
	                            <!-- Product image-->
	                            <img class="card-img-top" src="${root }images/product/${list.product_id}.jpg" width="450" height="300" onclick="formSubmit(${vs.index})" />
	                            <!-- Product details-->
	                            <div class="card-body p-4">
	                                <div class="text-center">
	                                    <!-- Product name-->
	                                    <h5 class="fw-bolder">${list.product_name }</h5>
	                                    <!-- Product price-->
	                                    ${list.price }원
	                                </div>
	                            </div>         
	                        </div>
	                    </div>   
	                </form>                
                    </c:forEach>                     
                </div>
            </div>
        </section>
        
        <p id="back-top">
		<a href="#top"><i class="fa fa-angle-up"></i></a>
		</p>
        
        
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Designed by <a href="${root }"><span>SBC</span> TEAM PROJECT</a></p></div>
        </footer>

        <!-- Bootsstrap core JS-->     
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="${root }js/bootstrap.min.js"></script>
        <!-- Core theme JS-->
        <script src="${root }js/shop-scripts.js"></script>
		<script src="${root }js/SmoothScroll.js"></script>
		<script src="${root }js/theme-scripts.js"></script>
        
    </body>
</html>
