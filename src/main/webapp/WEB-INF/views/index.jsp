<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.deal {
  text-align: center;
  font-size: 60px;
  margin-top: 0px;
}
</style>
<body>
	<section class="search-section">
		<div class="container">
			<div class="row subscribe-from">
				<div class="col-md-12">
					<form class="form-inline col-md-12 wow fadeInDown animated" name="searchForm" method="POST" action="product">
						<div class="form-group">
							<input class="form-control subscribe" name="sentence">
							<button class="suscribe-btn" type="submit">
								<i class="pe-7s-search"></i>
							</button>
						</div>
					</form>
					<!-- end /. form -->
				</div>
			</div>
			<!-- end of/. row -->
		</div>
		<!-- end of /.container -->
	</section>
	<!-- end of /.news letter section -->

	<section class="slider-section">
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators slider-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="/easycook/resources/mart/images/best1.png" width="1648" height="600"
						alt="">
					<div class="carousel-caption"></div>
				</div>
				<div class="item">
					<img src="/easycook/resources/mart/images/best.png" width="1648" height="600"
						alt="">
					<div class="carousel-caption"></div>
				</div>
				<div class="item ">
					<img src="/easycook/resources/mart/images/best02.png" width="1648" height="600"
						alt="">
					<div class="carousel-caption"></div>
				</div>
			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="pe-7s-angle-left glyphicon-chevron-left" aria-hidden="true"></span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="pe-7s-angle-right glyphicon-chevron-right" aria-hidden="true"></span>
			</a>
		</div>
	</section>
	
		<!--------------------------------Best4 ---------------------->
	<section class="best-seller-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="titie-section wow fadeInDown animated ">
						<h1>BEST4</h1>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 col-sm-6 wow fadeInDown animated"
					data-wow-delay="0.2s">
					<div class="product-item">
						<img src="<%=request.getContextPath() %>/resources/product/product1.jpg" class="img-responsive"
							width="255" height="322" alt="">
						<div class="product-hover">
							<div class="product-meta">
								<a href="<%=request.getContextPath() %>/product/1001"><i class="pe-7s-cart"></i>detail</a>
							</div>
						</div>
						<div class="product-title">
							<a href="<%=request.getContextPath() %>/product/1001">
								<h3>비빔밥</h3>
							</a>
						</div>
					</div>
				</div>
				
				
				<div class="col-md-3 col-sm-6 wow fadeInDown animated"
					data-wow-delay="0.4s">
					<div class="product-item">
						<img src="<%=request.getContextPath() %>/resources/product/product19.jpg" class="img-responsive"
							width="255" height="322" alt="">
						<div class="product-hover">
							<div class="product-meta">
								<a href="<%=request.getContextPath() %>/product/3001"><i class="pe-7s-cart"></i>detail</a>
							</div>
						</div>
						<div class="product-title">
							<a href="<%=request.getContextPath() %>/product/3001">
								<h3>라멘</h3>
							</a>
						</div>
					</div>
				</div>
				
				
				<div class="col-md-3 col-sm-6 wow fadeInDown animated"
					data-wow-delay="0.6s">
					<div class="product-item">
						<img src="<%=request.getContextPath() %>/resources/product/product10.jpg" class="img-responsive"
							width="255" height="322" alt="">
						<div class="product-hover">
							<div class="product-meta">
								<a href="<%=request.getContextPath() %>/product/4003"><i class="pe-7s-cart"></i>detail</a>
							</div>
						</div>
						<div class="product-title">
							<a href="<%=request.getContextPath() %>/product/4003">
								<h3>햄박스테이크</h3>
							</a>
						</div>
					</div>
				</div> 
				<div class="col-md-3 col-sm-6 wow fadeInDown animated"
					data-wow-delay="0.8s">
					<div class="product-item">
						<img src="<%=request.getContextPath() %>/resources/product/product11.jpg" class="img-responsive"
							width="255" height="322" alt="">
						<div class="product-hover">
							<div class="product-meta">
								<a href="<%=request.getContextPath() %>/product/4004"><i class="pe-7s-cart"></i>detail</a>
							</div>
						</div>
						<div class="product-title">
							<a href="<%=request.getContextPath() %>/product/4004">
								<h3>폭립</h3>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ============================================================================= -->

<!-- 	
		<핫딜> 

	<section class="ftco-section img" style="background-image: url((/easycook/resources/mart/css/images/timeback.jpg);">
       <div class="container">
            <div class="row justify-content-end">
          <div class="col-md-6 heading-section ftco-animate deal-of-the-day ftco-animate">
             <span class="subheading">Best Price For You</span>
            <h2 class="mb-4">Deal of the day</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
            <h3><a href="#">Spinach</a></h3>
            <span class="price">$10 <a href="#">now $5 only</a></span>
            <div id="timer" class="d-flex mt-5">
                    <div class="time" id="days"></div>
                    <div class="time pl-3" id="hours"></div>
                    <div class="time pl-3" id="minutes"></div>
                    <div class="time pl-3" id="seconds"></div>
                  </div>
          </div>
        </div>         
       </div>
    </section> -->
	


	<!--------------------------------여기에 time sale 적용할것 ---------------------->
	<section class="offer-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 wow fadeInDown animated ">
					<h1>EVENT</h1>
					<h1>TIME SALE</h1>
					<h2>Up to 50% off</h2>
					<button
                       	onclick="location.href='today'"
                        class="btn btn-primary py-3 px-5">핫딜 보러가기
                    </button>
				</div>
			</div>
		</div>
	</section>
	<!-- ============================================================================= -->



	<!--------------------------------여기에 상품 적용할것 ---------------------->
	
<!-- --------------------------이거 쓸거에요  -->
	<section class="news-section">
		<div class="container">
			
			<div class="row">
				<div class="col-sm-4 wow fadeInDown animated" data-wow-delay="0.2s">
					<div class="blog-item">
						<img src="/easycook/resources/images/a11.jpg" width="350"
							height="262" alt="">
					</div>
				</div>
				<div class="col-sm-4 wow fadeInDown animated" data-wow-delay="0.4s">
					<div class="blog-item">
						<img src="/easycook/resources/images/a21.jpg" width="350"
							height="262" alt="">

					</div>
				</div>
				<div class="col-sm-4 wow fadeInDown animated" data-wow-delay="0.6s">
					<div class="blog-item">
						<img src="/easycook/resources/images/a31.jpg" width="350"
							height="262" alt="">
						
						
					</div>
				</div>
			</div>
		</div>
	</section>
<!-- ------------------------------------------------------ -->
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />