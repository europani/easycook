<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<div class="w3-container w3-center ">
		<h2>이벤트 등록</h2>

		<form method="post" action="" name="writeForm" enctype="multipart/form-data">
			<table class="w3-table-all" style="width:50%;">
				<tr>
					<td width="70" align="center">번 호</td>
					<td width="330">${event.eventNo}</td>
				</tr>
				<tr>
					<td width="70" align="center">제 목</td>
					<td width="330"><input type="text" size="40" maxlength="50" name="eventTitle" value="${event.eventTitle}"></td>
				</tr>
				<tr>
					<td width="70" align="center">내 용</td>
					<td width="330"><textarea name="eventContent" rows="13" cols="40">${event.eventContent}</textarea>
					</td>
				</tr>
				<tr>
					<td width="70" align="center">첨부파일</td>
					<td width="330"><input type="file" size="40" maxlength="30" name="file"><br>
					(기존 파일: ${event.eventImage})</td>
				</tr>
				<tr>
					<td width="70" align="center">시작일</td>
					<td width="330"><input type="date" name="eventStartdate" value="${start}"></td>
				</tr>
				<tr>
					<td width="70" align="center">종료일</td>
					<td width="330"><input type="date" name="eventEnddate" value="${end}"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정하기">
						<input type="button" value="뒤로가기" OnClick="javascript:history.back()">
					</td>
				</tr>
			</table>
		</form>
	</div>


</div>
<!-- /#wrapper -->

<!-- Bootstrap core JavaScript -->
<script src="/easycook/resources/admin/vendor/jquery/jquery.min.js"></script>
<script
	src="/easycook/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Menu Toggle Script -->
<script>
	$("#menu-toggle").click(function(e) {
		e.preventDefault();
		$("#wrapper").toggleClass("toggled");
	});
	
</script>

</body>
</html>
