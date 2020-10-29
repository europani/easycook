<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${orders.ordersNo } 상세정보</title>
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
		<td>${orders.product.productNo }</td>
		<td>${orders.product.productName }</td>
		<td>${orders.ordersDetail.detailQty }</td>
		<td>각상품 결제금액 </td>
	</tr>
	</tbody>
</table>
총 결제금액 : ${orders.ordersTotal }
</body>
</html>