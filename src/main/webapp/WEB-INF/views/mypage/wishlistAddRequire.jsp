  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<h4 align="center">${productName } 을 위시리스트에 추가합니다.</h2>
<form method="post" name="wishlistForm" style="text-align: center">
<input type="button" value="확인" onclick="wishlistadd()">
<input type="hidden" name="productNo" value="${productNo }">
</form>
<script src="/easycook/resources/js/ajax.js"></script>
<script>
	function wishlistadd() {	
		const wishlistForm = document.wishlistForm;
		let xhttp = new XMLHttpRequest();
		xhttp.open("POST", "/easycook/mypage/wishlistAdd/" + wishlistForm.productNo.value);
		xhttp.send();
		xhttp.onreadystatechange = function () {
			if (this.readyState == 4 && this.status == 200) {
				opener.parent.location.reload();
				window.close();
			}
		}
	}

</script>
</body>
</html>