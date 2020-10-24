<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
      #jb-container {
        width: 95%;
        margin: 0px auto;
        padding: 10px;
        /* border: 1px solid #bcbcbc; */
      }
      #jb-header {
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #bcbcbc;
      }
      #jb-content {
        width: 85%;
        padding: 20px;
        margin-bottom: 20px;
        float: right;
        /* border: 1px solid #bcbcbc; */
      }
      #jb-sidebar {
        width: 300px;
        padding: 15px;
        margin-bottom: 20px;
        float: left;
        /* border: 1px solid #bcbcbc; */
      }
      #jb-footer {
        clear: both;
        padding: 20px;
        border: 1px solid #bcbcbc;
      }
      .form {
		width: 200px;
		height: 388px;
		box-sizing: border-box;
		border: 1px solid gray;
		margin: 0 auto;
		padding: 8px 15px;
	  }
      #content-detail {
      	border: 1px solid #bcbcbc;
      	padding: 30px 20px 30px 20px;
      }
      .btn-search {	/* 나중에 추가할 버튼양식 */
	    display: inline-block;
	    margin-left: 30px;
	    width: 103px;
	    height: 36px;
	    line-height: 36px;
	    background-color: #606060;
	    font-size: 14px;
	    color: white;
	    vertical-align: top;
	    text-align: center;
	   }
      table {
		  border-collapse: collapse;
		  width: 100%;
	   }

	  th,td {
		  padding: 8px;
		  text-align: left;
		  border-bottom: 1px solid #ddd;
	   }
	  
	  p {
		  text-align: center;
		}
	  h4 {
		  text-align: center;
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
  <body>
    <jsp:include page="/WEB-INF/views/common/mypageSidebar.jsp" />
    <div id="jb-container">
      <div id="jb-content">
        <h2>회원수정</h2>
        <hr>
        <br><br>
        <h3 align="left">01.기본 회원정보</h3>
        <br>	
        <div id="content-detail">
	    <form method="post" class="sign" name="signUpForm" action="modify">
			<table width="720">
			<h2 align="center">회원가입</h2>
			<tr height="2" bgcolor="#000000">
				<td colspan="2"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td class="td1"><input type="hidden" name="id" value="${member.id}">${member.id}</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td class="td1"><input type="password" name="pwd" placeholder="기존비밀번호를 입력해주세요"> 영문/숫자포함 6자 이상</td>
			</tr>
			<tr>
				<th>이 름</th>
				<td class="td1"><input type="text" name="name" value="${info.name}"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td class="td1">
					<input type="text" name="email1" value="${info.email1}"> @ 
					<input type="text" name="email2" value="${info.email2}" readonly> 
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
				</select> - <input type="text" name="tel2" class="JJ" value="${info.tel2}"> - <input
					type="text" name="tel3" class="JJ" value="${info.tel3}"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td class="td1">
					<input type="radio" name="gender" value="M" checked=${info.gender=='M'? checked : ''}> 남자 
					<input type="radio" name="gender" value="F" checked=${info.gender=='F'? checked : ''}> 여자
				</td>
			</tr>
			<tr>
				<th>주 소</th>
				<td class="td1">
					<input type="text" name="zipcode" id="sample6_postcode" value="${info.zipcode}" readonly style="width:60px;">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" name="address1" id="sample6_address" value="${info.address1}" class="address" readonly><br>
					<input type="text" name="address2" id="sample6_detailAddress" value="${info.address2}" class="address">
					<input type="text" name="address3" id="sample6_extraAddress" value="${info.address3}" class="address" readonly>
				</td>
			</tr>

			<tr height="2" bgcolor="#000000">
				<td colspan="2"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="수정하기" onclick="button2()"> 
					<input type="button" value="뒤로가기" onclick="javascript:history.back()">
				</td>
			</tr>
		</table>
	</form>
	      <br><br>     
       </div>
       <br><br>
		</div>
		<br><br><br><br> 	
      </div>
     
      
      <div id="jb-footer">
        <br>
      </div>
<script src="/easycook/resources/js/login.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c3b575d9b62709c133865c5dc51d0cc&libraries=services"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	// Accordion 
	function myAccFunc(id) {
	  var x = document.getElementById(id);
	  if (x.className.indexOf("w3-show") == -1) {
	    x.className += " w3-show";
	  } else {
	    x.className = x.className.replace(" w3-show", "");
	  }
	}

	document.signUpForm.tel1.value='${info.tel1}';
	document.signUpForm.emailBox.value='${info.email2}';
</script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />