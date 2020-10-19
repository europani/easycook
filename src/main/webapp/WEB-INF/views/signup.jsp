<jsp:include page="common/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>로그인</title>
  </head>
  <!-- 다음 주소검색 APi -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0c3b575d9b62709c133865c5dc51d0cc&libraries=services"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
<!-- 회원가입style시작 -->
<style>
.sign{
   position:sticky;
  width:650px;
  height:800px;
  /* padding: 30px, 20px; */
  background-color:#FFFFFF;
  /* top:50%; */
  /* left:56%; */
  transform: translate( 70%, 10%);
}
.td1{
	padding: 10px;
	margin: 10px
}

.JJ{
	height: 26px;
	width: 60px;
}
</style>

<!-- 다음 주소검색 APi -->  

<!-- 이메일 직접입력 -->
<script type="text/javascript">

function email_change(){

  if(document.join.email.options[document.join.email.selectedIndex].value == '0'){

   document.join.email2.disabled = true;

   document.join.email2.value = "";

  }

  if(document.join.email.options[document.join.email.selectedIndex].value == '9'){

   document.join.email2.disabled = false;

   document.join.email2.value = "";

   document.join.email2.focus();

  } else{

   document.join.email2.disabled = true;

   document.join.email2.value = document.join.email.options[document.join.email.selectedIndex].value;

  }

 }

</script>
<body width="100%" height="100%">
<form class="sign" name="join">
   <table width="940">
   		<h2>회원가입</h2>
      <tr height="2" bgcolor="#000000"><td colspan="2"></td></tr>
      <tr>
         <th>아이디</th>
         <td class="td1"><input type="text" name="id"></td>
      </tr>
      <tr>
         <th>비밀번호</th>
         <td class="td1"><input type="text" name="pwd"> 영문/숫자포함 6자 이상 </td>
       </tr>
       <tr>
         <th>이   름</th>
         <td class="td1">
         <input type="text" name="cursor:pointer">
         </td>
       </tr>
       <tr>
       	<th>생년월일</th>
       	<td class="td1">
       	<select name="birth1">
	       <%for(int i=2013; i>=1900; i--){ %>
	       <option value="<%=i %>"><%=i %></option>
	       <%} %>
	     </select>년&nbsp;
	     <select name="birth2">
	       <%for(int i=1; i<=12; i++){ %>
	       <option value="<%=i %>"><%=i %></option>
	       <%} %>
	     </select>
	     <select name="birth3">
	       <%for(int i=1; i<=31; i++){ %>
	       <option value="<%=i %>"><%=i %></option>
	       <%} %>
     	</select>일
       	</td>
       </tr>
 	   <tr>
          <th>이메일</th>
          <td class="td1">
            <input type="text" name="email1" value="" onfocus="this.value='';">   @
			<input type="text" name="email2" value="" disabled >
   				<select name="email" onchange="email_change()">
				    <option value="0" >선택하세요</option>
				    <option value="9">직접입력</option>
				    <option value="naver.com">naver.com</option>
				    <option value="nate.com">nate.com</option> 
				    <option value="daum.net">daum.net</option> 
				    <option value="gmail.com">gmail.com</option> 	
				</select>
            </td>
         </tr>
        <tr>
           <th>주   소</th>
           <td class="td1">
			<input type="text" id="sample4_postcode" placeholder="우편번호">
			<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
			<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
			<span id="guide" style="color:#999;display:none"></span>
			<input type="text" id="sample4_detailAddress" placeholder="상세주소">
			<input type="text" id="sample4_extraAddress" placeholder="참고항목">
           </td>
         </tr>
        <tr>
          <th>핸드폰 번호</th>
           	<td class="td1">
           	<select name="tel">
    		 <option value="" disabled selected>---</option>
   			 <option value="010">010</option>
    		 <option value="011">011</option>
    		 <option value="016">016</option>
    		 <option value="017">017</option>
    		 <option value="018">018</option>
    		 <option value="019">019</option>
			</select> -
               <input type="text" name="tel_h2_1" class="JJ"> -
               <input type="text" name="tel_h2_2" class="JJ">
           </td>
          </tr>
       <tr>
         <th>성별</th>
           <td class="td1">
               <input type="radio" name="gender" value="남자"> 남자
               <input type="radio" name="gender" value="여자"> 여자
            </td>
       </tr>
 
         <tr height="2" bgcolor="#000000"><td colspan="2"></td></tr>
           <tr>
             <td colspan="2" align="center">
               <input type="submit" value="회원가입">
               <input type="reset" value="취소">
            </td>
           </tr>
           </table>
          </td>
     </tr>
</form>
    <!-- Optional JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/3eee069757.js"></script>
 </body>
</html>
 <jsp:include page="common/footer.jsp" />