<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    <title>CSS</title>
    <style>
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
      .search-date {
         width: 70%;
         padding: 30px 20px 30px;
         margin : auto;
         float: center;
         background-color: #F8F8F8;
      }
      #content-detail2 {
         text-align: left;
      }
      
      .btn-search {   /* 나중에 추가할 버튼양식 */
       display: inline-block;
       margin-left: 30px;
       width: 103px;
       height: 36px;
       line-height: 36px;
       background-color: #606060;
       font-size: 14px;
       color: white;
       vertical-align: top;
       text-align: center;
      }
      .btn-cancle {   /* 나중에 추가할 버튼양식 */
       display: inline-block;
       position : absolute;
       margin-left: 5rem;
       width: 70px;
       height: 30px;
       line-height: 30px;
       background-color: rgba(0,0,0,0.1);
       font-size: 13px;
       font-weight : border;
       color: white;
       vertical-align: top;
       margin-top : -27px;
       text-align: center;
      }
      
      #order-table {
        border-collapse: collapse;
        width: 100%;
      }
      #order-table th {
      border-bottom: 1px solid #ddd;
      background: #f6f6f6;
      padding: 15px 20px; 
         font-weight: bold;
       font-size: 20px;
       vertical-align: middle;
       border-bottom: 1px solid #e0e0e0;
       background: #f6f6f6;
      }
      #order-table td {
           padding: 15px 20px; 
        vertical-align: middle;     
        font-size: 15px;     
           border-bottom: 1px solid #ddd;
      }
    
    
    </style>
  </head>
  <body>
  
    <div id="jb-container">
    <jsp:include page="/WEB-INF/views/common/mypageSidebar.jsp" />
   <div id="jb-content">
   <h3>주문내역</h3>
        <hr>
        <br>
        <div class="search-date">       
	      <form id="ordersSearch" name="ordersSearch">
	      <label for="UserCheckIN">조회기간 </label>&nbsp;&nbsp;&nbsp;
	      <input type="date" name="fromDate" id="fromDate">&nbsp;&nbsp;~&nbsp;&nbsp;
	      <label for="UserCheckOut"></label> 
	      <input type="date" name="toDate" id="toDate">&nbsp;&nbsp;
	      <input type="button"  id="SearchButton" class="btn-search" value="조회하기"></button>
	      </form>     
      	</div>         
      <br><hr><br>
        <div id="content-detail2">
         <h5>${id }님의 주문 내역입니다.</h5>
        <br><br>
         <table id="order-table">
         <thead>
       <tr>
          <th>주문일</th>
          <th>주문번호</th>
          <th>총주문금액</th>
          <th>주문정보</th>
        </tr>
      </thead>
        <tbody>
        <c:forEach var="orders" items="${orderList }">
	        <c:if test="${orders.ordersNo != null }">        
	        <tr>
	          <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${orders.ordersDate }"/></td>	          
	          <td>${orders.ordersNo }</td>
	          <td><fmt:formatNumber value="${orders.ordersTotal }" pattern="###,###,###"/>원</td>
	          <td>
	          ${orders.ordersStatus }
	          <button onclick="location.href='ordersProduct/${orders.ordersNo}'">상세보기</button>
	       	  &nbsp;&nbsp;       
	         <c:if test="${orders.ordersStatus eq '주문완료'}">
	         <button onclick="window.open('returnOrderQuestion/${orders.ordersNo}','주문취소','width=500,height=300,top=100,left=500' );">주문취소</button>          
	         </c:if>      
	         </td> 
	        </tr>
	        </c:if>
        </c:forEach>
	        <c:if test="${orderList.size() == 0 }">
	        <tr>
	        <td colspan="5" align="center"><strong> 주문 내역이 없습니다.</strong></td>
	        </tr>
	        </c:if>     
        </tbody>
      </table><br>
      		<!-- 페이징 -->
			<div style="display: block; text-align: center;" id="paging">		
					<c:if test="${paging.startPage != 1 }">
						<a href="/easycook/mypage/orders?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<b>${p }</b>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<a href="/easycook/mypage/orders?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a href="/easycook/mypage/orders?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
					</c:if>
			</div>
		</div>
	</div>         
</div> 

      <div id="jb-bottom">
        <br/>
      </div>

<script src="/easycook/resources/admin/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
$('#SearchButton').on('click', function(){
	/* alert($("#searchgogo").serialize()) */
	$( '#order-table > tbody').empty();
	$( '#paging').empty();
	$.ajax({
		url : "ordersSearch.action",
		type: "POST",
		data: $("#ordersSearch").serialize(),
		success: function (data) {			
			$('#order-table').append(data);
		},
		error: function () {
			alert("데이터를 불러오는 중 오류가 발생했습니다");
		}	
	});
	
	
});
</script>
</body>



  
<jsp:include page="/WEB-INF/views/common/footer.jsp" />