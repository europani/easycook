<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	table {
		margin: auto;
	}
	* {
		text-align: center;
	}

</style>
</head>
<body>
<table>
	<thead>
	<tr>
		<th>상품번호 <th>
		<th>상품명</th>
	    <th>수량</th>
	    <th>결제금액</th>
	</tr>
	</thead>
	<tbody>
	<tr>
	<c:forEach var="ordersDetail" items="${detail }">
		<td>${ordersDetail.product.productNo }</td>
		<td>${ordersDetail.product.productName }</td>
		<td>${ordersDetail.ordersDetail.detailQty }</td>
		<td>${ordersDetail.product.productPrice * ordersDetail.ordersDetail.detailQty } </td>
	</c:forEach>
	</tr>
	</tbody>
</table>
총 결제금액 : ${totalpay }
</body>
</html>