<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<body class="goto-here">
	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mb-5 ftco-animate">
					<a href="/easycook/resources/images/${detail.productImage}" class="image-popup"><img
						src="/easycook/resources/images/${detail.productImage}"
						class="img-fluid" alt="Colorlib Template"></a>
				</div>
				<div class="col-lg-6 product-details pl-md-5 ftco-animate">
					<h3>${detail.productName}</h3>
					<div class="rating d-flex">
						<p class="text-left mr-4">
							<a href="#" class="mr-2">5.0</a> <a href="#"><span
								class="ion-ios-star-outline"></span></a> <a href="#"><span
								class="ion-ios-star-outline"></span></a> <a href="#"><span
								class="ion-ios-star-outline"></span></a> <a href="#"><span
								class="ion-ios-star-outline"></span></a> <a href="#"><span
								class="ion-ios-star-outline"></span></a>
						</p>
						<p class="text-left mr-4">
							<a href="#" class="mr-2" style="color: #000;">100 <span
								style="color: #bbb;">Rating</span></a>
						</p>
						<p class="text-left">
							<a href="#" class="mr-2" style="color: #000;">500 <span
								style="color: #bbb;">Sold</span></a>
						</p>
					</div>
					<p class="price">
						<span><fmt:formatNumber value="${detail.productPrice}"
								pattern="###,###,###" />원</span>
					</p>
					<p>${detail.productDetail}</p>
					<div class="row mt-4">
						<!-- 
						상품 종류 정할때 쓸 수 있는 코드
						<div class="col-md-6">
							<div class="form-group d-flex">
								<div class="select-wrap">
									<div class="icon">
										<span class="ion-ios-arrow-down"></span>
									</div>
									<select name="" id="" class="form-control">
										<option value="">Small</option>
										<option value="">Medium</option>
										<option value="">Large</option>
										<option value="">Extra Large</option>
									</select>
								</div>
							</div>
						</div> -->
						<div class="w-100"></div>
						<div class="input-group col-md-6 d-flex mb-3">
							<form name="cartForm" method="post" action="/easycook/order/cart/insert">
								<input type="hidden" name="product_no" value="${detail.productNo}">
								<input type="text" name="cart_qty">
								<p><input type="submit" class="btn btn-primary py-3 px-5" value="장바구니에 담기" ></p>
							</form>
							
							<!-- 
							버튼 + - 버전
							<span class="input-group-btn mr-2">
								<button type="button" class="quantity-left-minus btn"
									data-type="minus" data-field="">
									<i class="ion-ios-remove"></i>
								</button>
							</span> 
							<input type="text" id="quantity" name="quantity"
								class="form-control input-number" value="1" min="1" max="100">
							<span class="input-group-btn ml-2">
								<button type="button" class="quantity-right-plus btn"
									data-type="plus" data-field="">
									<i class="ion-ios-add"></i>
								</button>
							</span> -->
						</div>
						<div class="w-100"></div>
						<!-- <div class="col-md-12">
							<p style="color: #000;">600 kg available</p>
						</div> -->
					</div>
						<!-- <a href="cart.html" class="btn btn-black py-3 px-5">
							장바구니</a> -->
					<a href="/easycook/product" class="btn btn-primary py-3 px-5">상품목록보기</a>
				</div>
			</div>
		</div>
	</section>
<!-- 	<script>
		$(document).ready(function(){

		var quantitiy=0;
		   $('.quantity-right-plus').click(function(e){
		        
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var quantity = parseInt($('#quantity').val());
		        
		        // If is not undefined
		            
		            $('#quantity').val(quantity + 1);

		          
		            // Increment
		        
		    });

		     $('.quantity-left-minus').click(function(e){
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var quantity = parseInt($('#quantity').val());
		        
		        // If is not undefined
		      
		            // Increment
		            if(quantity>0){
		            $('#quantity').val(quantity - 1);
		            }
		    });
		    
		});
	</script> -->
  </body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
