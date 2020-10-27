<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" /> 
<html>
<head>
<title>게시판</title>

</head>
<body>
	<br>
	<br>
	<b>글내용 보기</b>
	<div class="container">
		<table class="w3-table-all" style="width: 80%;">
			<tr height="30">
				<td width="125" align="center">글번호</td>
				<td width="125" align="center">${article.noticeNo}</td>
				<td width="125">조회수</td>
				<td width="125" align="center">${article.noticeReadCount}</td>
			</tr>
			<tr height="30">
				<td width="125">작성자</td>
				<td width="125" align="center">${article.id}</td>
				<td width="125" align="center">작성일</td>
				<td align="center" width="125" align="center">
					${article.noticeDate}</td>
			</tr>
			<tr height="30">
				<td align="center" width="125">글제목</td>
				<td align="center" width="375" colspan="3">
					${article.noticeTitle}</td>
			</tr>
			<tr height="30">
				<td align="center" width="125">글내용</td>
				<td align="left" width="375" colspan="3"><pre>
         ${article.noticeContent}</pre> <img
					src="<%=request.getContextPath() %>/uploadFile/${article.noticeFilename}">
				</td>
			</tr>
			<tr height="30">
				<td colspan="4" class="w3-center"><input type="button"
					value="글수정"
					onclick="document.location.href='<%=request.getContextPath()%>/notice/updateForm/${article.noticeNo}'">
					&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="글삭제"
					onclick="document.location.href=
'<%=request.getContextPath()%>/notice/deleteForm/${article.noticeNo}'">
					&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="답글쓰기"
					onclick="document.location.href='<%=request.getContextPath()%>/notice/writeUploadForm/${article.noticeNo}&noticeRef=${noticeRef }&noticeRe_step=${noticeRe_step}&noticeRe_level=${noticeRe_level}'">
					&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="글목록"
					onclick="document.location.href='<%=request.getContextPath()%>/notice/list'"></td>
			</tr>
		</table>
	</div>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

