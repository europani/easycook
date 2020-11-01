<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/common/header.jsp" />


<style>
	#table{font-size:20px;
	width:50%;
	margin-left: auto;
	margin-right: auto;}
	
	#table-tr{
	background: #1abc9c;
    color: #fff;
	}
	
</style>
<body class="goto-here">
<section class="ftco-section">
<jsp:include page="/WEB-INF/views/common/boardSidebar.jsp" />
<p class="w3-left" style="padding-left: 30px;"></p>

	<c:if test="${count == 0 }">
	
		<table class="w3-table-all">
			<tr class="w3-grey">
				<td align="center">게시판에 저장된 글이 없습니다.</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${count != 0 }">
	<div class="container" style="padding-left:70px;">
	<h1>공지사항</h1>
	<hr style="border-color:#1abc9c">
		<table class="table table-hover" id="table">
	
		<tbody>
				
			<tr id="table-tr">
				<td align="center" width="50">번호</td>
				<td align="center" width="250">제 목</td>
				<td align="center" width="100">작성자</td>
				<td align="center" width="150">작성일</td>
				<td align="center" width="50">조 회</td>
			</tr>

			<c:set var="number" value="${number }" />

			<c:forEach var="article" items="${articleList}">

				<tr height="30">
					<td align="center" width="50">${number }</td>

					<c:set var="number" value="${number-1 }" />

					<td width="250">
						<a href="<%=request.getContextPath() %>/notice/${article.noticeNo}">${article.noticeTitle}</a>
					</td>
					<td align="center" width="100">관리자</td>
					<td align="center" width="150">
					<fmt:formatDate value="${article.noticeDate}" pattern="yyyy-MM-dd HH:mm"/></td>
					<td align="center" width="50">${article.noticeCount}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
</div>
		<div class="text-center">
			<ul class="pagination">
			<li><c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="<%=request.getContextPath() %>/notice?pageNum=${i}">
					<c:if test="${i==currentPage}">
						<font color='red'>${i}</font>
					</c:if> <c:if test="${i!=currentPage}">${i}</c:if>
				</a>
			</c:forEach></li>
			</ul>
			<c:if test="${startPage > bottomLine }">
				<a
					href="<%=request.getContextPath() %>/notice?pageNum=${startPage - bottomLine}">
					[이전] </a>
			</c:if>
			<c:if test="${endPage < pageCount}">
				<a href="<%=request.getContextPath() %>/notice?pageNum=${startPage + bottomLine}">
					[다음] </a>
			</c:if>
		</div>
		<div>
			<div class="text-center">
				<form name="searchForm" method="post">
					<select name="category" size="1">
						<option value="notice_Title">제 목</option>
						<option value="notice_Content">내 용</option>
					</select> 
					<input size="16" name="sentence"> 
					<input type="submit" value="찾기">
				</form>
			</div>
		</div>
	</c:if>
</div>
</section>
</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />