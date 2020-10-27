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
<body>
    <div id="jb-container">
    <jsp:include page="/WEB-INF/views/common/mypageSidebar.jsp" />
   <div id="jb-content">
   <h2>반품신청</h2>
   <br>
   <h5>주문일 : ${oDate } | 주문번호 : ${oNum }</h5>
   <div id="content-detail2">
    <table id="order-table">
      <thead>
         <tr> 
         <th colspan="3">상품</th> 
         <th>총결제금액</th>
         <th>수량</th>  
         <th>상품금액</th>
         </tr>
      </thead>
      <tbody>
   <c:forEach var="canCancel" items="${canCancelList }">   
         <tr>
         <td>${canCancel.product.productImage } 이경로로 사진불러올것</td>
         <td>${canCancel.product.productName } </td>
         <td>${canCancel.product.productAmount} g </td>
         <td>${canCancel.ordersDetail.detailSt }</td>
         <td>
            <select name="QtyChoice">
            <c:forEach var="Qty" items="${canCancel.ordersDetail.detailQty }"
             begin="0" end="${canCancel.ordersDetail.detailQty }" step="1">
             <option value="${Qty }">
            </c:forEach>
            </select>
         </td>
         <td>${canCancel.product.productPrice } </td>
         </tr>
   </c:forEach>
      </tbody>
   </table>
   <br><hr><br>
   <h3>반품사유</h3>
   <br>
   <input type="checkbox">
   
</div>
</div>
      <div id="jb-bottom">
        <br/>
      </div>
</div>
</body>



<jsp:include page="/WEB-INF/views/common/footer.jsp" />