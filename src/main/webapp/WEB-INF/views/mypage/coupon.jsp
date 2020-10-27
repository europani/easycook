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
      #benefit-box{
         text-align: center;
      }
      #coupon-box{
      /*    margin-left : 400px; */
         border: 3px solid #F8F8F8; 
         width: 760px;
         /* display: table; */
         display: inline-block;
      }
      #coupon-box li{     
          font-size : 20px;   
        float: left;
         list-style: none;
         margin: 0px 40px 40px 40px;
         text-align: center;
         width:300px; height:160px;
         background:#68c195;  color:#fff; 
         
      }
/*       #coupon-box hr{        
        
      } */
      #coupon-box li a span{
         display: block;
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
        text-align: center;
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
      
      div.vertical-line{
         width: 0px; /* Use only border style */
         height: 170px;
         float: left; 
         border: 1px solid #F8F8F8; /* This is default border style for <hr> tag */
         background-color: #F8F8F8;
       }
    
    </style>
  </head>
  <body>
  
    <div id="jb-container">
    <jsp:include page="/WEB-INF/views/common/mypageSidebar.jsp" />
      <div id="jb-content">
        <h3>나의 혜택</h3>
        <hr>
        <br>
        <div id="benefit-box">
        <div id="coupon-box">
        <br><h4>---님의 혜택 내역입니다.</h4><br>
        <ul>
           <li>
              <span>이미지예정</span><br/>
              <span>쿠폰</span><br/>
              -장
           </li>
           <div class="vertical-line"/>
           <li>
              <span>이미지예정</span><br/>
              <span>적립금</span><br/>-원
           </li>
        </ul>
        <br>
        </div>
        </div>
        <br><br>
       
        <hr><br>
        <div id="content-detail">
        <label for="InputCoupon">쿠폰등록 </label>&nbsp;&nbsp;&nbsp;
      <input type="text" id="InputCoupon" name="InputCoupon" >&nbsp;&nbsp; 
      <button class="btn-search">쿠폰등록</button>
      </div>
      <br><br><br><br>
         <br><hr><br>
    
        <div id="content-detail2">   
        <div class="w3-bar w3-black">
        <button class="w3-bar-item w3-button" onclick="openCoupon('사용가능한 쿠폰')">사용가능한 쿠폰</button>
       <button class="w3-bar-item w3-button" onclick="openCoupon('사용불가능한 쿠폰')">사용불가능한 쿠폰</button>
      </div>
      <div id="사용가능한 쿠폰" class="coupon">
        <h2>사용가능한 쿠폰</h2>
         <table id="order-table">
         <thead>
       <tr>
          <th>쿠폰번호</th>
          <th>쿠폰명</th>
          <th>혜택(0)</th>
          <th>유효기간</th>
          <th>발급일</th>
        </tr>
      </thead>        
        <tbody>
        <c:forEach var="coupon" items="${couponList }">
        <c:if test="${coupon.couponUsed == 0 }">
        <tr>
          <td>${coupon.couponNo }</td>
          <td>${coupon.couponTitle }</td>
          <c:if test="${coupon.couponType == 0 }">
          <td>${coupon.couponDiscount }% 할인쿠폰</td>
          </c:if>
          <c:if test="${coupon.couponType == 1 }">
          <td>${coupon.couponDiscount }원 할인쿠폰</td>
          </c:if>
          <td>${coupon.couponEdate }</td>
          <td>${coupon.couponSdate }</td>
        </tr>    
        </c:if> 
        </c:forEach>        
        </tbody>
      </table>
      </div>

      <div id="사용불가능한 쿠폰" class="coupon" style="display:none">
        <h2>사용불가능한 쿠폰</h2>
        <table id="order-table">
         <thead>
       <tr>
          <th>쿠폰번호</th>
          <th>쿠폰명</th>
          <th>혜택(1)</th>
          <th>유효기간</th>
          <th>발급일</th>
        </tr>
      </thead>
        <tbody>        
        <c:forEach var="coupon" items="${couponList }">
        <c:if test="${coupon.couponUsed == 1 }">
        <tr>
          <td>${coupon.couponNo }</td>
          <td>${coupon.couponTitle }</td>
          <c:if test="${coupon.couponType == 0 }">
          <td>${coupon.couponDiscount }% 할인쿠폰</td>
          </c:if>
          <c:if test="${coupon.couponType == 1 }">
          <td>${coupon.couponDiscount }원 할인쿠폰</td>
          </c:if>
          <td>${coupon.couponEdate }</td>
          <td>${coupon.couponSdate }</td>
        </tr>   
        </c:if>  
        </c:forEach>
        </tbody>
      </table>
      </div>
         
        </div>        
      </div>
     
      <div id="jb-bottom">
        <br/>
      </div>
</div>
</body>
<script type="text/javascript">
function openCoupon(couponUsed) {
     var i;
     var x = document.getElementsByClassName("coupon");
     for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";
     }
     document.getElementById(couponUsed).style.display = "block";
   }
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />