<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
p{
    text-align: center;
 }

</style>
	<section class="ftco-section ftco-cart">
		
		<div class="container">
		<h1><p><b>주문을 완료했습니다.</b></p></h1>
			<hr>
			<br>
			<h2><b>[ 주문 정보 ]</b></h2>
			<hr>
			<br>
			<table class="paymentCustomer">
				<colgroup>
					<col style="width: 20%">
					<col style="width: 80%">
				</colgroup>
				<tbody>
					<tr>
						<th>주문일시</th>
						<td>${orders.ordersDate}</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${orders.id}</td>
					</tr>
				</tbody>
			</table>
			<br><br><br>
			<h2><b>[ 결제정보 ]</b></h2>
			<hr>
			<br>
			<table class="paymentCustomer">
				<colgroup>
					<col style="width: 20%">
					<col style="width: 80%">
				</colgroup>
				<tbody>
					<c:if test="${orders.check==1}">
					<tr>
						<th>쿠폰할인</th>
						<td>${orders.discountCoupon}% 할인적용</td>
					</tr>
					</c:if>
					<c:if test="${orders.check==2}">
					<tr>
						<th>적립금할인</th>
						<td>${orders.discountPoint}원 할인적용</td>
					</tr>
					</c:if>
					<tr>
						<th>결제 금액</th>
						<td><fmt:formatNumber value="${orders.ordersTotal}" pattern="###,###,###" />원</td>
					</tr>
				</tbody>
			</table>
			<br><br>
			<p><a href="/easycook" class="btn btn-primary py-3 px-5" style="text-align: center">홈으로</a></p>
		</div>
		</div>
	</section>
</body>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />