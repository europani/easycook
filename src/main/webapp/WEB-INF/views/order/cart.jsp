<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<body class="goto-here">

	<section class="ftco-section ftco-cart">
		<jsp:include page="/WEB-INF/views/common/mypageSidebar.jsp" />
		<div class="container">
			<h2>장바구니</h2>
			<hr>
			<br />
			<c:choose>
				<c:when test="${map.count == 0}">
         			장바구니가 비어있습니다.
         		</c:when>
				<c:otherwise>
					<form name="updateForm" id="updateForm" method="post"
						action="/easycook/mypage/cart/update">
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
										<c:set var="total" value="0"/>
											<c:forEach var="row" items="${list}" varStatus="i">
												<tr class="text-center">
													<td class="product-remove"><a
														href="/easycook/order/cart/delete?cartNo=${row.cart_no}"><span
															class="ion-ios-close"></span></a></td>
														<!-- 	이미지 넣어야함 -->
													 <td class="image-prod"><div class="img"
															style="background-image: url(../resources/images/${row.product_image});"></div></td> 

													<td class="product-name">
														<h3>${row.product_name}</h3> <!-- <p>Far far away, behind the word mountains, far from the countries</p> -->
													</td>

													<td class="price"><fmt:formatNumber
															value="${row.product_price}" pattern="###,###,###" />원</td>

													<td class="quantity">
														<div class="input-group mb-3">
															<input type="text" name="quantity"
																class="quantity form-control input-number" value="${row.cart_qty}" min="1">
														</div>
													</td>

													<td class="total"><fmt:formatNumber
															value="${row.money}" pattern="###,###,###" />원</td> 
												</tr>
												<c:set var="total" value="${total+row.money}"/>
												<!-- END TR-->
											</c:forEach>
											<c:out value="${total}"/>	
											<tr class="text-center">
												<td colspan="5" align="right"> 
												총 주문 금액 : <fmt:formatNumber value="${total}"
														pattern="###,###,###" />원
												</td>
											</tr>
											<!-- END TR-->
										</tbody>
									</table>
									
									<input type="hidden" name="count" value="${list.size()}">
									<button type="submit" id="btnUpdate">수정</button>

								</div>
							</div>
						</div>
					</form>
				</c:otherwise>
			</c:choose>
			
			<a href="/easycook/product" class="btn btn-primary py-3 px-5">상품목록보기</a>

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