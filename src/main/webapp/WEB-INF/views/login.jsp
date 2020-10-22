<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<jsp:include page="common/header.jsp" />
<!DOCTYPE html>

   
<link href="../resources/css/login.css" rel="stylesheet" type="text/css">
    <form action="login" method="post" class="loginForm">
      <h2>로그인창</h2>
      <div class="idForm">
        <input type="text" class="id" placeholder="ID" name="id">
      </div>
      <div class="passForm">
        <input type="password" class="pw" placeholder="PW" name="pwd">
      </div>
      <div class="bottomText">
        Don't you have ID? <a href="signup">sign up</a>
      </div>
      <div id="login" style="text-align: center" class="lgimg">
     	 <img width="223" src="/easycook/resources/images/login_btn.png" onclick="button()" />
   	  </div>
       <div id="kakao_id_login" style="text-align: center">
   		<a href="https://kauth.kakao.com/oauth/authorize?client_id=0e5da3292d8e58d5694244ef5bc3539e&redirect_uri=http://localhost:8089/easycook/member/kakaologinCallback&response_type=code"> <img width="223" src="/easycook/resources/images/kakao_login_btn_medium_narrow.png" /></a>
 	   </div>
    </form>
    <script>
      function button() {
			const loginForm = document.querySelector('.loginForm');
			if (loginForm.id.value == "") {
				alert('아이디를 입력해주세요.');
				loginForm.id.focus();
				return;
			}
			if (loginForm.pwd.value == "") {
				alert('비밀번호를 입력해주세요.');
				loginForm.pwd.focus();
				return;
			}
			loginForm.submit();
		}
      </script>
 <jsp:include page="common/footer.jsp" />