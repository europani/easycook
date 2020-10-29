<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body class="goto-here">

	<section class="ftco-section ftco-cart">
		<jsp:include page="/WEB-INF/views/common/mypageSidebar.jsp" />
		<div class="container">
			<h2>장바구니 [ ${list.size()}개 ]</h2>
			<hr>
			<br />
			<c:choose>
				<c:when test="${list.size()} == null">
         			장바구니가 비어있습니다.
         		</c:when>
				<c:otherwise>
						<div class="row">
							<div class="col-md-12 ftco-animate">
								<div class="cart-list">
									<table class="table">
										<thead class="thead-primary">
											<tr class="text-center">
												<th>&nbsp;</th>
												<th>상품목록</th>
												<th>&nbsp;</th>
												<th>가격</th>
												<th>수량</th>
												<th>총액</th>
											</tr>
										</thead>
										<tbody>
											<c:set var="total" value="0" />
											<c:forEach var="row" items="${list}" varStatus="i">
												<tr class="text-center">
													<td class="product-remove">
														
														
														<button
															onclick="document.getElementById('id01').style.display='block'"
															class="ion-ios-close"></button> 
													
														<div id="id01" class="w3-modal w3-animate-opacity">
															<div class="w3-modal-content w3-card-4">
																<header class="w3-container w3-teal">
																	<span
																		onclick="document.getElementById('id01').style.display='none'"
																		class="w3-button w3-large w3-display-topright">&times;</span>
																	<h3>${row.product_name}를 장바구니에서 삭제하시겠습니까?</h3>
																</header>
																<div class="w3-container">
																	
																	<p><h3><a href="/easycook/order/cart/delete?cart_no=${row.cart_no}">
																	<span>Yes</span></a></h3></p>
																</div>
															</div>
														</div>
													<!-- End Modal -->
													</td>

													<td class="image-prod"><div class="img"
															style="background-image: url(../resources/images/${row.product_image});"></div></td>

													<td class="product-name">
														<h3>${row.product_name}</h3>
													</td>

													<td class="price"><fmt:formatNumber
															value="${row.product_price}" pattern="###,###,###" />원</td>

													<td class="quantity">
														<div class="input-group mb-3">
															<input type="text" name="quantity"
																class="quantity form-control input-number"
																value="${row.cart_qty}" min="1">
														</div>
													</td>

													<td class="total"><fmt:formatNumber
															value="${row.money}" pattern="###,###,###" />원</td>
												</tr>
												<c:set var="total" value="${total+row.money}" />
												<!-- END TR-->
											</c:forEach>
											<c:out value="${total}" />
											<tr class="text-center">
												<td colspan="4" align="right"><b>상품 합계 금액 : <fmt:formatNumber
														value="${total}" pattern="###,###,###" />원</b>
												</td>
												<td><a href="/easycook/product" class="btn btn-primary py-3 px-5">상품목록보기</a></td>	
												<td><a href="/easycook/order/order" class="btn btn-primary py-3 px-5">주문하기</a></td>	
											</tr>
											<!-- END TR-->
										</tbody>
									</table>
									<form name="headerForm" method="post" action="/easycook">
										<input type="hidden" name="count" value="${list.size()}">
									</form>
								</div>
							</div>
						</div>
				</c:otherwise>
			</c:choose>
 
				
			<div class="mouse">
				<a href="#" class="mouse-icon">
					<div class="mouse-wheel">
						<span class="ion-ios-arrow-up"></span>
					</div>
				</a>
			</div>
		</div>
	</section>
	<!--   <script>
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