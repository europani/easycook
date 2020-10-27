<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="../resources/css/login.css" rel="stylesheet" type="text/css">
<body>
    <form action="login" method="post" class="loginForm">
   	<br><br><br><br><br><br><br>
      <div id="login" style="text-align: center" class="lgimg">
     	 <a href="signup"><img width="223" src="/easycook/resources/images/login_btn.png"/></a>
   	  </div>
       <div id="kakao_id_login" style="text-align: center" class="lgimg">
   		<a href="https://kauth.kakao.com/oauth/authorize?client_id=0e5da3292d8e58d5694244ef5bc3539e&redirect_uri=http://localhost:8089/easycook/member/kakaosignup&response_type=code"> <img width="223" src="/easycook/resources/images/kakao_login_btn_medium_narrow.png" /></a>
 	   </div>
 	   <div id="naver_id_login" style="text-align: center">
   		<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=EnK74f3hGUlXI4fXhp2I&redirect_uri=http://localhost:8089/easycook/member/naversignup&state=5220"> <img width="223" src="/easycook/resources/images/naver_btn.png" /></a>
 	   </div>
    </form>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />