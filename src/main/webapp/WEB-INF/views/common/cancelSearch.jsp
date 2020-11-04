<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
    
 <tbody id = "testajax">
        <c:forEach var="refund" items="${refundSearch }">     
        <tr>
          <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${refund.refundDate }"/></td>
          <td>${refund.productNo }</td>
          <td>${refund.product.productName }</td>
          <td>${refund.refundQty }</td>
          <td>
          ${refund.refundStatus }
          </td>            
        </tr>
        </c:forEach>
        <c:if test="${refundSearch.size() == 0 }">
        <tr>
        <td colspan="5" align="center"><strong>반품 내역이 없습니다.</strong></td>
        </tr>
        </c:if>
            
 </tbody>