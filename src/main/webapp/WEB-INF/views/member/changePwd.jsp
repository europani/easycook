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
			<h2>비밀번호 변경</h2>
		</div>
		<!-- //member_tit -->
		<div class="member_cont">
			<form id="formFindId" method="post" class="authen_form" action="changePwd">
				<div class="find_id_box">
					<div class="find_id_sec">
					<h3>변경하실 비밀번호를 입력하세요.</h3>
					<div id="emailForm" class="login_input">
						<table>
							<tr>
								<td class="td1">
									<input type="password" name="pwd" placeholder="비밀번호">
								</td>
							</tr>
							<tr>
								<td class="td1">
									<input type="password" name="rePwd" placeholder="비밀번호 확인">
								</td>
							</tr>
							<tr>
								<tr><button type="button" class="btn_member_id" onclick="button()">제출하기</button></tr>
							</tr>
						</table>
					</div>
					</div>
					<!-- //find_id_sec -->
					<div class="btn_member_sec">

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
			if (form.pwd.value == "") {
				alert('비밀번호를 입력해주세요.');
				form.pwd.focus();
				return;
			}
			if (form.rePwd.value == "") {
				alert('비밀번호를 입력해주세요.');
				form.rePwd.focus();
				return;
			}
			if (form.pwd.value != form.rePwd.value) {
				alert('비밀번호가 일치하지 않습니다.');
				form.rePwd.focus();
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