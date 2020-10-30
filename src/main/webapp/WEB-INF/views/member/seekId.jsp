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
			<h2>아이디찾기</h2>
		</div>
		<!-- //member_tit -->
		<div class="member_cont">
			<form id="formFindId" method="post" action="seekId" class="seekForm">
				<div class="find_id_box">
					<div class="find_id_sec">
						<h3>회원 아이디찾기</h3>						
						<div class="form_element radio_find_type">            
							<input type="radio" id="aaa" name="findIdFl" value="email" onchange="setDisplay()">            
							<label for="findIdEmail" class="choice_s on" >이메일</label>&nbsp;            
							<input type="radio" id="bbb" name="findIdFl" value="cellPhone" onchange="setDisplay()">            
							<label for="findIdPhone" class="choice_s" >휴대폰번호</label>    
							        
						</div>
						
					<div id="emailForm" class="login_input" style="display: none;">
						<table>
							<tr>
								<td class="td1">
									<input type="text" name="name" id="name1" placeholder="이름">
								</td>
							</tr>
							<tr>
								<td class="td1">
									<input type="text" name="email1" placeholder="이메일">
								</td>
								<tr><button type="button" class="btn_member_id" onclick="button(); return false;">아이디 찾기</button></tr>
							</tr>
						</table>
					</div>
					
					<div id="telForm" class="login_input" style="display: none;">
					<table>
						<tr>
							<td class="td1">
								<input type="text" name="name" id="name2" placeholder="이름">
							</td>
						</tr>
						<tr>
							<td class="td1">
								<input type="text" name="tel2" placeholder="핸드폰번호" onKeyup="inputPhoneNumber(this);"> 
							</td>
							<tr><button type="submit" class="btn_member_id">아이디 찾기</button></tr>
						</tr>
					</table>
					</div>
					
						<!-- <p class="dn js_caution_msg1">일치하는 회원정보가 없습니다. 다시 입력해 주세요.</p> -->
					</div>
					<!-- //find_id_sec -->
					<div class="btn_member_sec">
						<ul>
							<li><button class="btn_member_white js_btn_find_password" type="button" onclick="location.href='seekPwd'">비밀번호 찾기</button></li>
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
	const emailForm = document.querySelector('#emailForm');
	const telForm = document.querySelector('#telForm');
	
      function button() {
			const seekForm = document.querySelector('.seekForm');
			if (seekForm.id.value == "") {
				alert('아이디를 입력해주세요.');
				seekForm.id.focus();
				return;
			}
			seekForm.submit();
		}

      function setDisplay(){
    	    if($('input:radio[id=aaa]').is(':checked')){	// email
    	        $('#emailForm').show();
    	        $('#name1').attr("disabled", false);
    	        $('input[name=email1]').attr("disabled", false);
    	        $('#telForm').hide();
    	        $('#name2').attr("disabled", true);
    	        $('input[name=tel2]').attr("disabled", true);
    	    }else{		// tel
    	    	$('#telForm').show();
    	    	$('#name2').attr("disabled", false);
    	    	$('input[name=tel2]').attr("disabled", false);
    	        $('#emailForm').hide();
    	        $('#name1').attr("disabled", true);
    	        $('input[name=email1]').attr("disabled", true);
    	    }
    	}
      
      function inputPhoneNumber(obj) {
    	    var number = obj.value.replace(/[^0-9]/g, "");
    	    var phone = "";

    	    if(number.length < 4) {
    	        return number;
    	    } else if(number.length < 7) {
    	        phone += number.substr(0, 3);
    	        phone += "-";
    	        phone += number.substr(3);
    	    } else if(number.length < 11) {
    	        phone += number.substr(0, 3);
    	        phone += "-";
    	        phone += number.substr(3, 3);
    	        phone += "-";
    	        phone += number.substr(6);
    	    } else {
    	        phone += number.substr(0, 3);
    	        phone += "-";
    	        phone += number.substr(3, 4);
    	        phone += "-";
    	        phone += number.substr(7);
    	    }
    	    obj.value = phone;
    	}
      </script>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />