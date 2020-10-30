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
         <td colspan="3" style="background-color:#1abc9c; color:#fff">${detail.eventTitle }</td>
      </tr>
      <tr>
         <td colspan="3"><img src="/easycook/resources/mart/images/test.jpg"><!-- ${detail.eventImage }</td> -->
      </tr>
      <tr>
         <td colspan="3">${detail.eventContent }</td>
      </tr>
      <tr>
         <td><fmt:formatDate value="${detail.eventStartdate }" pattern="yyyy-MM-dd HH:mm"/> ~ 
         <td><fmt:formatDate pattern="yyyy-MM-dd" value="${event.eventEnddate}"/></td>
      </tr>
      
   </table>
</div>
</section>
   <div id="click">
   	<a href="<%=request.getContextPath() %>/board/event"  class="btn btn-default">목록</a>
   </div>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

