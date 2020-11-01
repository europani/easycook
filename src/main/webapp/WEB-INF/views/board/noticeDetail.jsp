<jsp:include page="/WEB-INF/views/common/header.jsp" /> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
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
	<div class="container" id="notice" style="height:800px; padding-left:70px;">
	
	<table id="a" class="table table-striped">
	<tr>
		<td colspan="3" style="background-color:#1abc9c; color:white;">${article.noticeTitle }</td>
	</tr>
	
	<tr>
		<td>관리자</td>
		<td><fmt:formatDate value="${article.noticeDate}" pattern="yyyy-MM-dd HH:mm"/></td>
		<td>조회수 ${article.noticeCount}</td>
	</tr>
	<tr>
		<td colspan="3"><p>${article.noticeContent}</p>
	</tr>
	<c:if test="${article.noticeFilename != null}">
	<tr>
		<td colspan="3" style="text-align:center;"> 
		<img src="<%=request.getContextPath() %>/resources/upload/${article.noticeFilename}" 
				style="height:500px;width:500px;"></td>
	</tr>
	</c:if>
	
</table>
<div id="click">
	<a href="<%=request.getContextPath() %>/notice"  class="btn btn-default">목록</a>
</div>
</div>
</section>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />