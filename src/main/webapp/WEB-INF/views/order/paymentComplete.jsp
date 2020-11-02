<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<meta charset="UTF-8">
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
<body>
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
				</tbody>
			</table>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />