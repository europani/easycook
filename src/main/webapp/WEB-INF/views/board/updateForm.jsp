<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	<p class="w3-left" style="padding-left: 30px;">${board}</p>
	<div class="w3-container">
		<center>
			<b>글수정</b><br>
			<form method="post" name="writeform"
				action="<%=request.getContextPath()%>/notice/updatePro"
				enctype="multipart/form-data">
				<input type="hidden" name="noticeNo" value="${article.noticeNo}">
				<input type="hidden" name="noticeRef" value="0"> <input
					type="hidden" name="noticeRe_step" value="0"> <input
					type="hidden" name="noticeRe_level" value="0"> <input
					type="hidden" name="oldFile" value="${article.noticeFilename}">
				<table class="w3-table-all" style="width: 70%;">
					<tr>
						<td align="right" colspan="2"><a href="list"> 글목록</a></td>
					</tr>
					<tr>
						<td width="70" align="center">이 름</td>
						<td width="330"><input type="text" size="10" maxlength="10"
							name="id" value="${article.id}"></td>
					</tr>
					<tr>
						<td width="70" align="center">제 목</td>
						<td width="330"><input type="text" size="40" maxlength="50"
							name="noticeTitle" value="${article.noticeTitle}"></td>
					</tr>

					<tr>
						<td width="70" align="center">내 용</td>
						<td width="330"><textarea name="noticeContent" rows="13"
								cols="40">${article.noticeContent}</textarea></td>
					</tr>
					<tr>
						<td width="70" align="center">file</td>
						<td width="330"><input type="file" size="40" maxlength="30"
							name="uploadfile" value="">[${article.noticeFilename}]</td>
					</tr>
					<tr>
						<td width="70" align="center">비밀번호</td>
						<td width="330"><input type="password" size="8"
							maxlength="12" name="noticePasswd"></td>
					</tr>
					<tr>
						<td colspan=2 align="center"><input type="submit" value="글쓰기">
							<input type="reset" value="다시작성"> <input type="button"
							value="목록보기"
							OnClick="window.location='<%=request.getContextPath()%>/list'">
						</td>
					</tr>
				</table>
			</form>
		</center>
	</div>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />