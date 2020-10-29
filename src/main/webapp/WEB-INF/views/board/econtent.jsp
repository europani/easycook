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
<body>
<jsp:include page="/WEB-INF/views/common/boardSidebar.jsp" />
<section>
<div class="container" id="notice" style="height:800px;">
   <table id="a" class="table table-striped">
      <tr>
         <td colspan="3" style="background-color:red; color:#fff">${detail.eventTitle }</td>
      </tr>
      <tr>
         <td colspan="3"><img src="/easycook/resources/images/test.png"><!-- ${detail.eventImage }</td> -->
      </tr>
      <tr>
         <td colspan="3">${detail.eventContent }</td>
      </tr>
      <tr>
         <td><fmt:formatDate value="${detail.eventStartdate }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${event.eventEnddate }" pattern="yyyy-MM-dd"/></td>
      </tr>
      
   </table>
   <div id="click">
   	<a href="<%=request.getContentLength() %>/board/event" class="btn btn-default">목록</a>
   </div>
</div>
</section>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

