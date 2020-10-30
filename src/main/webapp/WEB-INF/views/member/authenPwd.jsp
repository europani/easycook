<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/css/seekId.css" rel="stylesheet" type="text/css">
</head>
<body>
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
			<form id="formFindId" method="post" class="authen_form" action="authenPwd">
				<div class="find_id_box">
					<div class="find_id_sec">
					<h3>인증번호</h3>
					<div class="login_input">
						<table>
							<tr>
								<td class="td1">
									<input type="text" name="key" placeholder="">
								</td>
							</tr>
							<tr>
								<tr><button type="button" class="btn_authen_id" onclick="button()">제출하기</button></tr>
							</tr>
						</table>
					</div>
					</div>
					<!-- //find_id_sec -->
					<div class="btn_member_sec">

							<strong>
							<br>
							입력하신 이메일로 인증번호를 보냈습니다.<br>
							인증번호를 10분 안에 입력해주세요.<br>
							</strong>

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
			const form = document.querySelector('.authen_form');
			if (form.key.value == "") {
				alert('인증번호를 입력해주세요.');
				form.key.focus();
				return;
			}
			form.submit();
		}
</script> 
</div>
</div>
</div>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />