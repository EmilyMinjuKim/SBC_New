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

<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${root }css/product-style.css" rel="stylesheet" />
<!-- Spinner CSS -->
<link rel="stylesheet" href="${root }jquery-ui-1.11.4/jquery-ui.css" />

<script>
	function addToCart() {
		var form = $("#frm").serializeArray();
		console.log(form);
		
 		$.ajax({
			type : "post",
			url : "${root}product/addCart",
			dataType : "json",
			data : form,
			error : function(request, status, error) {
				alert("code:"
						+ request.status
						+ "\n"
						+ "message:"
						+ request.responseText
						+ "\n"
						+ "error:"
						+ error);
			},
			success : function(data) {
				if(data != 0){
					document.getElementById("countAll").innerHTML = data;
				}
			}
		});
		
	}

	
	//옵션 선택시 이벤트
	function selectOpt() {
		var optVal = $("#opt option:selected").val();
		
		if(optVal == null |+ optVal ==""){
			return;
		}
		
		var idx = $("#opt option:selected").attr("idx");
		var pid = $("#opt option:selected").attr("pid");

		$("#opt_detail").append( 
			"<table>"+
				"<tr>"+
					"<td>"+
						"${repProduct.product_name }<br />"+optVal+
					"</td>"+
					"<td>"+
						"<input type='text' class='spinner spinner"+idx+"' style='width: 50px' value='1' />"+
					"</td>"+
					"<td>"+
						"<a href='#none' class='delete'><img src='//img.echosting.cafe24.com/design/skin/default/product/btn_price_delete.gif' id='option_box1_del' class='option_box_del'></a>"+
					"</td>"+
					"<td>${repProduct.price}원</td>"+
				"</tr>"+
			"</table>"
		);
		
		$("#q"+idx).attr('value', '1');
		
		//스피너 호출 
		$(".spinner").spinner();
		$(".spinner").bind("spinstop", function() {
			maxMin();
		});
		
		
	}
	
	function maxMin(){
		//최소, 최대 수량 설정 
		for(var i=0;i<${productList.size()};i++){
						
			//이름 설정 
			var cnt = ".spinner"+i;
			
			//최소, 최대 주문 수량 설정
			if($(cnt).val() < 1){
				$(cnt).val(1);
			} else if($(cnt).val() > 10){
				$(cnt).val(10);
				alert("구매할 수 있는 최대 수량은 10입니다.");
			}
			
			$("#q"+i).attr('value', $(cnt).val());
		}
	}
 
	
	//옵션 null check 

</script>
</head>    
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!">SBC</a>
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
                    <div class="d-flex">
                        <button type="button" class="btn btn-outline-dark" onclick="location.href='${root }product/cart'">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill" id="countAll">${cntCart }</span>
                        </button>
                    </div>
                </div>
            </div>
        </nav>
        
        
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">애견 용품</h1>
                    <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>
                </div>
            </div>
        </header>
        
        
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
					<table>
						<tr>
							<td>
								<img src="${root }images/product/${repProduct.product_id }.png" style="width: 800px; height:800px;" />
							</td>
							<td>
								<table>
									<tr>
										<td colspan="2" style="text-align: center">${repProduct.product_name }</td>
									</tr>
									<tr>
										<td>PRICE</td>
										<td>${repProduct.price }원</td>
									</tr>
									<tr>
										<td>OPTION</td>
										<td>
											<select id="opt" onchange="selectOpt()">
												<option value="" selected="selected">- [필수] 옵션을 선택해주세요 -</option>
												<c:forEach items="${productList }" var="list" varStatus="vs">
												<option idx="${vs.index }" pid="${list.product_id}">${list.product_option }</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<div id="opt_detail">
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="2" style="text-align: center">
											<button type="button" onclick="hello()">BUY IT NOW</button><br />
											<button type="button" onclick="addToCart()">ADD TO CART</button>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
                </div>
            </div>
        </section>
        
		<form id="frm">
			<c:forEach items="${productList }" var="pl" varStatus="v">
				<input type="hidden" name="cartList[${v.index }].product_id" value="${pl.product_id }" />
				<input type="hidden" name="cartList[${v.index }].quantity" value="0" id="q${v.index }" />
			</c:forEach>
		</form>
  
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p></div>
        </footer>

        <!-- Bootstrap core JS-->     
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Modal -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="${root }js/bootstrap.min.js"></script>
        <!-- Core theme JS-->
        <script src="${root }js/shop-scripts.js"></script>
        <!-- Spinner JS -->
        <script src="${root }jquery-ui-1.11.4/jquery-ui.js"></script>
    </body>
</html>