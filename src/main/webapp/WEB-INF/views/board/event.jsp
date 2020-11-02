<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	table{
	font-family: "Open Sans", sans-serif;
}
</style>
<body class="goto-here">
<section class="ftco-section">
<jsp:include page="/WEB-INF/views/common/boardSidebar.jsp" />
	<div class="container" style="padding-left:70px;">
		<h1>이벤트</h1>
		<hr style="border-color:#1abc9c">
		<table class="event">
		
		<c:forEach var="event" items="${event}"> 
			<tr>
				<td style="padding-top: 0px;padding-bottom: 20px;">
				<a href="<%=request.getContextPath() %>/event/${event.eventNo}">
				<img src="<%=request.getContextPath() %>/resources/upload/${event.eventImage}" width="250" height="250"></a></td>
				<td style="padding-left: 40px; padding-bottom: 50px;">
					<h2>
						이벤트명 : <small>${event.eventTitle }</small>
					</h2>
					<h2>
						이벤트 내용 : <small>${event.eventContent }</small>
					</h2>
					<h2>이벤트 기간 :<small><fmt:formatDate value="${event.eventStartdate }" pattern="yyyy-MM-dd"/> ~ 
						<fmt:formatDate value="${event.eventEnddate }" pattern="yyyy-MM-dd"/></small>
					</h2>
			</tr>
			
		</c:forEach>
		</table>
		<hr style="border-color:#1abc9c">
	</div>
	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
