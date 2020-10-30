<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	  table {
        border-collapse: collapse;
        width: 85%;
        height: 85%;
      }      
      th {
	   background: #f6f6f6;
	   padding-left : 15px;
       font-weight: bold;
       font-size: 16px;
       vertical-align: middle;
       border-top : 1px solid #999999;
       border-bottom: 1px solid #dbdbdb;
       height: 65px;
      }
      td {
       padding-left : 15px;       
       vertical-align: middle;     
       font-size: 15px;
       border-top : 1px solid #999999;     
       border-bottom: 1px solid #dbdbdb;
       height: 65px;
      }

</style>
</head>
<body>
<table>
	<thead>
	<tr>
		<th>상품번호</th>
		<th>상품명</th>
	    <th>수량</th>
	    <th>결제금액</th>
	</tr>
	</thead>
	<tbody>
	
	<c:forEach var="ordersDetail" items="${detail }">
	<tr>
		<td>No. ${ordersDetail.product.productNo }</td>
		<td>${ordersDetail.product.productName }</td>
		<td>${ordersDetail.ordersDetail.detailQty }개</td>
		<td>${ordersDetail.product.productPrice * ordersDetail.ordersDetail.detailQty }원 </td>
	</tr>
	</c:forEach>	
	</tbody>
</table>
<%-- <table>
      <colgroup>
      	<col style="width:20%">
      	<col style="width:80%">
      </colgroup>
      	<tbody>
      	<tr>
      		<th>총 구매금액</th>
      		<td>0</td>
      	</tr>
      	<tr>
      		<th>실 결제금액</th>
      		<td>${totalpay }원</td>
      	</tr>
      	</tbody>   
</table> --%>
<h2 align="center">총 결제금액 : ${totalpay }원</h2>
<h4 align="center"><input type="button" value="닫기" onclick="window.close()"></h4>
</body>
</html>