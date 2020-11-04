<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


        <tbody>
		<c:forEach var="orders" items="${orderListDate }">  
	        <tr>
	          <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${orders.ordersDate }"/></td>
	          <td>${orders.ordersNo }</td>
	          <td><fmt:formatNumber value="${orders.ordersTotal }" pattern="###,###,###"/>원</td>
	          <td>
	          ${orders.ordersStatus }
	          <button onclick="location.href='ordersProduct/${orders.ordersNo}'">상세보기</button>
	          </td>
	          <td>
	         <form method="post" action="<%=request.getContextPath() %>/mypage/cancelRequire" >
		         <c:if test="${orders.ordersStatus eq '주문완료'}">
		         <button onclick="window.open('returnOrderQuestion/${orders.ordersNo}','주문취소','width=500,height=500,top=100,left=500' );">주문취소</button>          
		         </c:if>  
	          </form>  
	         </td>
	        </tr>
	    </c:forEach>
        <c:if test="${orderListDate.size() == 0 }">
        <tr>
        <td colspan="5" align="center"><strong>주문 내역이 없습니다.</strong></td>
        </tr>
     	</c:if>
      </tbody>
     
