<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="seekPwd" class="seekForm">
	ID : <input type="text" name="id"><br>
	Email : <input type="text" name="email"><br>
	<input type="button" value="제출하기" onclick="button()">
</form>
<script>
      function button() {
			const seekForm = document.querySelector('.seekForm');
			if (seekForm.id.value == "") {
				alert('아이디를 입력해주세요.');
				seekForm.id.focus();
				return;
			}
			if (seekForm.email.value == "") {
				alert('이메일을 입력해주세요.');
				seekForm.email.focus();
				return;
			}
			seekForm.submit();
		}
</script> 
</body>
</html>