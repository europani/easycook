<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>CSS</title>
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
      
    </style>
  </head>
  <body>
    <div id="jb-container">
      <div id="jb-content">
        <h2>회원탈퇴</h2>
        <hr>
        <br><br>
        <h3 align="left">이지쿡 탈퇴 안내</h3>
        <br>	
        <div id="content-detail">
	      ■ 회원 탈퇴시의 아래 사항을 숙지하시기 바랍니다.
	      <br><br>
		  1. 회원 탈퇴 시 회원님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한
		  <br>	
	      고객정보 보호정책에따라 관리 됩니다.
	      <br>
	      2. 탈퇴 시 회원님께서 보유하셨던 마일리지는 삭제 됩니다.	 
	      <br>
	      3. 탈퇴한 ID와 동일한 ID로 재가입 할 수 없습니다.     
       </div>
       <div id="content-detail2">
	      <br>
	      <h4>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 재인증 해주세요</h4>
	      <br>
		  <h4>
		  	<form method="post" action="delete">
		  		<input type="hidden" name="id" value="${member.id}">
			  	<input type="password" name="pwd" >&nbsp;&nbsp;
			  	<button type="button" class="btn-search" onclick="submit()">탈퇴하기</button>
		  	</form>
		  </h4>
		  <br>		           
       </div>
		</div>
		<br><br><br><br> 	
      </div>
     
      
<!--       <div id="jb-sidebar">
      Sidebar/menu

  
  <div class="w3-padding-64 w3-large w3-text-grey" style="font-weight:bold">
    <a onclick="myAccFunc('info')" href="javascript:void()" class="w3-button w3-block w3-white w3-left-align" id="myBtn">
      나의 정보 <i class="fa fa-caret-down"></i>
    </a>
    <div id="info" class="w3-bar-block w3-hide w3-padding-large w3-medium">
      <a href="#" class="w3-bar-item w3-button">내정보수정</a>
      <a href="#" class="w3-bar-item w3-button">회원탈퇴</a>
    </div>
    <a onclick="myAccFunc('shop')" href="javascript:void()" class="w3-button w3-block w3-white w3-left-align" id="myBtn">
      나의 쇼핑 <i class="fa fa-caret-down"></i>
    </a>
    <div id="shop" class="w3-bar-block w3-hide w3-padding-large w3-medium">
      <a href="#" class="w3-bar-item w3-button">주문내역</a>
      <a href="#" class="w3-bar-item w3-button">장바구니</a>
      <a href="#" class="w3-bar-item w3-button">위시리스트</a>
      <a href="#" class="w3-bar-item w3-button">취소/반품</a>
    </div>
    <a onclick="myAccFunc('etc')" href="javascript:void()" class="w3-button w3-block w3-white w3-left-align" id="myBtn">
      기타 내용 <i class="fa fa-caret-down"></i>
    </a>
    <div id="etc" class="w3-bar-block w3-hide w3-padding-large w3-medium">
      <a href="#" class="w3-bar-item w3-button">무엇을</a>
      <a href="#" class="w3-bar-item w3-button">넣을까요</a>
    </div>
    <a href="#" class="w3-bar-item w3-button"></a>
  </div>
  <a href="#footer" class="w3-bar-item w3-button w3-padding">Contact</a> 
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding" onclick="document.getElementById('newsletter').style.display='block'">Newsletter</a> 


</div> -->
      <div id="jb-footer">
        <br>
      </div>
    </div>
  </body>

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
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />