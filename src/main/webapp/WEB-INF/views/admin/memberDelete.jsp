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
  <h2>탈퇴회원 목록</h2>

  <table class="w3-table-all w3-hoverable w3-centered">
    <thead>
      <tr class="w3-light-grey" style="color:#FFFF00">
        <th>ID</th>
        <th>이름</th>
        <th>이메일</th>
        <th>전화번호</th>
        <th>생일</th>
        <th>포인트</th>
        <th>가입일</th>
        <th>탈퇴일</th>
        <th></th>
      </tr>
    </thead>
    <c:forEach var="infoList" items="${infoList}">
	    <tr>
	      <td>${infoList.id}</td>
	      <td>${infoList.name}</td>
	      <td>${infoList.email}</td>
	      <td>${infoList.tel}</td>
	      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${infoList.birthday}"/></td>
	      <td>${infoList.point}</td>
	      <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${infoList.regDate}"/></td>
	      <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${infoList.wdrDate}"/></td>
	      <td><button class="btn btn-primary" onclick="window.location.href='http://localhost:8089/easycook/admin/member/${infoList.id}'">주문목록</button></td>
	    </tr>
    </c:forEach>
  </table>
</div>

<!-- 페이징 -->
<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/easycook/admin/member?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/easycook/admin/member?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/easycook/admin/member?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
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