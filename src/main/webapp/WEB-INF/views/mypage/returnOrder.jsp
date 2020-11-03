<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 align="center">정말로 주문을 취소하시겠습니까? (주문번호 : ${ordersNo })</h2>
<h4 align="center">주문 취소 후에는 변경할 수 없습니다!</h4>
<form method="post" name="returnForm" >
<input type="button" value="확인" onclick="returnOrder()">
<input type="hidden" name="no" value="${ordersNo }">
</form>

<script>
	function returnOrder() {	
		const returnForm = document.returnForm;
		let xhttp = new XMLHttpRequest();
		xhttp.open("POST", "/easycook/order/returnOrder/" + returnForm.no.value);
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