<jsp:include page="common/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
        border: 1px solid #bcbcbc;
      }
    </style>
  </head>
  <body>
    <div id="jb-container">
      <div id="jb-header">
        <h1>헤더가 여기에 들어가겠지</h1>
      </div>
      <div id="jb-content">
        <h2>여기는 본문 내용</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nec mollis nulla. Phasellus lacinia tempus mauris eu laoreet. Proin gravida velit dictum dui consequat malesuada. Aenean et nibh eu purus scelerisque aliquet nec non justo. Aliquam vitae aliquet ipsum. Etiam condimentum varius purus ut ultricies. Mauris id odio pretium, sollicitudin sapien eget, adipiscing risus.</p>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nec mollis nulla. Phasellus lacinia tempus mauris eu laoreet. Proin gravida velit dictum dui consequat malesuada. Aenean et nibh eu purus scelerisque aliquet nec non justo. Aliquam vitae aliquet ipsum. Etiam condimentum varius purus ut ultricies. Mauris id odio pretium, sollicitudin sapien eget, adipiscing risus.</p>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nec mollis nulla. Phasellus lacinia tempus mauris eu laoreet. Proin gravida velit dictum dui consequat malesuada. Aenean et nibh eu purus scelerisque aliquet nec non justo. Aliquam vitae aliquet ipsum. Etiam condimentum varius purus ut ultricies. Mauris id odio pretium, sollicitudin sapien eget, adipiscing risus.</p>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nec mollis nulla. Phasellus lacinia tempus mauris eu laoreet. Proin gravida velit dictum dui consequat malesuada. Aenean et nibh eu purus scelerisque aliquet nec non justo. Aliquam vitae aliquet ipsum. Etiam condimentum varius purus ut ultricies. Mauris id odio pretium, sollicitudin sapien eget, adipiscing risus.</p>
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
        <p>footer가 여기 들어가겠지</p>
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