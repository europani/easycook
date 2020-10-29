<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div class="w3-container">
	<b>글쓰기</b><br>

	<form method="post" name="writeform" enctype="multipart/form-data"
		action="<%=request.getContextPath()%>/notice/writeUploadPro">
		<input type="hidden" name="noticeNo" value="${noticeNo }"> <input
			type="hidden" name="noticeRef" value="${noticeRef }"> <input
			type="hidden" name="noticeRe_step" value="${noticeRe_step }">
		<input type="hidden" name="noticeRe_level" value="${noticeRe_level }">
		<table class="w3-table-all">

			<tr>
				<td align="right" colspan="2"><a
					href="<%=request.getContextPath()%>/notice/list"> 글목록</a></td>
			</tr>
			<tr>
				<td width="70" align="center">이 름</td>
				<td width="330"><input type="text" size="10" maxlength="10"
					name="id"></td>
			</tr>
			<tr>
				<td width="70" align="center">제 목</td>
				<td width="330"><c:if test="${noticeNo == 0}">
						<input type="text" size="40" maxlength="50" name="noticeTitle">
					</c:if> <c:if test="${noticeNo != 0}">
						<input type="text" size="40" maxlength="50" name="noticeTitle"
							value="답글>">

					</c:if></td>
			</tr>


			<tr>
				<td width="70" align="center">내 용</td>
				<td width="330"><textarea name="noticeContent" rows="13" cols="40"></textarea>
				</td>
			</tr>
			<tr>
				<td width="70" align="center">file</td>
				<td width="330"><input type="file" size="40" maxlength="30"
					name="uploadfile"></td>
			</tr>
			<tr>
				<td width="70" align="center">비밀번호</td>
				<td width="330"><input type="password" size="8" maxlength="12"
					name="noticePasswd"></td>
			</tr>
			<tr>
				<td colspan=2 align="center"><input type="submit" value="글쓰기">
					<input type="reset" value="다시작성"> <input type="button"
					value="목록보기"
					OnClick="window.location='<%=request.getContextPath()%>/notice/list'">
				</td>
			</tr>
		</table>
	</form>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
