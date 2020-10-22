<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="changePwd" class="form">
	비밀번호 : <input type="password" name="pwd"><br>
	비밀번호 확인 : <input type="password" name="rePwd"><br>
	<input type="button" value="제출하기" onclick="button()">
</form>

<script>
      function button() {
			const form = document.querySelector('.form');
			if (form.pwd.value == "") {
				alert('비밀번호를 입력해주세요.');
				form.pwd.focus();
				return;
			}
			if (form.rePwd.value == "") {
				alert('비밀번호를 입력해주세요.');
				form.rePwd.focus();
				return;
			}
			if (form.pwd.value != form.rePwd.value) {
				alert('비밀번호가 일치하지 않습니다.');
				form.rePwd.focus();
				return;
			}
			form.submit();
		}
</script> 
</body>
</html>