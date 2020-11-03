<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<style>
.weatherBox {
	/* background-color: #1abc9c; */
	width: 100%;
	height: 50%;
	background-image: url("/easycook/resources/images/weather.jpg");
	background-size: contain;
}
	
.info {
	text-align: right;
	font-size: 25px;
	color: #FFFFFF;
	height: 40px;
	margin-top: 5px;
	margin-right: 5px;
}

#icon {
	text-align: right;
	margin-right: 20%;
}
</style>
	<div class="container weatherBox">
		<div class="temp info"></div>
		<div class="weather" id="icon"></div>
	</div>
<section class="ftco-section">
	<div class="container">
		<h2>전체  [ 상품 : ${list.size()}개 ]</h2>
        <hr>
		<c:forEach var="row" items="${list}">
			<div class="col-md-6 col-lg-3 ftco-animate">
				<div class="product">
					<a href="/easycook/product/${row.productNo}" class="img-prod"><img
						class="img-fluid"
						src="<%=request.getContextPath() %>/resources/product/${row.productImage}">
						<div class="overlay"></div> </a>
					<div class="text py-3 pb-4 px-3 text-center">
						<h3>
							<a href="#">${row.productName}</a>
						</h3>
						<div class="d-flex">
							<div class="pricing">
								<p class="price">
									<span><fmt:formatNumber value="${row.productPrice}" pattern="###,###,###"/>원</span>
								</p>
							</div>
						</div>

						<div class="bottom-area d-flex px-3">
							<div class="m-auto d-flex">
								<!-- 제품 상세보기 -->
								<a href="#"
									class="add-to-cart d-flex justify-content-center align-items-center text-center">
									<span><i class="ion-ios-menu"></i></span>
								</a>
								<!-- 장바구니 담기 -->
								<a href="#"
									class="buy-now d-flex justify-content-center align-items-center mx-1">
									<span><i class="ion-ios-cart"></i></span>
								</a>
								<!-- 찜하기 -->
								<a href="/easycook/mypage/wishlistAdd/${row.productNo}"
									class="heart d-flex justify-content-center align-items-center ">
									<span><i class="ion-ios-heart"></i></span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</section>

<script>
	function geo_error() { 
	   alert("위치 정보를 사용할 수 없습니다.");
	 };
	 
	function geo_options() {
		enableHighAccuracy: true
	  };
	 
	function showPosition(position) {
	 	var lat = position.coords.latitude; 
		var lng = position.coords.longitude; 
		loadJSON(lat,lng);
	}
	
	function loadJSON(lat,lng){
		
		$.getJSON('http://api.openweathermap.org/data/2.5/weather?lat=' + lat +'&lon='+ lng + '&appid=b183228f5584b086c11025ca242b360d&units=metric'
				,function(data){
			let $temp = data.main.temp;
			let $location = data.name;
			let $weather = data.weather[0].main;
			
			/* if($weather == "Clouds") {
				$weather = "구름";
			} else if($weather == "Rain") {
				$weather = "비";
			} else if ($weather == "Snow") {
				$weather = "눈";
			} else if ($weather == "Mist") {
				$weather = "안개";
			} else
				$weather = "맑음"; */
			$('.temp').append($temp + "°C");
			$('.weather').append('<img src="<%=request.getContextPath() %>/resources/weather/' + $weather + '.png">');
			
			/* $.ajax({
				url : '${pageContext.request.contextPath}/weatherCheck?weather='+ $weather,
				type : 'get',
				success : function(data) {
					console.log(data);
						/* ${list} = data;	 				
					}, error : function() {
							console.log("실패");
					}
				}); */
		}); 
	}
	
	function getLocation() {
		if (navigator.geolocation) {
		 navigator.geolocation.getCurrentPosition(showPosition, geo_error, geo_options);
		} else { 
			alert("Geolocation is not supported by this browser.");
		}
	}
getLocation();

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />