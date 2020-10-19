<jsp:include page="common/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>로그인</title>
</head>
<!-- 다음 주소검색 APi -->
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c3b575d9b62709c133865c5dc51d0cc&libraries=services"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
</script>
<!-- 회원가입style시작 -->
<style>
.sign{
    position:sticky;
    width:47%;
    height:800px;
    background-color:#FFFFFF;
    transform: translate( 50%, 05%);
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
   width:250px;
}
</style>


<!-- 이메일 직접입력 -->
<script type="text/javascript">
	function email_change() {

		if (document.signUpForm.email.options[document.signUpForm.email.selectedIndex].value == '0') {
			document.signUpForm.email2.disabled = true;
			document.signUpForm.email2.value = "";
		}

		if (document.signUpForm.email.options[document.signUpForm.email.selectedIndex].value == '9') {
			document.signUpForm.email2.disabled = false;
			document.signUpForm.email2.value = "";
			document.signUpForm.email2.focus();
		} else {
			document.signUpForm.email2.disabled = true;
			document.signUpForm.email2.value = document.signUpForm.email.options[document.signUpForm.email.selectedIndex].value;
		}
	}

	function button() {
		if (signUpForm.id.value == "") {
			alert('아이디를 입력해주세요.');
			signUpForm.id.focus();
			return;
		}
		if (signUpForm.pwd.value == "") {
			alert('비밀번호를 입력해주세요.');
			signUpForm.pwd.focus();
			return;
		}
		if (signUpForm.name.value == "") {
			alert('이름을 입력해주세요.');
			signUpForm.name.focus();
			return;
		}
		if (signUpForm.birth1.value == "" || signUpForm.birth2.value == "" || signUpForm.birth3.value == "") {
			alert('생년월일을 입력해주세요.');
			signUpForm.birth1.focus();
			return;
		}
		if (signUpForm.email1.value == "" || signUpForm.email2.value == "") {
			alert('이메일을 입력해주세요.');
			signUpForm.email1.focus();
			return;
		}
		if (signUpForm.zipcode.value == "") {
			alert('주소를 입력해주세요.');
			return;
		}
		if (signUpForm.tel1.value == "" || signUpForm.tel2.value == ""|| signUpForm.tel3.value == "") {
			alert('핸드폰번호를 입력해주세요.');
			signUpForm.tel1.focus();
			return;
		}
		if (signUpForm.gender.value == "") {
			alert('성별을 입력해주세요.');
			signUpForm.gender.focus();
			return;
		}
		signUpForm.submit();
	}
</script>
<body width="100%" height="100%">
	<form method="post" class="sign" name="signUpForm" action="signup">
		<table width="720">
			<h2 align="center">회원가입</h2>
			<tr height="2" bgcolor="#000000">
				<td colspan="2"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td class="td1"><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td class="td1"><input type="password" name="pwd"> 영문/숫자포함 6자 이상</td>
			</tr>
			<tr>
				<th>이 름</th>
				<td class="td1"><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td class="td1">
					<input type="text" name="email1" value="" onfocus="this.value='';"> @ 
					<input type="text" name="email2" value="" disabled> 
					<select name="email" onchange="email_change()">
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
				<td class="td1"><select name="birth1">
						<%
							for (int i = 2013; i >= 1900; i--) {
						%>
						<option value="<%=i%>"><%=i%></option>
						<%
							}
						%>
				</select>년&nbsp; <select name="birth2">
						<%
							for (int i = 1; i <= 12; i++) {
						%>
						<option value="<%=i%>"><%=i%></option>
						<%
							}
						%>
				</select>월&nbsp; <select name="birth3">
						<%
							for (int i = 1; i <= 31; i++) {
						%>
						<option value="<%=i%>"><%=i%></option>
						<%
							}
						%>
				</select>일</td>
			</tr>
			<tr>
				<th>성별</th>
				<td class="td1">
					<input type="radio" name="gender" value="남자"> 남자 
					<input type="radio" name="gender" value="여자"> 여자
				</td>
			</tr>
			<tr>
				<th>주 소</th>
				<td class="td1">
					<input type="text" name="zipcode" id="sample6_postcode" disabled="disabled" style="width:60px;">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" name="address1" id="sample6_address" placeholder="주소" disabled="disabled" class="address"><br>
					<input type="text" name="address2" id="sample6_detailAddress" placeholder="상세주소" class="address">
					<input type="text" name="address3" id="sample6_extraAddress" placeholder="참고항목" disabled="disabled" class="address">
				</td>
			</tr>

			<tr height="2" bgcolor="#000000">
				<td colspan="2"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button"
					value="회원가입" onclick="button()"> <input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
	<!-- Optional JavaScript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://kit.fontawesome.com/3eee069757.js"></script>
</body>
</html>
<jsp:include page="common/footer.jsp" />
