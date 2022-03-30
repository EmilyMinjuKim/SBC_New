<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script> 

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>SBC</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style>
	@font-face {
    font-family: 'air';
    src: url('${root}fonts/Cafe24Ohsquareair.ttf') format('truetype');
	}
	@font-face {
    font-family: 'air';
    src: url('${root}fonts/Cafe24Ohsquare.ttf') format('truetype');
    font-weight: bold;
	}
	*{
	font-family: 'air';
	}
	
	.card{
		border: none;
	}

	.card-img-top {
      cursor: pointer;
	  opacity: 1;
	  display: block;
	  transition: .5s ease;
	  backface-visibility: hidden;
	}
	
	.middle {
	  transition: .5s ease;
	  opacity: 0;
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  -ms-transform: translate(-50%, -50%);
	  text-align: center;
	}
	
	.card:hover .card-img-top {
	  opacity: 0.3;
	}
	
	.card:hover .middle {
	  opacity: 1;
	}
	
	.product_detail {
	  font-size: 14px;
	  width: 250px;
	}
	
	.bfSale{
		text-decoration: line-through;
		font-size: 12px;
		color: #696969;
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
        
        
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:forEach var="list" items="${productList }" varStatus="vs">
                    <form id="frm_${vs.index }" action="${root }product/productPage" method="post">
                		<input type="hidden" name="product_name" value="${list.product_name }" />
	                    <div class="col mb-5" style="margin-top: 30%">
	                        <div class="card h-100">
	                            <!-- Product image-->
	                            <img class="card-img-top" src="${root }images/product/${list.product_id}.jpg" onclick="formSubmit(${vs.index})" />
	                            <div class="middle">
								    <div class="product_detail">
								    	상품 보러가기! Click!
								    </div>
								</div>
	                            <!-- Product details-->
	                            <div class="card-body p-4">
	                                <div class="text-center">
	                                    <!-- Product name-->
	                                    <h5>${list.product_name }</h5>
	                                    <!-- Product price-->
	                                    <span style="color: #FF1493">25%</span>&nbsp;&nbsp;<fmt:formatNumber value="${list.price }" pattern="#,###"/>원<br>
	                                    <span class="bfSale"><fmt:formatNumber value="${(list.price)*1.25 }" pattern="#,###"/>원</span>
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


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
