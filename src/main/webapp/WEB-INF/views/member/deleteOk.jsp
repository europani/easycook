<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
<meta http-equiv="refresh" content="0; url=<%=request.getContextPath()%>"> 
</head>
<body>
<script>
	alert('회원 탈퇴 되었습니다.');
</script>
</body>
</html>