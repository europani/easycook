<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- Custom styles for this template -->
  <link href="../resources/admin/css/simple-sidebar.css" rel="stylesheet">
</head>
<script>
	function active(target){
		var lgh = document.getElementsByClassName("bg-light_active");
		if(lgh.length > 0){
			for(var i =0; i<lgh.length; i++){
				lgh[i].classList.toggle("bg-light_active");	
			}
		}
		target.classList.toggle("bg-light_active");
	}
</script>
<body>
<div class="example" style="float :left;">
               <!-- Sidebar-->
               <div class="bg-light border-right" id="sidebar-wrapper" style="text-align: center; font-weight: bold;">
                  <div class="sidebar-heading">마이페이지</div>
                  <div class="list-group list-group-flush">
                     <a href="#"
                        class="list-group-item list-group-item-action bg-light" onclick="active(this)">주문내역</a>
                     <a href="cart"
                        class="list-group-item list-group-item-action bg-light" onclick="active(this)">장바구니</a>
                     <a href="wishlist"
                        class="list-group-item list-group-item-action bg-light" onclick="active(this)">찜목록</a>
                     <a href="#"
                        class="list-group-item list-group-item-action bg-light" onclick="active(this)">정보수정</a>
                     <a href="#"
                        class="list-group-item list-group-item-action bg-light" onclick="active(this)">회원탈퇴</a>
                  </div>
               </div>
            </div>
               <!-- /#sidebar-wrapper -->
</body>
</html>