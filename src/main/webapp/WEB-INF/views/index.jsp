<jsp:include page="common/header.jsp" />
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
					<form class="form-inline col-md-12 wow fadeInDown animated">
						<div class="form-group">
							<input type="email" class="form-control subscribe" id="email"
								placeholder="Search...">
							<button class="suscribe-btn">
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
					<img src="/easycook/resources/mart/images/slider.jpg" width="1648" height="600"
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

	<!-- 핫딜 -->


	<section class="best-seller-section"
		style="background-image: url(/easycook/resources/mart/images/slider.jpg);">
		
		<p id="demo" class="deal" style="margin-top: 95px;"></p>
		<img src="/easycook/resources/mart/images/hulk.jpg">

		<script>
			var countDownDate = new Date("Oct 21, 2020 15:37:25").getTime();
			var x = setInterval(function() {
				var now = new Date().getTime();
				var distance = countDownDate - now;
				var days = Math.floor(distance / (1000 * 60 * 60 * 24));
				var hours = Math.floor((distance % (1000 * 60 * 60 * 24))
						/ (1000 * 60 * 60));
				var minutes = Math.floor((distance % (1000 * 60 * 60))
						/ (1000 * 60));
				var seconds = Math.floor((distance % (1000 * 60)) / 1000);
				document.getElementById("demo").innerHTML = days + "일 " + hours
						+ "시 " + minutes + "분 " + seconds + "초 ";

				if (distance < 0) {
					clearInterval(x);
					document.getElementById("demo").innerHTML = "EXPIRED";
				}
			}, 1000);
		</script>

	</section>



	<!--------------------------------여기에 time sale 적용할것 ---------------------->
	<section class="offer-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 wow fadeInDown animated ">
					<h1>TIME SALE</h1>
					<h2>Up to 35% off</h2>
				</div>
			</div>
		</div>
	</section>
	<!-- ============================================================================= -->

	<!--------------------------------여기에 Best 적용할것 ---------------------->
	<section class="best-seller-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="titie-section wow fadeInDown animated ">
						<h1>BEST SELLERS</h1>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 col-sm-6 wow fadeInDown animated"
					data-wow-delay="0.2s">
					<div class="product-item">
						<img src="/easycook/resources/mart/images/1.png" class="img-responsive"
							width="255" height="322" alt="">
						<div class="product-hover">
							<div class="product-meta">
								<a href="#"><i class="pe-7s-like"></i></a> <a href="#"><i
									class="pe-7s-shuffle"></i></a> <a href="#"><i
									class="pe-7s-clock"></i></a> <a href="#"><i class="pe-7s-cart"></i>Add
									to Cart</a>
							</div>
						</div>
						<div class="product-title">
							<a href="#">
								<h3>Blue Tshirt</h3> <span>$26</span>
							</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 wow fadeInDown animated"
					data-wow-delay="0.4s">
					<div class="product-item">
						<img src="/easycook/resources/mart/images/2.png" class="img-responsive"
							width="255" height="322" alt="">
						<div class="product-hover">
							<div class="product-meta">
								<a href="#"><i class="pe-7s-like"></i></a> <a href="#"><i
									class="pe-7s-shuffle"></i></a> <a href="#"><i
									class="pe-7s-clock"></i></a> <a href="#"><i class="pe-7s-cart"></i>Add
									to Cart</a>
							</div>
						</div>
						<div class="product-title">
							<a href="#">
								<h3>WOMAN shirt</h3> <span>$31</span>
							</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 wow fadeInDown animated"
					data-wow-delay="0.6s">
					<div class="product-item">
						<img src="/easycook/resources/mart/images/3.png" class="img-responsive"
							width="255" height="322" alt="">
						<div class="product-hover">
							<div class="product-meta">
								<a href="#"><i class="pe-7s-like"></i></a> <a href="#"><i
									class="pe-7s-shuffle"></i></a> <a href="#"><i
									class="pe-7s-clock"></i></a> <a href="#"><i class="pe-7s-cart"></i>Add
									to Cart</a>
							</div>
						</div>
						<div class="product-title">
							<a href="#">
								<h3>YELLOW Tshirt</h3> <span>$21</span>
							</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 wow fadeInDown animated"
					data-wow-delay="0.8s">
					<div class="product-item">
						<img src="/easycook/resources/mart/images/4.png" class="img-responsive"
							width="255" height="322" alt="">
						<div class="product-hover">
							<div class="product-meta">
								<a href="#"><i class="pe-7s-like"></i></a> <a href="#"><i
									class="pe-7s-shuffle"></i></a> <a href="#"><i
									class="pe-7s-clock"></i></a> <a href="#"><i class="pe-7s-cart"></i>Add
									to Cart</a>
							</div>
						</div>
						<div class="product-title">
							<a href="#">
								<h3>Cool lingerie</h3> <span>$56</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ============================================================================= -->

	<!--------------------------------여기에 상품 적용할것 ---------------------->
	<section class="featured-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="titie-section wow fadeInDown animated ">
						<h1>FEATURED PRODUCTS</h1>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="filter-menu">
						<ul class="button-group sort-button-group">
							<li class="button active" data-category="all">All<span>8</span></li>
							<li class="button" data-category="cat-1">Dresses and Suits<span>2</span></li>
							<li class="button" data-category="cat-2">Accessories<span>2</span></li>
							<li class="button" data-category="cat-3">Miscellaneous<span>4</span></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row featured isotope">
				<div
					class="col-md-3 col-sm-6 col-xs-12 cat-3 featured-items isotope-item">
					<div class="product-item">
						<img src="/easycook/resources/mart/images/product1.png" class="img-responsive"
							width="255" height="322" alt="">
						<div class="sell-meta">
							<a href="#" class="new-item">New</a> <a href="#"
								class="sell-item">Sell</a>
						</div>
						<div class="product-hover">
							<div class="product-meta">
								<a href="#"><i class="pe-7s-like"></i></a> <a href="#"><i
									class="pe-7s-shuffle"></i></a> <a href="#"><i
									class="pe-7s-clock"></i></a> <a href="#"><i class="pe-7s-cart"></i>Add
									to Cart</a>
							</div>
						</div>
						<div class="product-title">
							<a href="#">
								<h3>Cool lingerie</h3> <span>$26</span>
							</a>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 col-sm-6 col-xs-12 cat-2 featured-items isotope-item">
					<div class="product-item">
						<img src="/easycook/resources/mart/images/product2.png" class="img-responsive"
							width="255" height="322" alt="">
						<div class="sell-meta">
							<a href="#" class="new-item">New</a>
						</div>
						<div class="product-hover">
							<div class="product-meta">
								<a href="#"><i class="pe-7s-like"></i></a> <a href="#"><i
									class="pe-7s-shuffle"></i></a> <a href="#"><i
									class="pe-7s-clock"></i></a> <a href="#"><i class="pe-7s-cart"></i>Add
									to Cart</a>
							</div>
						</div>
						<div class="product-title">
							<a href="#">
								<h3>Cool lingerie</h3> <span>$21</span>
							</a>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 col-sm-6 col-xs-12 cat-1 featured-items isotope-item">
					<div class="product-item">
						<img src="/easycook/resources/mart/images/product3.png" class="img-responsive"
							width="255" height="322" alt="">
						<div class="sell-meta">
							<a href="#" class="new-item">New</a> <a href="#"
								class="sell-item">Sell</a>
						</div>
						<div class="product-hover">
							<div class="product-meta">
								<a href="#"><i class="pe-7s-like"></i></a> <a href="#"><i
									class="pe-7s-shuffle"></i></a> <a href="#"><i
									class="pe-7s-clock"></i></a> <a href="#"><i class="pe-7s-cart"></i>Add
									to Cart</a>
							</div>
						</div>
						<div class="product-title">
							<a href="#">
								<h3>Cool lingerie</h3> <span>$31</span>
							</a>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 col-sm-6 col-xs-12 cat-3 featured-items isotope-item">
					<div class="product-item">
						<img src="/easycook/resources/mart/images/product4.png" class="img-responsive"
							width="255" height="322" alt="">
						<div class="sell-meta">
							<a href="#" class="sell-item">Sell</a>
						</div>
						<div class="product-hover">
							<div class="product-meta">
								<a href="#"><i class="pe-7s-like"></i></a> <a href="#"><i
									class="pe-7s-shuffle"></i></a> <a href="#"><i
									class="pe-7s-clock"></i></a> <a href="#"><i class="pe-7s-cart"></i>Add
									to Cart</a>
							</div>
						</div>
						<div class="product-title">
							<a href="#">
								<h3>Cool lingerie</h3> <span>$56</span>
							</a>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 col-sm-6 col-xs-12 cat-2 featured-items isotope-item">
					<div class="product-item">
						<img src="/easycook/resources/mart/images/product5.png" class="img-responsive"
							width="255" height="322" alt="">
						<div class="sell-meta">
							<a href="#" class="sell-item">Sell</a>
						</div>
						<div class="product-hover">
							<div class="product-meta">
								<a href="#"><i class="pe-7s-like"></i></a> <a href="#"><i
									class="pe-7s-shuffle"></i></a> <a href="#"><i
									class="pe-7s-clock"></i></a> <a href="#"><i class="pe-7s-cart"></i>Add
									to Cart</a>
							</div>
						</div>
						<div class="product-title">
							<a href="#">
								<h3>Cool lingerie</h3> <span>$26</span>
							</a>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 col-sm-6 col-xs-12 cat-3 featured-items isotope-item">
					<div class="product-item">
						<img src="/easycook/resources/mart/images/product6.png" class="img-responsive"
							width="255" height="322" alt="">
						<div class="sell-meta">
							<a href="#" class="new-item">New</a> <a href="#"
								class="sell-item">Sell</a>
						</div>
						<div class="product-hover">
							<div class="product-meta">
								<a href="#"><i class="pe-7s-like"></i></a> <a href="#"><i
									class="pe-7s-shuffle"></i></a> <a href="#"><i
									class="pe-7s-clock"></i></a> <a href="#"><i class="pe-7s-cart"></i>Add
									to Cart</a>
							</div>
						</div>
						<div class="product-title">
							<a href="#">
								<h3>Cool lingerie</h3> <span>$36</span>
							</a>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 col-sm-6 col-xs-12 cat-1 featured-items isotope-item">
					<div class="product-item">
						<img src="/easycook/resources/mart/images/product7.png" class="img-responsive"
							width="255" height="322" alt="">
						<div class="sell-meta">
							<a href="#" class="new-item">New</a>
						</div>
						<div class="product-hover">
							<div class="product-meta">
								<a href="#"><i class="pe-7s-like"></i></a> <a href="#"><i
									class="pe-7s-shuffle"></i></a> <a href="#"><i
									class="pe-7s-clock"></i></a> <a href="#"><i class="pe-7s-cart"></i>Add
									to Cart</a>
							</div>
						</div>
						<div class="product-title">
							<a href="#">
								<h3>Cool lingerie</h3> <span>$56</span>
							</a>
						</div>
					</div>
				</div>
				<div
					class="col-md-3 col-sm-6 col-xs-12 cat-3 featured-items isotope-item">
					<div class="product-item">
						<img src="/easycook/resources/mart/images/product8.png" class="img-responsive"
							width="255" height="322" alt="">
						<div class="sell-meta">
							<a href="#" class="sell-item">Sell</a>
						</div>
						<div class="product-hover">
							<div class="product-meta">
								<a href="#"><i class="pe-7s-like"></i></a> <a href="#"><i
									class="pe-7s-shuffle"></i></a> <a href="#"><i
									class="pe-7s-clock"></i></a> <a href="#"><i class="pe-7s-cart"></i>Add
									to Cart</a>
							</div>
						</div>
						<div class="product-title">
							<a href="#">
								<h3>Cool lingerie</h3> <span>$66</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ============================================================================= -->

	<section class="review-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="titie-section wow fadeInDown animated ">
						<h1>customer review</h1>
					</div>
				</div>
			</div>
			<div class="row">
				<div id="feedback" class="carousel slide feedback"
					data-ride="feedback">
					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="/easycook/resources/mart/images/member1.png" width="320" height="439"
								alt="">
							<div class="carousel-caption">
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
									Aenean commodo ligula eget dolor. Aenean massa. Cum sociis
									natoque penatibus et magnis dis parturient montes, nascetur
									ridiculus mus. Donec quam felis, ultricies nec, pellentesque
									eu, pretium quis, sem. Nulla consequat massa quis enim. Donec
									pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.
									In enim justo, rhoncus ut,</p>
								<h3>- Olivia -</h3>
								<span>Melbour, Aus</span>
							</div>
						</div>
						<div class="item">
							<img src="/easycook/resources/mart/images/member2.png" width="320" height="439"
								alt="">
							<div class="carousel-caption">
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
									Aenean commodo ligula eget dolor. Aenean massa. Cum sociis
									natoque penatibus et magnis dis parturient montes, nascetur
									ridiculus mus. Donec quam felis, ultricies nec, pellentesque
									eu, pretium quis, sem. Nulla consequat massa quis enim. Donec
									pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.
									In enim justo, rhoncus ut,</p>
								<h3>- Olivia -</h3>
								<span>Melbour, Aus</span>
							</div>
						</div>
						<div class="item">
							<img src="/easycook/resources/mart/images/member3.png" width="320" height="439"
								alt="">
							<div class="carousel-caption">
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
									Aenean commodo ligula eget dolor. Aenean massa. Cum sociis
									natoque penatibus et magnis dis parturient montes, nascetur
									ridiculus mus. Donec quam felis, ultricies nec, pellentesque
									eu, pretium quis, sem. Nulla consequat massa quis enim. Donec
									pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.
									In enim justo, rhoncus ut,</p>
								<h3>- Olivia -</h3>
								<span>Melbour, Aus</span>
							</div>
						</div>
					</div>
					<!-- Indicators -->
					<ol class="carousel-indicators review-controlar">
						<li data-target="#feedback" data-slide-to="0" class="active">
							<img src="/easycook/resources/mart/images/member1.png" width="320" height="439"
							alt="">
						</li>
						<li data-target="#feedback" data-slide-to="1"><img
							src="/easycook/resources/mart/images/member2.png" width="320" height="439" alt=""></li>
						<li data-target="#feedback" data-slide-to="2"><img
							src="/easycook/resources/mart/images/member3.png" width="320" height="439" alt=""></li>
					</ol>
				</div>
			</div>
		</div>
	</section>

	<section class="news-letter-section">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="titie-section white wow fadeInDown animated ">
						<h1>NEWSLETTER</h1>
					</div>
					<p>Follow a collection of news & promotions</p>
				</div>
			</div>
			<div class="row subscribe-from">
				<form
					class="form-inline col-md-6 col-md-offset-3 col-xs-10 col-xs-offset-1  wow fadeInDown animated">
					<div class="form-group">
						<input type="email" class="form-control subscribe" id="email"
							placeholder="Enter your email">
						<button class="suscribe-btn">
							<i class="pe-7s-next"></i>
						</button>
					</div>
				</form>
				<!-- end /. form -->
			</div>
			<!-- end of/. row -->
		</div>
		<!-- end of /.container -->
	</section>
	<!-- end of /.news letter section -->

	<section class="client-section">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="titie-section wow fadeInDown animated ">
						<h1>our partner</h1>
					</div>
				</div>
			</div>
			<div id="client" class="row owl-carousel owl-theme client-area">
				<div class="col-md-12 item">
					<a href="#"> <img src="/easycook/resources/mart/images/client_01.jpg"
						class="img-responsive" width="300" height="200" alt="">
					</a>
				</div>
				<div class="col-md-12 item">
					<a href="#"> <img src="/easycook/resources/mart/images/client_02.jpg"
						class="img-responsive" width="300" height="200" alt="">
					</a>
				</div>
				<div class="col-md-12 item">
					<a href="#"> <img src="/easycook/resources/mart/images/client_03.jpg"
						class="img-responsive" width="300" height="200" alt="">
					</a>
				</div>
				<div class="col-md-12 item">
					<a href="#"> <img src="/easycook/resources/mart/images/client_04.jpg"
						class="img-responsive" width="300" height="200" alt="">
					</a>
				</div>
				<div class="col-md-12 item">
					<a href="#"> <img src="/easycook/resources/mart/images/client_01.jpg"
						class="img-responsive" width="300" height="200" alt="">
					</a>
				</div>
				<div class="col-md-12 item">
					<a href="#"> <img src="/easycook/resources/mart/images/client_02.jpg"
						class="img-responsive" width="300" height="200" alt="">
					</a>
				</div>
				<div class="col-md-12 item">
					<a href="#"> <img src="/easycook/resources/mart/images/client_03.jpg"
						class="img-responsive" width="300" height="200" alt="">
					</a>
				</div>
				<div class="col-md-12 item">
					<a href="#"> <img src="/easycook/resources/mart/images/client_04.jpg"
						class="img-responsive" width="300" height="200" alt="">
					</a>
				</div>
			</div>
			<div class="customNavigation works-navigation">
				<a class="btn-work works-prev"><i class="pe-7s-angle-left"></i></a>
				<a class="btn-work works-next"><i class="pe-7s-angle-right"></i></a>
			</div>
			<!-- end of /.client navigation -->
		</div>
	</section>

	<section class="news-section">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="titie-section wow fadeInDown animated ">
						<h1>Latest News</h1>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 wow fadeInDown animated" data-wow-delay="0.2s">
					<div class="blog-item">
						<a href="#"><img src="/easycook/resources/mart/images/blog1.jpg" width="350"
							height="262" alt=""></a>
						<h3>Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet.
							Aenean</h3>
						<p>Nam nec tellus a odio tincidunt auc. Duis sed odio sit amet
							nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum
							velit. Nam nec tellus a odio tincidunt</p>
						<a href="#">Read More</a>
					</div>
				</div>
				<div class="col-sm-4 wow fadeInDown animated" data-wow-delay="0.4s">
					<div class="blog-item">
						<a href="#"><img src="/easycook/resources/mart/images/blog2.jpg" width="350"
							height="262" alt=""></a>
						<h3>Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet.
							Aenean</h3>
						<p>Nam nec tellus a odio tincidunt auc. Duis sed odio sit amet
							nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum
							velit. Nam nec tellus a odio tincidunt</p>
						<a href="#">Read More</a>

					</div>
				</div>
				<div class="col-sm-4 wow fadeInDown animated" data-wow-delay="0.6s">
					<div class="blog-item">
						<a href="#"><img src="/easycook/resources/mart/images/blog3.jpg" width="350"
							height="262" alt=""></a>
						<h3>Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet.
							Aenean</h3>
						<p>Nam nec tellus a odio tincidunt auc. Duis sed odio sit amet
							nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum
							velit. Nam nec tellus a odio tincidunt</p>
						<a href="#">Read More</a>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
<jsp:include page="common/footer.jsp" />