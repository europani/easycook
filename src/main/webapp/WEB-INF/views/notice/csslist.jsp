<jsp:include page="/WEB-INF/views/common/header.jsp" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Table V04</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<div class="limiter">
		<div class="container-table100v">
			<div class="wrap-table100v">
				<jsp:include page="/WEB-INF/views/common/boardSidebar.jsp" />
				<c:if test="${count == 0 }">

					<table>
						<tr>
							<td align="center">게시판에 저장된 글이 없어요</td>
						</tr>
					</table>
				</c:if>
				<div class="table100v ver5v m-b-110v">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">번호</th>
									<th class="cell100 column2">제목</th>
									<th class="cell100 column3">작성자</th>
									<th class="cell100 column4">작성일</th>
									<th class="cell100 column5">조회수</th>
								</tr>
								<c:set var="number" value="${number }" />
							</thead>
						</table>
					</div>

					<div class="table100-bodyv js-pscroll">
						<table>
							<c:forEach var="article" items="${articleList}">
								<tr class="row100 body">
									<td class="cell100 column1">
									
									${article.noticeNo}
									</td>
									<td class="cell100 column2">
									<a href="<%=request.getContextPath() %>/notice/content/${article.noticeNo}">${article.noticeTitle}</a>
									</td>
									<td class="cell100 column3">${article.id }</td>
									<td class="cell100 column4">${article.noticeDate }</td>
									<td class="cell100 column5">${article.noticeReadCount }</td>
								</tr>
							</c:forEach>

						</table>
					</div>
					<div class="d-flex justify-content-center">
						<ul class="pagination">

							<c:if test="${startPage > bottomLine }">
								<li class="page-item"><a class="page-link"
									href="<%=request.getContextPath() %>/notice/list?pageNum=${startPage - bottomLine}">
										이전] </a>
							</c:if>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<li class="page-item"><a class="page-link"
									href="<%=request.getContextPath() %>/notice/list?pageNum=${i}"> <c:if
											test="${i==currentPage}">
											<font color='red'>${i}</font>
										</c:if> <c:if test="${i!=currentPage}">${i}</c:if>


								</a>
							</c:forEach>
							<c:if test="${endPage < pageCount}">
								<li class="page-item"><a class="page-link"
									href="<%=request.getContextPath() %>/notice/list?pageNum=${startPage + bottomLine}">
										[다음] </a>
							</c:if>




						</ul>
						<div class="w3-center">
							<form name="searchForm" method="post">
								<select name="category" size="1">
									<option value="id">이 름</option>
									<option value="noticeTitle">제 목</option>
									<option value="noticeContent">내 용</option>
								</select> <input size="16" name="sentence"> <input type="submit"
									value="찾기">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div></div>
	</div>




</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />