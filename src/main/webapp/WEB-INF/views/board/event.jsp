<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	table{
	font-family: "Open Sans", sans-serif;
}
</style>
<body>
	<section class="ftco-section">
	<jsp:include page="/WEB-INF/views/common/boardSidebar.jsp" />
	<div class="container" style="padding-left:70px;">
		<h2>이벤트</h2>
		<table class="event">
			<tr>
				<td><img src="/aa/mart/images/event.png"></td>
				<td style="padding-left: 40px;"><h3>
						이벤트명 : <small>[스릴러하우스]</small>
					</h3>
					<h3>
						이벤트 내용 : <small>스릴러 하우스 세트 출신 이벤트</small>
					</h3>
					<h5>이벤트 기간 : 2020.09.28 ~ 2020.10.31</h5></td>
			</tr>
		</table>
		<br><br><br>
		<table class="event">
			<tr>
				<td><img src="/aa/mart/images/event2.png"></td>
				<td style="padding-left: 40px;"><h3>
						이벤트명 : <small>[스릴러하우스]</small>
					</h3>
					<h3>
						이벤트 내용 : <small>스릴러 하우스 세트 출신 이벤트</small>
					</h3>
					<h5>이벤트 기간 : 2020.09.28 ~ 2020.10.31</h5></td>
			</tr>
		</table>
	</div>
	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
