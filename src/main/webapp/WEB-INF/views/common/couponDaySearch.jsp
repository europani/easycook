<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


 <div id="couponList">
      <div id="사용가능한 쿠폰" class="coupon">
        <h2>사용가능한 쿠폰</h2>
         <table id="coupon-table">
         <thead>
       <tr>
          <th>쿠폰번호</th>
          <th>쿠폰명</th>
          <th>혜택</th>
          <th>유효기간</th>
          <th>발급일</th>
        </tr>
      </thead>        
        <tbody>
        <c:forEach var="coupon" items="${couponListDate }">
        <c:if test="${coupon.couponUsed == 0 }">
        <tr>
          <td>${coupon.ucouponNo }</td>
          <td>${coupon.coupon.couponTitle }</td>
          <td>${coupon.coupon.couponDiscount }% 할인쿠폰</td>
          <td>${coupon.coupon.couponEdate }</td>
          <td>${coupon.coupon.couponSdate }</td>
        </tr>    
        </c:if> 
        </c:forEach>        
        </tbody>
      </table>
      </div>

      <div id="사용불가능한 쿠폰" class="coupon" style="display:none">
        <h2>사용불가능한 쿠폰</h2>
        <table id="coupon-table">
         <thead>
       <tr>
          <th>쿠폰번호</th>
          <th>쿠폰명</th>
          <th>혜택</th>
          <th>유효기간</th>
          <th>발급일</th>
        </tr>
      </thead>
        <tbody>        
        <c:forEach var="coupon" items="${couponListDate }">
        <c:if test="${coupon.couponUsed == 1 }">
        <tr>
          <td>${coupon.ucouponNo }</td>
          <td>${coupon.coupon.couponTitle }</td>
          <td>${coupon.coupon.couponDiscount }% 할인쿠폰</td>
          <td>${coupon.coupon.couponEdate }</td>
          <td>${coupon.coupon.couponSdate }</td>
        </tr>   
        </c:if>  
        </c:forEach>
        </tbody>
      </table>
      </div>
</div>


<script>
function openCoupon(couponUsed) {
    var i;
    var x = document.getElementsByClassName("coupon");
    for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
    }
    document.getElementById(couponUsed).style.display = "block";
  }

</script>
