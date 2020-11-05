<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 회원가입style시작 -->
<style>
.sign{
    width:50%;
    height:700px;
  	margin:0 auto;
  	margin-top:100px;
}
.td1{
   padding: 10px;
   margin: 10px
}

.JJ{
   height: 26px;
   width: 60px;
}

.address{
   margin:2px;
}
</style>
<link href="../resources/css/seekId.css" rel="stylesheet" type="text/css">
<body width="100%" height="100%">
	<form method="post" class="sign" name="signUpForm" action="signup">
		<table width="720">
			<h2 align="center">회원가입</h2>
			<tr height="2" bgcolor="#000000">
				<td colspan="2"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td class="td1">
				<input type="text" id="id" name="id" value="${kakaoId }">
				<div id="id_check"></div>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td class="td1"><input type="password" name="pwd"> 영문/숫자포함 6자 이상</td>
			</tr>
			<tr>
				<th>비밀번호확인</th>
				<td class="td1">
				<input type="password" name="rePwd"  onkeyup="checkPwd()">
				<div id="checkPwd">동일한 암호를 입력하세요.</div>
				</td>
			</tr>
			<tr>
				<th>이 름</th>
				<td class="td1"><input type="text" name="name" value="${kakaoName }"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td class="td1">
					<input type="text" name="email1" value="" onfocus="this.value='';"> @ 
					<input type="text" name="email2" value="" readonly> 
					<select name="emailBox" onchange="email_change()">
						<option value="0" disabled selected>선택하세요</option>
						<option value="9">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="nate.com">nate.com</option>
						<option value="daum.net">daum.net</option>
						<option value="gmail.com">gmail.com</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>핸드폰 번호</th>
				<td class="td1"><select name="tel1">
						<option value="" disabled selected>---</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
				</select> - <input type="text" name="tel2" class="JJ"> - <input
					type="text" name="tel3" class="JJ"></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td class="td1"><input type="date" name="birthday"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td class="td1">
					<input type="radio" name="gender" value="M"> 남자 
					<input type="radio" name="gender" value="F"> 여자
				</td>
			</tr>
			<tr>
				<th>주 소</th>
				<td class="td1">
					<input type="text" name="zipcode" id="sample6_postcode" class="address" readonly style="width:60px;">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" name="address1" id="sample6_address" placeholder="주소" class="address" readonly><br>
					<input type="text" name="address2" id="sample6_detailAddress" placeholder="상세주소" class="address">
					<input type="text" name="address3" id="sample6_extraAddress" placeholder="참고항목" class="address" readonly>
				</td>
			</tr>

			<tr height="2" bgcolor="#000000">
				<td colspan="2"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" class="btn_member_white_signup"
					value="회원가입" onclick="button()"> <input type="reset" class="btn_member_white_signup" value="취소" onclick="javscript:window.history.back()"></td>
			</tr>
		</table>
	</form>
	<script src="/easycook/resources/js/login.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://kit.fontawesome.com/3eee069757.js"></script>
	<script type="text/javascript">

 function checkPwd(){
  var f1 = document.forms[0];
  var pwd = f1.pwd.value;
  var rePwd = f1.rePwd.value;
  if(pwd!=rePwd){
   document.getElementById('checkPwd').style.color = "red";
   document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요.";
  }else{
   document.getElementById('checkPwd').style.color = "black";
   document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다.";
   
  }
};
//아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$("#id").blur(function() {
		var id = $('#id').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/member/idCheck?id='+ id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다.");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					} else {
						
						/* if(idJ.test(id)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("");
							$("#reg_submit").attr("disabled", false);
				
						} else  */if(id == ""){
							
							$('#id_check').text('아이디를 입력해주세요 :)');
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);				
							
						} else {
							
							$('#id_check').text("사용가능한 아이디입니다.");
							$('#id_check').css('color', 'blue');
							$("#reg_submit").attr("disabled", true);
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
</script>
	<!-- 다음 주소검색 APi -->
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c3b575d9b62709c133865c5dc51d0cc&libraries=services"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
