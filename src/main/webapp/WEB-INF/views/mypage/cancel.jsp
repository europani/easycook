<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
      
      #refund-table {
        border-collapse: collapse;
        width: 100%;
      }
      #refund-table th {
      border-bottom: 1px solid #ddd;
      background: #f6f6f6;
      padding: 15px 20px; 
         font-weight: bold;
       font-size: 20px;
       vertical-align: middle;
       border-bottom: 1px solid #e0e0e0;
       background: #f6f6f6;
      }
      #refund-table td {
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
   <h3>반품내역</h3>
        <hr>
        <br>
      <div class="search-date">  
      <form id="refundSearch" name="refundSearch">
      <label for="UserCheckIN">조회기간 </label>&nbsp;&nbsp;&nbsp;
      <input type="date" name="fromDate" id="fromDate">&nbsp;&nbsp;~&nbsp;&nbsp;
      <label for="UserCheckOut"></label> 
      <input type="date" name="toDate" id="toDate">&nbsp;&nbsp;
      <input type="button"  id="SearchButton" class="btn-search" value="조회하기"></button>
      </form>        
      </div>         
      <br><br><hr><br>
        <div id="content-detail2">
         <h5>${id }님의 반품 내역입니다.</h5>
        <br><br>
         <table id="refund-table">
         <thead>
       <tr>
          <th>반품일</th>
          <th>상품번호</th>
          <th>상품명</th>
          <th>반품개수</th>
          <th>반품상태</th>
        </tr>
      </thead>
        <tbody id = "testajax">
        <c:forEach var="refund" items="${refund }">
        <c:if test="${refund.ordersNo != null }">        
        <tr>
          <td>${refund.refundDate }</td>
          <td>${refund.productNo }</td>
          <td>${refund.product.productName }</td>
          <td>${refund.refundQty }</td>
          <td>
          ${refund.refundStatus }
          </td>            
        </tr>
        </c:if>
        <c:if test="${refund.ordersNo == null }">
        <tr>
        <td colspan="6">반품 내역이 없습니다.</td>
        </tr>
        </c:if>
        </c:forEach>     
        </tbody>
      </table>
        </div>        
      </div> 
     
      <div id="jb-bottom">
        <br/>
      </div>
</div>
<script src="/easycook/resources/admin/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
 $('#SearchButton').on('click', function(){
	$( '#refund-table > tbody').empty();
	$.ajax({
		url : "refundSearch.action",
		type: "POST",
		data: $("#refundSearch").serialize(),
		success: function (data) {			
			$('#refund-table').append(data);
		},
		error: function () {
			alert("데이터를 불러오는 중 오류가 발생했습니다");
		}	
	});
	
	
}); 
</script>
</body>



  
<jsp:include page="/WEB-INF/views/common/footer.jsp" />