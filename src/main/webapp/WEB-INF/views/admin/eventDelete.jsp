<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${eventNo} 이벤트삭제</title>
<style>
	table {
		margin: auto;
	}
	* {
		text-align: center;
	}
</style>
</head>
<body>
<form name="deleteForm" method="post">
<table>
<tr>
	<td colspan="2">이벤트NO : ${eventNo}</td>
<tr>
<tr><td colspan="2"><font color="red">선택한 이벤트를 삭제하시겠습니까?</font></td></tr>
<tr>
	<td><input type="button" value="삭제하기" onclick="del()"> </td>
	<td><input type="button" value="취소하기" onclick="window.close();"> </td>
</tr>
</table>
</form>

<script>
	function del() {
		let xhttp = new XMLHttpRequest();
		xhttp.open("POST", "");
		xhttp.send();
		xhttp.onreadystatechange = function () {
			if (this.readyState == 4 && this.status == 200) {
				opener.parent.location.reload();
				window.close();
			}
		};
		
	}
	
</script>
</body>
</html>