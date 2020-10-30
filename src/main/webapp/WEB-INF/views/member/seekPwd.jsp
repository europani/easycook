<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link href="../resources/css/seekId.css" rel="stylesheet" type="text/css">
<div id="container">
        <div id="contents">
        <!-- 본문 시작 -->
            <div class="sub_content">

                <!-- //side_cont -->
<div class="content_box">
	<div class="member_wrap">
		<div class="member_tit">
			<h2>비밀번호찾기</h2>
		</div>
		<!-- //member_tit -->
		<div class="member_cont">
			<form id="formFindId" method="post" class="seekForm" action="seekPwd">
				<div class="find_id_box">
					<div class="find_id_sec">
					<h3>회원 비밀번호찾기</h3>
					<div id="emailForm" class="login_input">
						<table>
							<tr>
								<td class="td1">
									<input type="text" name="id" id="id" placeholder="아이디">
								</td>
							</tr>
							<tr>
								<td class="td1">
									<input type="text" name="email" placeholder="이메일">
								</td>
								<tr><button class="btn_member_id" onclick="button()">비밀번호 찾기</button></tr>
							</tr>
						</table>
					</div>
						<!-- <p class="dn js_caution_msg1">일치하는 회원정보가 없습니다. 다시 입력해 주세요.</p> -->
					</div>
					<!-- //find_id_sec -->
					<div class="btn_member_sec">
						<ul>
							<li><button class="btn_comfirm js_btn_login" type="button" onclick="location.href='login'">로그인하기</button></li>
						</ul>
					</div>
					<!-- //btn_member_sec -->
				</div>
				<!-- //find_id_box -->
			</form>
		</div>
		<!-- //member_cont -->
	</div>
	<!-- //member_wrap -->
</div>
<!-- //content_box -->
<script>
      function button() {
			const seekForm = document.querySelector('.seekForm');
			if (seekForm.id.value == "") {
				alert('아이디를 입력해주세요.');
				seekForm.id.focus();
				return;
			}
			if (seekForm.email.value == "") {
				alert('이메일을 입력해주세요.');
				seekForm.email.focus();
				return;
			}
			seekForm.submit();
		}
</script> 
</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />