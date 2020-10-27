<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<p class="w3-left" style="padding-left: 30px;"></p>
<div class="w3-container">
	<jsp:include page="/WEB-INF/views/common/boardSidebar.jsp" />
	<p class="text-right">
		<a class="btn btn-default" href="<%=request.getContextPath()%>/notice/writeUploadForm">글쓰기</a>
	</p>
	<c:if test="${count == 0 }">
		<table class="w3-table-all">
			<tr class="w3-grey">
				<td align="center">게시판에 저장된 글이 없습니다.</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${count != 0 }">
		<table class="table table-hover" id="table">
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

					<td width="250"><c:if test="${article.noticeRe_level>0 }">
							<img src="<%=request.getContextPath() %>/images/level.gif"
								width="${5*article.noticeRe_level}" height="16">
							<img src="<%=request.getContextPath()%>/images/re.gif">
						</c:if> <c:if test="${article.noticeRe_level==0 }">
							<img src="<%=request.getContextPath()%>/images/level.gif"
								width="0" height="16">
						</c:if> <a
						href="<%=request.getContextPath() %>/notice/content/${article.noticeNo}">${article.noticeTitle}</a>

						<c:if test="${article.getNoticeReadCount() >= 20}">
							<img src="<%=request.getContextPath()%>/images/hot.gif"
								border="0" height="16">
						</c:if></td>
					<td align="center" width="100">${article.id}</td>
					<td align="center" width="150">${article.noticeDate}</td>
					<td align="center" width="50">${article.noticeReadCount}</td>
				</tr>
			</c:forEach>
		</table>


		<div class="text-center">
			<ul class="pagination">
			<li><c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="<%=request.getContextPath() %>/notice/list?pageNum=${i}">
					<c:if test="${i==currentPage}">
						<font color='red'>${i}</font>
					</c:if> <c:if test="${i!=currentPage}">${i}</c:if>


				</a>
			</c:forEach></li>
			</ul>
			<c:if test="${startPage > bottomLine }">
				<a
					href="<%=request.getContextPath() %>/notice/list?pageNum=${startPage - bottomLine}">
					[이전] </a>
			</c:if>
			
			
			
			
			<c:if test="${endPage < pageCount}">
				<a
					href="<%=request.getContextPath() %>/notice/list?pageNum=${startPage + bottomLine}">
					[다음] </a>
			</c:if>

		</div>


		<div>
			<div class="text-center">
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

	</c:if>

</div>
</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />