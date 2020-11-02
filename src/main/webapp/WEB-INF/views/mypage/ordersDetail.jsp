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
        padding: 50px 10px 100px 10px;
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
      
      .btn-refund {   /* 나중에 추가할 버튼양식 */
       display: inline-block;
       position : absolute;
       margin-left: -6rem;
       width: 70px;
       height: 30px;
       line-height: 30px;
       background-color: rgba(0,0,0,0.1);
       font-size: 13px;
       font-weight : border;
       color: white;
       vertical-align: top;
       margin-top : -2px;
       text-align: center;
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
		    <th>상품총액</th>
		    <th width="15%"></th>
		</tr>
		</thead>
		<tbody>
		
		<c:forEach var="ordersDetail" items="${detail }">
		<tr>
			<td>No. ${ordersDetail.product.productNo }</td>
			<td>${ordersDetail.product.productName }</td>
			<td>${ordersDetail.ordersDetail.detailQty }개</td>
			<td>
			${ordersDetail.product.productPrice * ordersDetail.ordersDetail.detailQty }원
			</td>
			<td>
				<form method="post" action="<%=request.getContextPath() %>/mypage/cancelRequire" >  
			         <c:if test="${ordersDetail.ordersStatus eq '배송완료'}">
			         <input type="submit" class="btn-refund" value='반품신청'>
			         <input type="hidden" name="productNo" id="productNo" value="${ordersDetail.product.productNo}">
			         <input type="hidden" name="ordersNo" id="ordersNo" value="${orderNum}">
			         </c:if>
	          	</form> 
				<c:if test="${ordersDetail.ordersDetail.reviewCheck == 0}">
				<button onclick="location.href='/easycook/mypage/review?productNo=${ordersDetail.product.productNo}&ordersNo=${ordersNo}'">리뷰쓰기</button>
				</c:if>
			</td>
		</tr>
		</c:forEach>	
		</tbody>
	</table>	
	<table>
	      <colgroup>
	      	<col style="width:20%">
	      	<col style="width:80%">
	      </colgroup>
	      	<tbody>
	      	<c:if test="${discountPercent != null }">
	      	<tr>
	      		<th>쿠폰적용</th>
	      		<td>${discountPercent }%</td>
	      	</tr>
	      	</c:if>
	      	<c:if test="${discountPercent == null }">
	      	<tr>
	      		<th>쿠폰적용</th>
	      		<td>마일리지 할인 적용</td>
	      	</tr>
	      	</c:if>
	      	<tr>
	      		<th>실 결제금액</th>
	      		<td>${totalpay }원</td>
	      	</tr>
	      	</tbody>   
	</table>
	
		</div>
	  <div id="jb-bottom">
        <br/>
      </div>
</div>
</body>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />