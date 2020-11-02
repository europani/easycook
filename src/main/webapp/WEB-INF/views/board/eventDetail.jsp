<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#notice{
		
    margin-left: 185px;
    margin-right: 130px;
    margin-top: 40px;
	}
	#a{
	font-size: 20px;
    width: 50%;
    margin-left: auto;
    margin-right: auto;
	}
	#click{
	text-align: center;	
	}
</style>
</head>
<body class="goto-here">
<section class="ftco-section">
<jsp:include page="/WEB-INF/views/common/boardSidebar.jsp" />
<div class="container" id="notice" style="width:2000px;height:500px;overflow:scroll;" >
   <table id="a" class="table table-striped">
      <tr>
         <td colspan="2" style="background-color:#1abc9c; color:#fff">${detail.eventTitle }</td>
      </tr>
      <tr>
         <td><fmt:formatDate value="${detail.eventStartdate }" pattern="yyyy-MM-dd"/> ~ 
         <fmt:formatDate pattern="yyyy-MM-dd" value="${detail.eventEnddate}"/> </td>
      </tr>
      <tr>
         <td colspan="2">${detail.eventContent}</td>
      </tr>
      <c:if test="${detail.eventImage != null}">
      <tr>
         <td colspan="2"><img src="<%=request.getContextPath() %>/resources/upload/${detail.eventImage }" width="500" height="500"></td>
      </tr>
      </c:if>
      <c:if test="${detail.couponNo != 0}">
      <tr>
         <td colspan="2">
         	<button class="btn btn-primary py-3 px-5" onclick="giveCoupon()">쿠폰발급받기</button>
         </td>
      </tr>
      </c:if>
      
   </table>
</div>
</section>
   <div id="click">
   	<a href="<%=request.getContextPath() %>/board/event"  class="btn btn-default">목록</a>
   </div>
   
   <script>
    function giveCoupon() {
    	var result = -1;
		let xhttp = new XMLHttpRequest();
		xhttp.open("GET", "/easycook/event/coupon?couponNo=" + ${detail.couponNo});
		xhttp.send();
		xhttp.onreadystatechange = function () {
			if (this.readyState == 4 && this.status == 200) {
				result = this.responseText;
				if (result == 1) {
					alert('쿠폰이 발급되었습니다.');
				} else {
					alert('이미 발급된 쿠폰입니다.');
				}
			}
		};
    	
    
    }
   
   
   </script>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

