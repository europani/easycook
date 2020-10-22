<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="seekId" class="seekForm">
		<table width="720">
			<h2 align="center">회원가입</h2>
			<tr height="2" bgcolor="#000000">
				<td colspan="2"></td>
			</tr>
			<input type="radio" name="emailForm" onclick="email()"> 이메일로 찾기
			<div id="emailForm">
			<tr>
				<th>이 름</th>
				<td class="td1"><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td class="td1">
					<input type="text" name="email1">
				</td>
			</tr>
			</div>
			<input type="radio" name="telForm" onclick="tel()"> 전화번호로 찾기
			<div id="telForm">
			<tr>
				<th>이 름</th>
				<td class="td1"><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>핸드폰 번호</th>
				<td class="td1"><select name="tel1">
					<option value="" disabled selected>---</option>
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select> - <input type="text" name="tel2" class="JJ"> - <input
					type="text" name="tel3" class="JJ"></td>
			</tr>
			</div>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="제출하기" onclick="button()"> 
					<input type="reset" value="뒤로가기">
				</td>
			</tr>
		</table>
	</form>
<script>
	const emailForm = document.querySelector('#emailForm');
	const telForm = document.querySelector('#telForm');
      function button() {
			const seekForm = document.querySelector('.seekForm');
			if (seekForm.id.value == "") {
				alert('아이디를 입력해주세요.');
				seekForm.id.focus();
				return;
			}
			seekForm.submit();
		}
      
      function email() {
    	  emailForm.style.display = "block";
    	  emailForm.disabled = "false"
    	  telForm.style.display = "none";
    	  telForm.disabled = "true"
      }
      
      function tel() {
    	  telForm.style.display = "block";
    	  telForm.disabled = "false"
    	  emailForm.style.display = "none";
    	  emailForm.disabled = "true"
      }
      </script>
</body>
</html>