<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="authenPwd" class="form">
	입력하신 이메일로 인증번호를 보냈습니다.
	인증번호를 10분 안에 입력해주세요.
	<input type="text" name="key"><br>
	<input type="button" value="제출하기" onclick="button()">
</form>
<script>
      function button() {
			const form = document.querySelector('.form');
			if (form.key.value == "") {
				alert('인증번호를 입력해주세요.');
				form.key.focus();
				return;
			}
			form.submit();
		}
</script> 
</body>
</html>