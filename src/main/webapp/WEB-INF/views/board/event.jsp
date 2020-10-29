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
<body> 
	<section class="ftco-section">
	<jsp:include page="/WEB-INF/views/common/boardSidebar.jsp" />
	<div class="container" style="padding-left:70px; height:800px;">
		<h2>이벤트</h2>
		<table class="event">
		
		<c:forEach var="event" items="${event}"> 
			<tr>
				<td style="padding-top: 0px;padding-bottom: 20px;">
				<a href="<%=request.getContextPath() %>/board/econtent/${event.eventNo}">
				<img src="/aa/mart/images/event.png"></a></td><!-- ${event.eventImage} -->
				<td style="padding-left: 40px; padding-bottom: 50px;">
					<h3>
						이벤트명 : <small>${event.eventTitle }</small>
					</h3>
					<h3>
						이벤트 내용 : <small>${event.eventContent }</small>
					</h3>
					<h3>이벤트 기간 :<small><fmt:formatDate value="${event.eventStartdate }" pattern="yyyy-MM-dd"/> ~ 
						<fmt:formatDate value="${event.eventEnddate }" pattern="yyyy-MM-dd"/></small>
					</h3>
			</tr>
			
		</c:forEach>
		</table>
		<br><br><br>
	
	</div>
	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
