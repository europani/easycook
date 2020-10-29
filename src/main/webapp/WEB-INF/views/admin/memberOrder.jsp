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
                회원관리
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
              	<a class="dropdown-item" href="/easycook/admin/member">회원목록</a>
                <a class="dropdown-item" href="/easycook/admin/member/delete">탈퇴회원</a>
              </div>
            </li>
          </ul>
        </div>
      </nav>

<div class="w3-container w3-center">
  <h2>회원별 주문 내역</h2>
  <table class="w3-table-all w3-bordered w3-centered">
  	  <tr><td colspan="4">회원 ID : <font color="red">${id}</font></td></tr>
      <tr class="w3-light-grey" style="color:#FFFF00">
        <td width="25%" style="text-align: right;">최근구매일자 : </td>
        <td width="25%" style="text-align: left;">
        	<font color="red"><fmt:formatDate pattern="yyyy-MM-dd" value="${date}" /> </font>
        </td>
        <td width="10%" style="text-align: right;">총구매금액 : </td>
        <td width="40%" style="text-align: left;"><font color="red"><fmt:formatNumber pattern="###,###,###" value="${sum}" /></font>원</td>
      </tr>
   </table>
   
  <table class="w3-table-all w3-hoverable w3-centered">
    <thead>
      <tr class="w3-light-grey" style="color:#FFFF00">
        <th width="15%">No</th>
        <th width="25%">주문일</th>
        <th width="20%">결제금액</th>
        <th width="25%">배송상태</th>
        <th width="15%"></th>
      </tr>
    </thead>
    <c:forEach var="list" items="${list}">
	    <tr>
	      <td>${list.ordersNo}</td>
	      <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${list.ordersDate}"/></td>
	      <td><fmt:formatNumber pattern="###,###,###" value="${list.ordersTotal}" /> </td>
	      <td>${list.ordersStatus}</td>
	      <td><button class="btn btn-primary" onclick="window.location.href='<%=request.getContextPath()%>/admin/orders/${list.ordersNo}'">주문상세보기</button></td>
	    </tr>
    </c:forEach>
  </table>
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