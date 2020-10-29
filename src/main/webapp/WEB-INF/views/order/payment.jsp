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
    
      
      .payment-container {
        width: 95%;
        margin: 0px auto;
        padding: 50px 10px 10px 10px;
      }
      .payment-content {
        width: 85%;
        padding: 20px;
        margin-bottom: 20px;
        float: right;
      }
      .payment-content2 {
        width: 85%;
        padding: 20px;
        margin-bottom: 20px;
        float: right;
      }
      .payment-content3 {
        width: 85%;
        height : 80px;
	    padding-left : 40px;
	    margin-right : 40px;
	    border: 3px solid #d6d6d6;
	    float: right;
	    text-align: left;
	    font-size: 20px;
      }
      .payment-pay{
      	float: right;
      }     
      .payment-bottom {
        clear: both;
        padding: 20px;
      }     
      .btn-payment {   /* 나중에 추가할 버튼양식 */
       display: inline-block;
       position : absolute;
       margin-left: 40rem;
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
      /* 결제정보 넣을예정 */          
      .CartList {     
      	  width: 85%;
      	  height: 350px;   
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
    
    </style>
  </head>
  <body>
  <section class="CartList">
  
  
  
  </section>
   <div class="payment-container">
   
   <div class="payment-content">
   <h4>주문자 정보</h4>
     <hr><br>
      <table class="paymentCustomer">
      <colgroup>
      	<col style="width:20%">
      	<col style="width:80%">
      </colgroup>
      	<tbody>
      	<tr>
      		<th>주문하시는 분</th>
      		<td>member.name 들고오기</td>
      	</tr>
      	<tr>
      		<th>연락처</th>
      		<td>member.tel 들고오기</td>
      	</tr>
      	<tr>
      		<th>이메일</th>
      		<td>member.email 들고오기</td>
      	</tr>
      	</tbody>   
      </table>
   </div> 
   
   <div class="payment-content2">
         <h4 >결제정보</h4>
         <hr><br>
      <table class="paymentCustomer">
      <colgroup>
      	<col style="width:20%">
      	<col style="width:80%">
      </colgroup>
      	<tbody>
      	<tr>
      		<th>상품 합계 금액</th>
      		<td>들고오기</td>
      	</tr>
      	<tr>
      		<th>배송비</th>
      		<td>들고오기</td>
      	</tr>
      	<tr>
      		<th>쿠폰 사용</th>
      		<td>들고오기</td>
      	</tr>
      	<tr>
      		<th>적립금 사용</th>
      		<td> 들고오기</td>
      	</tr>
      	<tr>
      		<th>최종 결제 금액</th>
      		<td>들고오기</td>
      	</tr>
      	</tbody>   
      </table>
    </div>        
    <div class="payment-content3">
     	<!-- <dl>
     	<dt>최종 결제 금액</dt>
     	<dd>00000원 <input type="button" class="btn-cancle" ></dd></dl> -->
     	최종결제금액&nbsp;&nbsp;&nbsp;<strong>00000원</strong>
    </div>     
 	<div class="payment-pay">
 	<button class="btn-payment">결제하기</button>
 	</div>
 	
</div>
    <div class="payment-bottom">
        <br>
     </div>
</body>

  
<jsp:include page="/WEB-INF/views/common/footer.jsp" />