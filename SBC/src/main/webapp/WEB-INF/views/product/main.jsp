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
	    font-family: 'Cafe24Dongdong';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Dongdong.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	*{
		font-family: 'Cafe24Dongdong';
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
	  font-size: 16px;
	  width: 250px;
	}
	
	.bfSale{
		text-decoration: line-through;
		font-size: 14px;
		color: #696969;
	}
	
	
	/* 슬라이드 */
 	ul,li{list-style:none;}
    .slide{height:400px;overflow:hidden;}
    .slide ul{width:calc(100% * 4);display:flex;animation:slide 8s infinite;} /* slide를 8초동안 진행하며 무한반복 함 */
    .slide li{width:calc(100% / 4);height:400px;text-align: center;}
    @keyframes slide {
      0% {margin-left:0;} /* 0 ~ 10  : 정지 */
      10% {margin-left:0;} /* 10 ~ 25 : 변이 */
      25% {margin-left:-100%;} /* 25 ~ 35 : 정지 */
      35% {margin-left:-100%;} /* 35 ~ 50 : 변이 */
      50% {margin-left:-200%;}
      60% {margin-left:-200%;}
      75% {margin-left:-300%;}
      85% {margin-left:-300%;}
      100% {margin-left:0;}
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

    	<!-- 슬라이드 -->
    	 <section>
			<div class="slide">
				<ul>
				  <li><img src="${root }images/product/벚꽃배너.PNG" /></li>
				  <li><img src="${root }images/product/장난감 배너.PNG" /></li>
				  <li><img src="${root }images/product/간식배너.PNG" /></li>
				  <li><img src="${root }images/product/리뷰.PNG" /></li>
				</ul>
			</div>
		</section>


        <!-- Section-->
        <section class="py-1">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:forEach var="list" items="${productList }" varStatus="vs">
                    <form id="frm_${vs.index }" action="${root }product/productPage" method="post">
                		<input type="hidden" name="product_name" value="${list.product_name }" />
	                    <div class="col mb-5" style="margin-top: 30%">
	                        <div class="card h-100">
	                            <!-- Product image-->
	                            <img class="card-img-top" src="${root }images/product/${list.product_id}.jpg" onclick="formSubmit(${vs.index})" />
	                            <div class="middle">
								    <span style="color: black;">
								    	상품 보러가기! Click!
								    </span>
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


	<!-- footer-->
    <c:import url="/WEB-INF/views/include/footer_menu.jsp" />
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
