<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/common/adminSidebar.jsp" />

<!-- Page Content -->
    <div id="page-content-wrapper">

      <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
        <button class="btn btn-primary" id="menu-toggle">Toggle Menu</button>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
            <li class="nav-item active">
              <a class="nav-link" href="/easycook/admin">관리자Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/easycook">이지쿡</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                주문관리
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="/easycook/admin/orders">주문내역</a>
                <a class="dropdown-item" href="/easycook/admin/ordersCancel">주문취소내역</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="refund">반품내역</a>
              </div>
            </li>
          </ul>
        </div>
      </nav>

<div class="w3-container w3-center">
  <h2>주문 내역</h2>

  <table class="w3-table-all w3-bordered w3-centered">
      <tr class="w3-light-grey" style="color:#FFFF00">
        <td width="25%" style="text-align: right;">주문번호 : </td>
        <td width="25%" style="text-align: left;"><font color="red">${orderInfo.ordersNo}</font></td>
        <td width="10%" style="text-align: right;">주문일시 : </td>
        <td width="40%" style="text-align: left;"><font color="red"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${orderInfo.ordersDate}"/></font></td>
      </tr>
   </table>
   
   <table class="w3-table w3-bordered w3-centered">
      <tr class="w3-light-grey">
      	<td width="10%">상품번호</td>
      	<td width="40%">상품명</td>
      	<td width="15%">상품가격(원)</td>
	    <td width="15%">주문수량</td>
	    <td width="20%">소계(원)</td>
      </tr>
    <c:forEach var="order" items="${order}">
	    <tr class="w3-write">
	      <td>${order.product.productNo}</td>
	      <td>${order.product.productName}</td>
	      <td>${order.product.productPrice}</td>
	      <td>${order.ordersDetail.detailQty}</td>
	      <td>${order.product.productPrice * order.ordersDetail.detailQty}</td>
	    </tr>
    </c:forEach>
    <tr class="w3-light-grey"><td colspan="5">총 주문금액 : ${orderInfo.ordersTotal}원</td></tr>
    
    
  </table>
  
  <form method="post">
  <c:if test="${orderInfo.ordersStatus eq '주문완료'}">
  	<input type="hidden" name="status" value="주문완료">  	
  	<button onclick="submit()">배송중</button>
  </c:if>
  <c:if test="${orderInfo.ordersStatus eq '배송중'}">
  	<input type="hidden" name="status" value="배송중">
  	<button onclick="submit()">배송완료</button>
  </c:if>
  </form>
</div>


</div>
  <!-- /#wrapper -->

  <!-- Bootstrap core JavaScript -->
  <script src="/easycook/resources/admin/vendor/jquery/jquery.min.js"></script>
  <script src="/easycook/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Menu Toggle Script -->
  <script>
    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });
  </script>

</body>
</html> 