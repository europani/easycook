<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<body>
	<section class="ftco-section">
		<div class="container" style="display:block; margin:0 auto;">
			<div class=".justify-content-start" style="float:left;">
				<img src="/easycook/resources/images/food1.jpg" width="300" height="300">
			</div>
			<div class="row">
				<div class="col-md-6 heading-section ftco-animate deal-of-the-day ftco-animate">
					<span class="subheading"></span>
					<h3 class="mb-4">오늘의 핫딜!!</h3>
					<p>매일 달라지는 할인 메뉴를 확인하세요</p>
					<h3><a href="#">${detail.productName}</a></h3>
					<span class="price">50% OFF</a></span>
					<div id="timer" class="d-flex mt-5">
						<div class="time" id="days"></div>
						<div class="time pl-3" id="hours"></div>
						<div class="time pl-3" id="minutes"></div>
						<div class="time pl-3" id="seconds"></div>
					</div>
				</div>
			</div>
		</div>	
	</section>
	<img src="/easycook/resources/images/arrow.png" onclick="menu()" width="100" height="100" style="margin:0 auto;">
	<div class="today" style="display: none">	
		<body class="goto-here">
	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mb-5 ftco-animate">
					<a href="/easycook/resources/images/${detail.productImage}"
						class="image-popup"><img
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
							
						<form name="cartForm" method="post"
								action="/easycook/order/cart/insert">
								<input type="hidden" name="product_no" value="${detail.productNo}"> 
								
							<span class="input-group-btn mr-2">
								<button type="button" class="quantity-left-minus btn"
									data-type="minus" data-field="">
									<i class="ion-ios-remove"></i>
								</button>
							</span> 
							<input type="text" id="quantity" name="cart_qty"
								class="form-control input-number" value="1" min="1" max="10">
							<span class="input-group-btn ml-2">
								<button type="button" class="quantity-right-plus btn"
									data-type="plus" data-field="">
									<i class="ion-ios-add"></i>
								</button>
							</span>
							
							<br><p><input type="submit" class="btn btn-primary py-3 px-5"
										value="장바구니에 담기"></p>
							
						</form>

						</div>
						<div class="w-100"></div>
						<a href="/easycook/product" class="btn btn-primary py-3 px-5">상품목록보기</a>&nbsp;&nbsp;
						<a href="/easycook/order/order" class="btn btn-primary py-3 px-5">주문하기</a>
						<!-- <div class="col-md-12">
							<p style="color: #000;">600 kg available</p>
						</div> -->
					</div>
					<!-- <a href="cart.html" class="btn btn-black py-3 px-5">
							장바구니</a> -->
					

				</div>
			</div>
		</div>
	</section>
		<script>
		$(document).ready(function(){

		var quantity=0;
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
	</script> 
	
	</div>
	<script>
	function menu() {
		const today = document.querySelector(".today");
		if (today.style.display == 'none') {
			today.style.display = 'block';
		} else {
			today.style.display = 'none';
		}
	}
	
	
	
	
	function makeTimer() {
		var endTime = new Date("${endDay}");			
		endTime = (Date.parse(endTime) / 1000);

		var now = new Date();
		now = (Date.parse(now) / 1000);

		var timeLeft = endTime - now;

		var days = Math.floor(timeLeft / 86400); 
		var hours = Math.floor((timeLeft - (days * 86400)) / 3600);
		var minutes = Math.floor((timeLeft - (days * 86400) - (hours * 3600 )) / 60);
		var seconds = Math.floor((timeLeft - (days * 86400) - (hours * 3600) - (minutes * 60)));

		if (hours < "10") { hours = "0" + hours; }
		if (minutes < "10") { minutes = "0" + minutes; }
		if (seconds < "10") { seconds = "0" + seconds; }

		$("#days").html(days + "<span>Days</span>");
		$("#hours").html(hours + "<span>Hours</span>");
		$("#minutes").html(minutes + "<span>Minutes</span>");
		$("#seconds").html(seconds + "<span>Seconds</span>");		
}

setInterval(function() { makeTimer(); }, 1000);	
	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />