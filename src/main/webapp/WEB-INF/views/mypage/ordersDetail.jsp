<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style type="text/css">
	  #jb-container {
        width: 95%;
        margin: 0px auto;
        padding: 50px 10px 10px 10px;
        /* border: 1px solid #bcbcbc; */
      }
      #jb-content {
        width: 85%;
        padding: 20px;
        margin-bottom: 20px;
        float: right;
      }
      #jb-bottom {
        clear: both;
        padding: 20px;
      }



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

<div id="jb-container">
    <jsp:include page="/WEB-INF/views/common/mypageSidebar.jsp" />
	 	<div id="jb-content">
	   	<h3>상세주문정보</h3>
	        <hr>
	        <br>	       
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
	<h2 align="center">총 결제금액 : ${totalpay }원</h2>
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
	
		</div>
	  <div id="jb-bottom">
        <br/>
      </div>
</div>
</body>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />