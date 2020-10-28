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

<!-- datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

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
      #content-detail {
         width: 700px;
         padding: 30px 20px 30px;
        float: left;
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
        <div id="content-detail">
        
      <form name="searchFrm">
      <label for="UserCheckIN">조회기간 </label>&nbsp;&nbsp;&nbsp;
      <input type="text" name="fromDate" id="fromDate">&nbsp;&nbsp;~&nbsp;&nbsp;
      <label for="UserCheckOut"></label> 
      <input type="text" name="toDate" id="toDate">&nbsp;&nbsp;
      <button type="button" id="btnSearch" class="btn-search">조회하기</button>
      </form>
        
      </div>         
      <br><br><br><br>
         <br><hr><br>
        <div id="content-detail2">
         <h5 >주문목록/배송조회 내역 총 -건</h5>
        <br><br>
         <table id="order-table">
         <thead>
       <tr>
          <th>주문일</th>
          <th>주문번호</th>
          <th>상품명</th>
          <th>수량</th>
          <th>총주문금액</th>
          <th>주문상태</th>
        </tr>
      </thead>
        <tbody>
        <c:forEach var="orders" items="${orderList }">
        <c:if test="${orders.ordersNo != null }">        
        <tr>
          <td>${orders.ordersDate }</td>
          <td>${orders.ordersNo }</td>
          <td>${orders.product.productName }</td>
          <td>${orders.ordersDetail.detailQty }</td>
          <td>${orders.ordersDetail.detailSt }</td>
          <td>
          ${orders.ordersStatus }
         <form method="post" action="<%=request.getContextPath() %>/mypage/cancelRequire" >
         <c:if test="${orders.ordersStatus eq '주문완료'}">
         <input type="hidden" name="ordersNo" id="ordersNo" value="${orders.ordersNo}">
         <input type="submit" class="btn-cancle" value='주문취소'>         
         </c:if>
         <c:if test="${orders.ordersStatus eq '배송완료'}">
          <input type="button" class="btn-cancle" onclick="cancelPls(${orders.ordersNo})" value="반품신청"/>
         </c:if>
          </form>  
         </td>
        </tr>
        </c:if>
        <c:if test="${orders.ordersNo == null }">
        <tr>
        <td colspan="6">주문 내역이 없습니다.</td>
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
</body>
<!-- datepicker -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>

$(document).ready(function () {
	
	if (${fromDate !=null && fromDate != "" && toDate != null && toDate != ""}) {
		$("#fromDate").val("${fromDate}");
		$("#toDate").val("${toDate}");
	}
	
	$("#btnSearch").click(function () {
		goSearch();
	})
	
});



$("#datepicker").datepicker({
	
	dateFormat: 'yy-mm-dd', showOtherMonths : true, showMonthAfterYear : true,
	changeYear: true, changeMonth: true, showOn: "both", bottonText : "선택", yearSuffix: "년",
	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    minDate: "-10Y", maxDate: "today"	//today안되면 +1D로..
    
});
$('#datepicker').datepicker('setDate', 'today');


$(fuction(){
	
	$.datepicker.setDefaults({
	
	dateFormat: 'yy-mm-dd', showOtherMonths : true, showMonthAfterYear : true,
	changeYear: true, changeMonth: true, showOn: "both", bottonText : "선택", yearSuffix: "년",
	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    minDate: "-10Y", maxDate: "today"	//today안되면 +1D로..
    
	});
	
	// input을 datepicker로 설정
	$("#fromDate").datepicker();
	$("#toDate").datepicker();
	
	// from의 초기값을 일주일전으로 설정
	$('#fromDate').datepicker('setDate', '-1M');
	// to의 조건값을 오늘로 설정
	$('#toDate').datepicker('setDate', '-1D');
	
})


function goSearch() {
	
	var frm = document.searchFrm;
	frm.method = "GET";
	frm.action = "ordersTest.action";
	frm.submit();
	
}

</script>

  
<jsp:include page="/WEB-INF/views/common/footer.jsp" />