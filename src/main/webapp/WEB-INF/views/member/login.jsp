<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<link href="../resources/css/seekId.css" rel="stylesheet" type="text/css">
<div id="container">
        <div id="contents">
        <!-- 본문 시작 -->
            <div class="sub_content">

                <!-- //side_cont -->
<div class="content_box">
	<div class="member_wrap">
		<div class="member_tit">
			<h2>로그인</h2>
		</div>
		<!-- //member_tit -->
		<div class="member_cont">
			<form id="formLogin" method="post" action="login" class="loginForm">
				<input type="hidden" id="mode" name="mode" value="login"/>
				<input type="hidden" id="returnUrl" name="returnUrl" value="https://www.mychef.kr:443"/>
				<div class="member_login_box">
					<h3>회원 로그인</h3>
					<div class="login_input_sec">
						<div>
							<input type="text" id="loginId" name="id" value="" placeholder="아이디" required="true">
							<input type="password" id="loginPwd" name="pwd" value="" placeholder="비밀번호" required="true">
						</div>
						<button type="button" class="btn_member_id" onclick="button();">로그인</button>
					</div>
					<div class="id_chk">
						<p class="dn js_caution_msg1">&nbsp;</p>
					</div>
				</div>
				<!-- //login_box -->
				<div class="member_sns_login">
					<a href="https://kauth.kakao.com/oauth/authorize?client_id=0e5da3292d8e58d5694244ef5bc3539e&redirect_uri=http://localhost:8089/easycook/member/kakaologinCallback&response_type=code"> <img width="471" src="/easycook/resources/images/kakao_login_btn.png" class="btn_social"/></a>
					<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=38SdDQt0VXvmWJ3wviN6&redirect_url=http://localhost:8089/easycook/member/naverCallback&state=8297"> <img width="471" src="/easycook/resources/images/naver_login_btn.png" class="btn_social"/></a>
				</div>
				<div class="btn_login_box">
					<ul>
						<li><button type="button" id="signuplist" class="btn_member_join" onclick="location.href='signuplist'">회원가입</button></li>
						<li><button type="button" id="seekId" class="btn_member_white" onclick="location.href='seekId'">아이디 찾기</button></li>
						<li><button type="button" id="seekPwd" class="btn_member_white" onclick="location.href='seekPwd'">비밀번호 찾기</button></li>
					</ul>
				</div>
				<!-- //btn_login_box -->
			</form>
		</div>
		<!-- //member_cont -->
	</div>
	<!-- //member_wrap -->
</div>
<!-- //content_box -->
            </div>
           <!-- //sub_content -->
         </div>
       <!-- //본문 끝 contents -->
     </div>
<!-- //container -->
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
<jsp:include page="/WEB-INF/views/common/footer.jsp" />