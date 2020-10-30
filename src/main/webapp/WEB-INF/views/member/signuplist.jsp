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
    <form action="login" method="post" class="signuplistForm">
   	<br><br><br><br>
      <div id="login" style="text-align: center" class="lgimg">
     	 <a href="signup"><img width="471" src="/easycook/resources/images/easycook_join_btn.png"/></a>
   	  </div>
   	  <hr class="sun2">
   	  <hr class="sun">
       <div id="kakao_id_login" style="text-align: center" class="lgimg">
   		<a href="https://kauth.kakao.com/oauth/authorize?client_id=0e5da3292d8e58d5694244ef5bc3539e&redirect_uri=http://localhost:8089/easycook/member/kakaosignup&response_type=code"> <img width="471" src="/easycook/resources/images/kakao_join_btn.png" /></a>
 	   </div>
 	   <div id="naver_id_login" style="text-align: center" class="lgimg">
   		<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=EnK74f3hGUlXI4fXhp2I&redirect_uri=http://localhost:8089/easycook/member/naversignup&state=5220"> <img width="471" src="/easycook/resources/images/naver_join_btn.png" /></a>
 	   </div>
 	   <strong class="chk_non">
 	    <img width="16" height="16" src="/easycook/resources/images/warning.png"/>
	 	   &nbsp;SNS계정을 연동하여 빠르고 쉽고 안전하게 회원가입 할 수 있습니다.<br>
		  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 이 과정에서 고객님의 데이터는 철저하게 보호됩니다.
 	   </strong>
 	   <br><br>
 	   <p class="psignuplist">이미 쇼핑몰 회원이세요? <a href="/easycook/member/login">로그인</a></p>
    </form>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />