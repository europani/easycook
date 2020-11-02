<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>이지쿡 주문하기</title>
<style>
.payment-container {
	width: 95%;
	margin: 0px auto;
	padding: 50px 10px 10px 10px;
}

.payment-content {
	width: 85%;
	padding: 20px;
	margin-bottom: 20px;
	float: right;
}

.payment-content2 {
	width: 85%;
	padding: 20px;
	margin-bottom: 20px;
	float: right;
}

.payment-content3 {
	width: 85%;
	height: 80px;
	padding-left: 40px;
	margin-right: 40px;
	border: 3px solid #d6d6d6;
	float: right;
	text-align: left;
	font-size: 20px;
}

.payment-pay {
	float: right;
}

.payment-bottom {
	clear: both;
	padding: 20px;
}

.btn-payment { /* 나중에 추가할 버튼양식 */
	display: inline-block;
	position: absolute;
	margin-left: 40rem;
	width: 120px;
	height: 50px;
	line-height: 30px;
	background-color: rgba(0, 0, 0, 0.1);
	font-size: 20px;
	font-weight: border;
	color: black;
	vertical-align: top;
	margin-top: 15px;
	text-align: center;
}
/* 결제정보 넣을예정 */
.CartList {
	width: 85%;
	height: 350px;
}
/* 테이블 */
.paymentCustomer {
	border-collapse: collapse;
	width: 85%;
}

.paymentCustomer th {
	background: #f6f6f6;
	padding-left: 15px;
	font-weight: bold;
	font-size: 16px;
	vertical-align: middle;
	border-top: 1px solid #999999;
	border-bottom: 1px solid #dbdbdb;
	height: 65px;
}

.paymentCustomer td {
	padding-left: 15px;
	vertical-align: middle;
	font-size: 15px;
	border-top: 1px solid #999999;
	border-bottom: 1px solid #dbdbdb;
	height: 65px;
}
</style>
</head>
<body>
	<section class="ftco-section ftco-cart">
		<div class="container">
			<h2>주문하기 [ ${list.size()}개 ]</h2>
			<hr>
			<br />
			<c:choose>
				<c:when test="${list.size() == 0}">
         			주문할 상품이 없습니다.
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
												<td class="image-prod"><div class="img"
														style="background-image: url(../resources/images/${row.product.productImage});"></div></td>

												<td class="product-name">
													<h3>${row.product.productName}</h3>
												</td>

												<td class="price"><fmt:formatNumber
														value="${row.product.productPrice}" pattern="###,###,###" />원</td>

												<td class="quantity">
													<div class="input-group mb-3">
														<input type="text" name="quantity"
															class="quantity form-control input-number"
															value="${row.cartQty}" min="1">
													</div>
												</td>
												<c:set var="money"
													value="${row.product.productPrice * row.cartQty}" />
												<td class="total"><fmt:formatNumber value="${money}"
														pattern="###,###,###" />원</td>
											</tr>
											<c:set var="total" value="${total+money}" />
											<!-- END TR-->
										</c:forEach>
										<!-- END TR-->
									</tbody>
								</table>


							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>


	</section>
	<div class="payment-container">
		<div class="payment-content">
			<h4>주문자 정보</h4>
			<hr>
			<br>
			<table class="paymentCustomer">
				<colgroup>
					<col style="width: 20%">
					<col style="width: 80%">
				</colgroup>
				<tbody>
					<tr>
						<th>주문하시는 분</th>
						<td>${list[0].member.name}</td>
						
					</tr>
					<tr>
						<th>연락처</th>
						<td>${list[0].member.tel}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${list[0].member.email}</td>
						
					</tr>
				</tbody>
			</table>
		</div>

		<div class="payment-content2">
			<h4>결제정보</h4>
			<hr>
			<br>
			<table class="paymentCustomer">
				<colgroup>
					<col style="width: 20%">
					<col style="width: 80%">
				</colgroup>
				<tbody>
					<tr>
						<th>상품 합계 금액</th>
						<td><fmt:formatNumber value="${total}" pattern="###,###,###" />원</td>
					</tr>
					<tr>
						<th>배송비</th>
						<c:if test="${total >= 50000}">
							<c:set var="fee" value="0" />
							<td><c:out value="${fee}" /> 원</td>
						</c:if>


						<c:if test="${total < 50000}">
							<c:set var="fee" value="2500" />
							<td><c:out value="${fee}" /> 원 (※ 5만원 이상 주문시 무료)</td>
						</c:if>
					</tr>
					
					
					<tr>
						<th>쿠폰 사용</th>
						<td>
							<p id="couponDiscount">[ 적용된 쿠폰이 없습니다. ]</p>
							<button
								onclick="document.getElementById('id01').style.display='block'"
								class="btn btn-primary py-3 px-5">사용가능한 쿠폰 확인</button>

							<div id="id01" class="w3-modal w3-animate-opacity">
								<div class="w3-modal-content w3-card-4">
									<header class="w3-container w3-teal">
										<br> <br> <span
											onclick="document.getElementById('id01').style.display='none'"
											class="w3-button w3-large w3-display-right">&times;</span>
										<h3 align="center">${list[0].member.name}님이보유중인쿠폰</h3>
									</header>

									<div class="w3-container">
										<c:choose>
											<c:when test="${list2.size() == null }">
												<p>
													<b>사용가능한 쿠폰이 없습니다.</b>
												</p>
											</c:when>
											<c:otherwise>
												<ul>
													<c:forEach var="row2" items="${list2}" varStatus="i">
														<li><input type="radio" name="coupon"
															value="${row2.couponDiscount}"> [
															${row2.couponTitle} ] ${row2.couponDiscount}% 할인
															(${row2.couponSdate} ~ ${row2.couponEdate}) <%--<c:if test="${row2.couponType == 0}">
													</c:if>
													<c:if test="${row2.couponType == 1}">
													${row2.couponDiscount}원 할인 
													</c:if> --%></li>
													</c:forEach>
												</ul>
												<button type="button" name="button" id="radioButton">쿠폰
													적용</button>
												<!-- <button type="button" name="button" id="radioButton2">set radio Value</button> -->
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div> <!-- End Modal -->
						</td>
					</tr>
					
					
					<tr>
						<th>적립금 사용</th>
						<td><p id="point">보유 적립금 : ${list[0].member.point}</p>
						<button type="button" class="btn btn-primary py-3 px-5" id="pointButton" value="${list[0].member.point}">적립금 모두 사용하기</button></td>
					</tr>
					
					<tr>
						<th>최종 결제 금액</th>
						<input type="hidden" id="total" value="${total}" />
						<input type="hidden" id="fee" value="${fee}" />
						
						<c:set var="finalTotal" value="${total + fee}" />	
						<td><p id="finalTotal">${finalTotal}원</p></td>
						
					</tr>
				</tbody>
			</table>
		</div>
		<div class="payment-content3"></div>
		<div class="payment-pay">
		
		<a href="/easycook/order/paymentComplete">결제하기</a>
		<%-- <form action="/easycook/order/paymentComplete" method="post" id="paymentForm">
			<input type="hidden"  id="checkForm" name="check" value="${check}" />
			<input type="hidden" name="name" value="${list[0].member.name}" />
			<input type="hidden" name="tel" value="${list[0].member.tel}" />
			<input type="hidden" name="email" value="${list[0].member.email}" />
			<input type="hidden" id="finalTotalform" name="finalTotal" value="${finalTotal}" />	
		</form>
		<button class="btn-payment" type="submit" form="paymentForm">결제하기</button> --%>
		
		</div>

	</div>
	<div class="payment-bottom">
		<br>
	</div>
</body>

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$('#radioButton').click(
						function() {
							var radioVal = $('input[name=coupon]:checked').val();
							$('#couponDiscount').html(radioVal + "% 할인이 적용됩니다.");

							var total = $('#total').val() - $('#total').val() * (radioVal / 100);

							var finalTotal = parseInt($('#fee').val()) + parseInt(total);
							$('#point').html("쿠폰과 중복적용되지 않습니다.");
							
							
							$('#finalTotal').html(finalTotal + "원");
							$('#finalTotalform').val(finalTotal);
							
							
							$('#checkForm').val(1);
							
							$('#id01').css("display", "none");
						});

				$('#pointButton').click(
						function() {
							var pointVal = $(this).val();
							
							$('#point').html("적립금 "+ pointVal + "원 만큼 할인 적용 됩니다.");

							var total = $('#total').val() - pointVal;

							var finalTotal = parseInt($('#fee').val()) + parseInt(total);
							$('#couponDiscount').html("적립금과 중복적용되지 않습니다.");
							
							$('#finalTotal').html(finalTotal + "원");
							
							$('#checkForm').val(2);
							
							$('#finalTotalform').val(finalTotal);
							
						});
			});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />