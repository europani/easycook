  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type>
      .btn-search {   /* 나중에 추가할 버튼양식 */
       display: inline-block;
       margin-left: 160px;
       width: 103px;
       height: 36px;
       line-height: 36px;
       background-color: #606060;
       font-size: 14px;
       color: white;
       vertical-align: top;
       text-align: center;
      }

</style>
</head>
<c:if test="${wishlistCheck == true}">
<h4 align="center">${productName } 상품을 위시리스트에 추가합니다.</h4>
<form method="post" name="wishlistForm">
<input type="button" class="btn-search" value="확인" onclick="wishlistadd()">
<input type="hidden" name="productNo" value="${productNo }">
</form>
</c:if>
<c:if test="${wishlistCheck == false}">
<h4 align="center">${productName } 상품은 이미 위시리스트에 있습니다.</h4>
<button type="button" class="btn-search" onclick="window.close()">확인</button>
</c:if>
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