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
                이벤트
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="/easycook/admin/event">이벤트</a>
                <a class="dropdown-item" href="/easycook/admin/event/write">이벤트작성</a>
                <a class="dropdown-item" href="/easycook/admin/coupon">쿠폰</a>
                <a class="dropdown-item" href="/easycook/admin/coupon/write">쿠폰작성</a>
              </div>
            </li>
          </ul>
        </div>
      </nav>

<div class="w3-container w3-center">
  <h2>쿠폰</h2>

  <table class="w3-table-all w3-hoverable w3-centered">
    <thead>
      <tr class="w3-light-grey" style="color:#FFFF00">
        <th width="5%">No</th>
        <th width="30%">제목</th>
        <th width="10%">할인률(%)</th>
        <th width="10%">시작날짜</th>
        <th width="1%"></th>
        <th width="10%">종료날짜</th>
        <th width="8%"></th>
        <th width="8%"></th>
      </tr>
    </thead>
    <c:forEach var="coupon" items="${coupon}">
	    <tr>
	      <td>${coupon.couponNo}</td>
	      <td>${coupon.couponTitle}</td>
	      <td>${coupon.couponDiscount}</td>
	      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${coupon.couponSdate}"/></td>
	      <td>~</td>
	      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${coupon.couponEdate}"/></td>
	      <td><button class="btn btn-primary" onclick="window.location.href='<%=request.getContextPath()%>/admin/coupon/modify/${coupon.couponNo}'">쿠폰수정</button></td>
	      <td><button class="btn btn-primary" onclick="window.open('coupon/delete/${coupon.couponNo}','쿠폰삭제','width=300,height=150,top=100,left=500');">쿠폰삭제</button></td>
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