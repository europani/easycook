<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




        <tbody id = "order-table">
<c:forEach var="orders" items="${orderListDate }">
	<%-- <div>${orders.ordersNo }</div> --%>
	<c:if test="${orders.ordersNo != null}">      
        <tr>
          <td>${orders.ordersDateforString }</td>
          <td>${orders.ordersNo }</td>
          <td>${orders.ordersTotal }원</td>
          <td>
          ${orders.ordersStatus }
          <button onclick="window.open('ordersProduct/${orders.ordersNo}','상세보기','width=600,height=900,top=100,left=500' );">상세보기</button>
          </td>
          <td>
         <form method="post" action="<%=request.getContextPath() %>/mypage/cancelRequire" >
         <c:if test="${orders.ordersStatus eq '주문완료'}">
         <input type="hidden" name="ordersNo" id="ordersNo" value="${orders.ordersNo}">
         <input type="submit" value='주문취소'>         
         </c:if>
         <c:if test="${orders.ordersStatus eq '배송완료'}">
         <input type="hidden" name="ordersNo" id="ordersNo" value="${orders.ordersNo}">
         <input type="submit" value="반품신청"/>
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
