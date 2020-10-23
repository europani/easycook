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

function email_change() {

		if (document.signUpForm.emailBox.options[document.signUpForm.emailBox.selectedIndex].value == '9') {
			document.signUpForm.email2.readOnly = false;
			document.signUpForm.email2.value = "";
			document.signUpForm.email2.focus();
		} else {
			document.signUpForm.email2.value = document.signUpForm.emailBox.options[document.signUpForm.emailBox.selectedIndex].value;
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
		if (signUpForm.rePwd.value == "") {
			alert('비밀번호를 입력해주세요.');
			signUpForm.rePwd.focus();
			return;
		}
		if (signUpForm.pwd.value != signUpForm.rePwd.value) {
			alert('비밀번호가 일치하지 않습니다.');
			signUpForm.rePwd.focus();
			return;
		} 
		if (signUpForm.name.value == "") {
			alert('이름을 입력해주세요.');
			signUpForm.name.focus();
			return;
		}
		if (signUpForm.birthday.value == "" ) {
			alert('생년월일을 입력해주세요.');
			signUpForm.birthday.focus();
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
	
	function button2() {
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