<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<style>
	* {
	  box-sizing: border-box;
	}
	
	.fa {
	  font-size: 25px;
	}
	
	.checked {
	  color: orange;
	}
	
	.spot {
		color: #1abc9c;
		font-size: 25px;
	}
	
	span.discount {
        text-decoration: line-through;
    }
    span.discountp {
        color: #1abc9c; 
    }
    
    .priz {
    	font-size: 30px;
    	font-weight: 400;
    }

</style>
<body>
	<section class="ftco-section">
		<div class="container m-10">
			<div class=".justify-content-start" style="float:left;">
				<img src="/easycook/resources/images/food1.jpg" width="400" height="400">
			</div>
			<div class="row text-">
				<div class="col-md-8 pl-5 heading-section ftco-animate deal-of-the-day ftco-animate">
					<span class="subheading"></span>
					<h2 class="mb-auto">Deal of the day</h2>
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
	<div class="text-center">
		<img src="/easycook/resources/images/arrow2.png" onclick="menu()" width="100" height="100" style="margin-bottom: 50px;">
	</div>
	<div class="today" style="display: none">	
		<body class="goto-here">
	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mb-5 ftco-animate">
					<a href="<%=request.getContextPath() %>/resources/product/${detail.productImage}"
						class="image-popup"><img
						src="<%=request.getContextPath() %>/resources/product/${detail.productImage}"
						class="img-fluid" ></a>
				</div>
				<div class="col-lg-6 product-details pl-md-5 ftco-animate">
					<h3>${detail.productName}</h3>
					<p class="priz">
						<span class="discount"><fmt:formatNumber value="${detail.productPrice}" pattern="###,###,###"/>원</span>
						<span class="discountp"><fmt:formatNumber value="${detail.productPrice / 2}" pattern="###,###,###"/>원</span>
					</p>
					<div class="rating d-flex">
						<p class="text-left mr-4">
							<span class="spot">${detail.productAmount}</span> (g)
						</p>
						<p class="text-left mr-4">
							<span class="spot">${detail.productTime}</span> (분)
						</p>
					</div>
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
								<input type="hidden" name="productNo" value="${detail.productNo}"> 
								
							<span class="input-group-btn mr-2">
								<button type="button" class="quantity-left-minus btn"
									data-type="minus" data-field="">
									<i class="ion-ios-remove"></i>
								</button>
							</span> 
							<input type="text" id="quantity" name="cartQty"
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
	<section class="ftco-section">
		<div class="container" style="font-size: 15px;">
			<p style="text-align: center; font-size: 40px; color: #1abc9c;">Reviews</p><br>
			<fmt:parseNumber var="score" value="${cal.reviewScore}" integerOnly="true" />
			<span class="heading">상품평점</span>
			<span class="fa fa-star ${score - 1 >= 0? 'checked' : ''}"></span>
			<span class="fa fa-star ${score - 2 >= 0? 'checked' : ''}"></span>
			<span class="fa fa-star ${score - 3 >= 0? 'checked' : ''}"></span>
			<span class="fa fa-star ${score - 4 >= 0? 'checked' : ''}"></span>
			<span class="fa fa-star ${score - 5 >= 0? 'checked' : ''}"></span>
			<p><font style="font-size: 20px;"><fmt:formatNumber pattern="0.00">${cal.reviewScore}</fmt:formatNumber></font> average based on ${cal.reviewNo} reviews.</p>
			<hr style="border:3px solid #f1f1f1">
			
			
				<c:forEach var="review" items="${review}">
				<table>
				<tr> 
					<td>구매자 : ${review.id}</td>				
				</tr>
				<tr> 
					<td>
						<c:if test="${review.reviewScore == 5}">★★★★★</c:if>
						<c:if test="${review.reviewScore == 4}">★★★★☆</c:if>
						<c:if test="${review.reviewScore == 3}">★★★☆☆</c:if>
						<c:if test="${review.reviewScore == 2}">★★☆☆☆</c:if>
						<c:if test="${review.reviewScore == 1}">★☆☆☆☆</c:if>
						<c:if test="${review.reviewScore == 0}">☆☆☆☆☆</c:if>
					</td>
				<tr> 
					<td><fmt:formatDate value="${review.reviewDate}" pattern="yyyy-MM-dd"/></td>				
				</tr>		
				<tr> 
					<td><img width="100" height="100" src="<%=request.getContextPath() %>/resources/upload/${review.reviewImage}"></td>				
				</tr>
				<tr> 
					<td>${review.reviewContent}</td>				
				</tr>			
				<hr>	
				</table>
				</c:forEach>
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