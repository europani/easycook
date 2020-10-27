<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/common/adminSidebar.jsp" />

<!-- Page Content -->
<div id="page-content-wrapper">

	<nav
		class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
		<button class="btn btn-primary" id="menu-toggle">Toggle Menu</button>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto mt-2 mt-lg-0">
				<li class="nav-item active"><a class="nav-link"
					href="/easycook/admin">관리자Home <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item"><a class="nav-link" href="/easycook">이지쿡</a>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> 상품관리 </a>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="/easycook/admin/product">상품목록</a> <a
							class="dropdown-item" href="/easycook/admin/product/write">상품등록</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
			</ul>
		</div>
	</nav>

	<div class="w3-container w3-center ">
		<h2>상품 삭제</h2>

		<form method="post" action="" name="deleteForm"
			enctype="multipart/form-data">
			<table>
				<tr>
					<td><font color="red">상품번호를 입력해주세요.</font></td>
				</tr>
				<tr>
					<td><input name="inputNo" style="width: 150px;"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="삭제하기">
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
<script src="/easycook/resources/js/ajax.js"></script>

<!-- Menu Toggle Script -->
<script>
	$("#menu-toggle").click(function(e) {
		e.preventDefault();
		$("#wrapper").toggleClass("toggled");
	});
</script>

</body>
</html>