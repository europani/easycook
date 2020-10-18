<jsp:include page="common/header.jsp" />
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
        padding: 50px 10px 10px 10px;
        /* border: 1px solid #bcbcbc; */
      }
      #jb-header {
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #bcbcbc;
      }
      #jb-content {
        width: 80%;
        padding: 20px;
        margin-bottom: 20px;
        float: right;
        border: 1px solid #bcbcbc;
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
      	width: 700px;
      	padding: 30px 20px 30px;
        float: left;
      }
      button {
	    margin: 0;
	    padding: 0;
	    border: 0;
	    font: inherit;
	    background: none;
	    box-sizing: inherit;
	    -webkit-box-sizing: inherit;
	    cursor: pointer;
	    outline-style: none;
	}
      .btn-search {	/* 나중에 추가할 버튼양식 */
	    display: inline-block;
	    margin-left: 30px;
	    width: 103px;
	    height: 33px;
	    line-height: 33px;
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
	 
    </style>
  </head>
  <body>
    <div id="jb-container">
      <div id="jb-content">
        <h2>주문내역</h2>
        <hr>
        <br>
        <div id="content-detail" style="background-color: #F8F8F8">
        <label for="UserCheckIN">조회기간 </label>&nbsp;&nbsp;&nbsp;
		<input type="date" id="UserCheckIn" name="UserCheckIn"
						min="2020-10-01" max="2020-12-31" name="date"
						contenteditable="false">&nbsp;&nbsp;~&nbsp;&nbsp;
		<label for="UserCheckOut"></label> 
		<input type="date" id="UserCheckOut" name="UserCheckOut" 
						min="2020-08-01" max="2020-12-31" name="date"
						 contenteditable="false">&nbsp;&nbsp;
					<button type="button" class="btn-search">조회하기</button>
		</div>
		<br><br><br><br>
      	<hr>
      	주문목록/배송조회 내역 총 0건<br><br>
        <div id="content-detail2">
      	<table>
		  <tr>
		    <th>날짜/주문번호</th>
		    <th>상품명/옵션</th>
		 	<th>상품금액/수량</th>
		 	<th>주문상태</th>
		  </tr>
		  <tr>
		    <td>20201017</td>
		    <td>임시상품명</td>
		    <td>$임시금액</td>
		    <td>임시주문상태</td>
		  </tr>
		</table>
        </div>     	
      </div>
     
      
      <div id="jb-sidebar">
      <!-- Sidebar/menu -->

  
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


</div>
      <div id="jb-footer">
        <br/>
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
  
  
 <jsp:include page="common/footer.jsp" /> 