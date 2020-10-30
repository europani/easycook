<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<body>
<link href="../resources/css/seekId.css" rel="stylesheet" type="text/css">
<div id="container">
        <div id="contents">
        <!-- 본문 시작 -->
            <div class="sub_content">

                <!-- //side_cont -->
<div class="content_box">
	<div class="member_wrap">
		<div class="member_tit">
			<h2>아이디찾기</h2>
		</div>
		<!-- //member_tit -->
		<div class="member_cont">
			<form id="formFindId" method="post" action="seekId" class="seekForm">
				<div class="find_id_box">
					<div class="find_id_sec">
						<h3>고객님의 ID는 <font color="red">${id}</font>입니다.</h3>						
					</div>
					<!-- //find_id_sec -->
				<div class="btn_member_sec">
						<ul>
							<li><button class="btn_member_white js_btn_find_password" type="button" onclick="location.href='seekPwd'">비밀번호 찾기</button></li>
							<li><button class="btn_comfirm js_btn_login" type="button" onclick="location.href='login'">로그인하기</button></li>
						</ul>
					</div>
				</div>
				<!-- //find_id_box -->
			</form>
		</div>
		<!-- //member_cont -->
	</div>
	<!-- //member_wrap -->
</div>




<jsp:include page="/WEB-INF/views/common/footer.jsp" />