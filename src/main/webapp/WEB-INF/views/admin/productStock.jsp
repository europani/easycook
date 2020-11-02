<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${product.productNo} 재고관리</title>
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
<form name="stockForm" method="post">
<table>
<tr>
	<td><input type="hidden" name="no" value="${product.productNo}">NO : ${product.productNo}</td> <td>재고 : ${product.productStock}</td>
<tr>
<tr><td colspan="2"><font color="red"> ${product.productStock}</font> ▶ <input name="productStock" style="width:30px;"></td></tr>
<tr><td colspan="2"><input type="button" value="변경" onclick="modify()"> </td></tr>
</table>
</form>

<script>
	function modify() {
		const stockForm = document.stockForm;
		const no = document.querySelector('#no');
		let xhttp = new XMLHttpRequest();
		xhttp.open("POST", "/easycook/admin/product/stock/" + stockForm.no.value + "?productStock" + "=" + stockForm.productStock.value);
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