<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="./style.css">
<title>로그인</title>
</head>
<!-- 다음 주소검색 APi -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=발급받은 API KEY를 사용하세요&libraries=services"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapOption = {
		center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
		level : 5
	// 지도의 확대 레벨
	};

	//지도를 미리 생성
	var map = new daum.maps.Map(mapContainer, mapOption);
	//주소-좌표 변환 객체를 생성
	var geocoder = new daum.maps.services.Geocoder();
	//마커를 미리 생성
	var marker = new daum.maps.Marker({
		position : new daum.maps.LatLng(37.537187, 127.005476),
		map : map
	});

	function sample5_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = data.address; // 최종 주소 변수

				// 주소 정보를 해당 필드에 넣는다.
				document.getElementById("sample5_address").value = addr;
				// 주소로 상세 정보를 검색
				geocoder.addressSearch(data.address, function(results, status) {
					// 정상적으로 검색이 완료됐으면
					if (status === daum.maps.services.Status.OK) {

						var result = results[0]; //첫번째 결과의 값을 활용

						// 해당 주소에 대한 좌표를 받아서
						var coords = new daum.maps.LatLng(result.y, result.x);
						// 지도를 보여준다.
						mapContainer.style.display = "block";
						map.relayout();
						// 지도 중심을 변경한다.
						map.setCenter(coords);
						// 마커를 결과값으로 받은 위치로 옮긴다.
						marker.setPosition(coords)
					}
				});
			}
		}).open();
	}
</script>
<!-- 다음 주소검색 APi -->
<style>
* {
	margin: 0px;
	padding: 0px;
	text-decoration: none;
	font-family: sans-serif;
}

body {
	background-image: #34495e;
	background-color: #387cbd;
}

.signUpForm {
	position: absolute;
	width: 400px;
	height: 800px;
	padding: 30px, 20px;
	background-color: #FFFFFF;
	text-align: center;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	border-radius: 15px;
}

.signUpForm h2 {
	text-align: center;
	margin: 30px;
}

.Form {
	border-bottom: 2px solid #adadad;
	margin: 22px;
	padding: 10px 10px;
}

.Form2 {
	border-bottom: 2px solid #adadad;
	margin: 22px;
	padding: 10px 10px;
}

.input {
	width: 100%;
	border: none;
	outline: none;
	color: #636e72;
	font-size: 16px;
	height: 25px;
	background: none;
}

.btn {
	position: relative;
	left: 40%;
	transform: translateX(-50%);
	margin-bottom: 40px;
	width: 80%;
	height: 40px;
	background: linear-gradient(125deg, #81ecec, #6c5ce7, #81ecec);
	background-position: left;
	background-size: 200%;
	color: white;
	font-weight: bold;
	border: none;
	cursor: pointer;
	transition: 0.4s;
	display: inline;
}

.btn:hover {
	background-position: right;
}

.bottomText {
	text-align: center;
}

.search {
	width: 100%;
	border: none;
	outline: none;
	color: #636e72;
	font-size: 16px;
	background: none;
}
</style>
<body width="100%" height="100%">
	<form action="signup" method="post" class="signUpForm">
		<h2>회원가입</h2>

		<div class="Form">
			<input type="text" class="input" placeholder="아이디" name="id">
		</div>

		<div class="Form">
			<input type="password" class="input" placeholder="비밀번호" name="pwd">
		</div>

		<!-- <div class="Form">
			<input type="text" class="input" placeholder="이름" name="name">
		</div>

		<div class="Form">
			<input type="text" class="input" placeholder="이메일" name="email">
		</div>

		<div class="Form">
			<input type="text" class="input" placeholder="tel" name="tel">
		</div>

		<div class="Form">
			<input type="text" class="input" placeholder="생년월일" name="birthday">
		</div>

		<div class="Form">
			<input type="text" class="input" placeholder="성별" name="gender">
		</div>

		<div class="Form2">
			<input type="text" class="search" id="sample5_address"
				placeholder="주소"> <input type="button"
				onclick="sample5_execDaumPostcode()" value="주소검색">
		</div> -->

		<button type="button" class="btn" onclick="button()">SIGN UP</button>
		<script>
			function button() {
				const signUpForm = document.querySelector('.signUpForm');
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
				signUpForm.submit();
			}
		</script>
		<div>
			<a href="memJoin">뒤로가기</a>
		</div>
	</form>
	<!-- Optional JavaScript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://kit.fontawesome.com/3eee069757.js"></script>
	<script src="js/login.js"></script>
</body>
</html>