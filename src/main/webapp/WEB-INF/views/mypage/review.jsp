<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

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
        <h2>리뷰작성</h2>
        <hr>
        <br><br><br>	
        <div id="content-detail">
	    <form method="post" class="sign" name="reviewForm" action="review" enctype="multipart/form-data">
			<table width="720">
			<tr>
				<th>상품번호</th>
				<td class="td1">
					<input type="hidden" name="productNo" value="${productNo}">${productNo}
					<input type="hidden" name="ordersNo" value="${ordersNo}">
				</td>
			</tr>
			<tr>
				<th>내 용</th>
				<td class="td1"><textarea name="reviewContent" rows="13" cols="40"> </textarea></td>
			</tr>
			<tr>
				<th>Score</th>
				<td class="td1">
					<input type="radio" name="reviewScore" value="1"> ★☆☆☆☆ &nbsp;
					<input type="radio" name="reviewScore" value="2"> ★★☆☆☆ &nbsp;
					<input type="radio" name="reviewScore" value="3"> ★★★☆☆ &nbsp;
					<input type="radio" name="reviewScore" value="4"> ★★★★☆ &nbsp;
					<input type="radio" name="reviewScore" value="5"> ★★★★★
				</td>
			</tr>
			<tr>
				<th>사진첨부</th>
				<td class="td1"><input type="file" size="40" maxlength="30" name="file"></td>
			</tr>
			<tr height="2" bgcolor="#000000">
				<td colspan="2"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="작성하기" onclick="submit()"> 
					<input type="button" value="뒤로가기" onclick="javascript:history.back()">
				</td>
			</tr>
			</table>
		</form>
       </div>
	</div>
   </div>
      
      <div id="jb-footer">
        <br>
      </div>
<script src="/easycook/resources/js/login.js"></script>
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
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />