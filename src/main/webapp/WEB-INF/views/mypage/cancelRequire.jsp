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
            .payment-content2 {
        width: 85%;
        padding: 20px;
        margin-bottom: 20px;
        float: right;
      }
            /* 테이블 */
      .paymentCustomer{
        border-collapse: collapse;
        width: 85%;
      }      
      .paymentCustomer th {
	   background: #f6f6f6;
	   padding-left : 15px;
       font-weight: bold;
       font-size: 16px;
       vertical-align: middle;
       border-top : 1px solid #999999;
       border-bottom: 1px solid #dbdbdb;
       height: 65px;
      }
      .paymentCustomer td {
       padding-left : 15px;       
       vertical-align: middle;     
       font-size: 15px;
       border-top : 1px solid #999999;     
       border-bottom: 1px solid #dbdbdb;
       height: 65px;
      }  
       .btn-payment {   /* 나중에 추가할 버튼양식 */
       display: inline-block;
       position : absolute;
       margin-left: 26rem;
       width: 120px;
       height: 50px;
       line-height: 30px;
       background-color: rgba(0,0,0,0.1);
       font-size: 20px;
       font-weight : border;
       color: black;
       vertical-align: top;
       margin-top : 15px;
       text-align: center;
      } 
      
      td, th {
      	text-align: center;
      }
    </style>
<body>
   <div id="jb-container">
    <jsp:include page="/WEB-INF/views/common/mypageSidebar.jsp" />
   <div id="jb-content">
	   <form action="<%=request.getContextPath() %>/order/doCancel" method="post">
	   <h2>반품신청</h2>
	   <br>
	   <h5>주문번호 : ${orderNum } | 상품번호 : ${productNum }</h5>
	   <div id="content-detail2">
	    <table id="order-table">
	      <thead>
	         <tr> 
	         <th colspan="2">상품명</th> 
	         <th>상품금액</th>
	         <th>수량</th>  
	         <th>환불예정금액</th>
	         </tr>
	      </thead>
	      <tbody>	   		
	         <tr>
	         <td colspan="2">${cancelRequire.product.productName }</td>
	         <td id="product">${productPrice }</td>
	         <td>
	            <select name="refundQty" id="productSelectCount" onchange="paychangeTest(this)">
		            <option value="" disabled selected>---</option>
		            <c:forEach var="refundQty" begin="1" step="1" end="${cancelRequire.ordersDetail.detailQty - checkRefund.refundQty }">
		            <option value="${refundQty }">${refundQty }</option>
		            </c:forEach>
	            </select>
	         </td>
	         <td id="totalpay">0</td>
	         </tr>
	      </tbody>
	   </table>
   <br><hr><br>
   <h5 align="center">반품사유 :
	   <select name="refundReason">	
		    <option value="오배송">상품이 잘못 배송됨</option>
		    <option value="하자">상품에 하자가 있음</option>
		    <option value="변심">단순변심</option>
	   </select>
   </h5>
</div>
   <div class="payment-content2">
         <h4 >환불정보</h4>
         <hr><br>
      	 <table class="paymentCustomer">
	      <colgroup>
	      	<col style="width:20%">
	      	<col style="width:80%">
	      </colgroup>
	      	 <tbody>
	      	 	<tr>
		      		<th>환불예정금액</th>
		      		<td id="totalCancel">0</td>
		      	</tr>
		      	<tr>
		      		<td colspan="2" align="center"><strong> 반품 신청 후에는 취소할 수 없으니 신중히 결정해주세요!</strong></td>
		      	</tr>
	      	</tbody>   
      	 </table>
      <input type="submit" class="btn-payment" value="신청하기">
      <input type="hidden" name="ordersNo" id="ordersNo" value="${orderNum }">
      <input type="hidden" name="productNo" id="productNo" value="${productNum }">
      </form>
    </div>     	   
</div>
      <div id="jb-bottom">
        <br/>
      </div>
</div>


<script type="text/javascript">

function paychangeTest(Qty) {
	
	var test = document.getElementById('product').innerHTML;	
	var test2 = document.getElementById('totalCancel').innerHTML;
	var result = Qty.value * test;
	
	document.getElementById('totalpay').innerHTML = result;
	document.getElementById('totalCancel').innerHTML = result;
	
/* 	var lists = new array();
	lists.push("${canCancel.product.productPrice}");
	alert(lists);
	var listObject = "";
	for (var i = 0; i < lists.length; i++) {
		if (test = lists[i].) {
			listObject = lists[i];
			alert(lists[i]);
		}
	} */
}





/* $('#productSelectCount').onchange(function () {
	
	var str = ""
	var tdarr = new Array();	// 배열선언
	var checkbtn = $(this);
	
	var tr = checkBtn.parent().parent();
	var td = tr.children();
	alert("데이터" : tr.text());
	var price = td.eq(2).text();
	var finalprice = td.eq(4).text();
	alert("들어가나? :" + price + finalprice);
	
}); */

</script>
</body>



<jsp:include page="/WEB-INF/views/common/footer.jsp" />