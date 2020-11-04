<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
  <body class="goto-here">
    <section class="ftco-section">
    	<div class="container"> 
    	<h2>전체  [ 상품 : <c:if test="${list.size() == null}">0</c:if>${list.size()}개 ]</h2>
           <hr>
           <br>
           <c:if test="${sort == null || sort =='popular' || sort =='ASC' || sort =='DESC'}">
    		<div class="row justify-content-center">
    			<div class="col-md-10 mb-5 text-center">
    				<ul class="product-category">
    					<li><a href="/easycook/product" ${sort == null? 'class="active"' : ''}><b>ALL</b></a></li>
    					<li><a href="/easycook/product?sort=popular" ${sort == 'popular'? 'class="active"' : ''}><b>판매 인기순</b></a></li>
    					<li><a href="/easycook/product?sort=ASC" ${sort == 'ASC'? 'class="active"' : ''}><b>낮은 가격순</b></a></li>
    					<li><a href="/easycook/product?sort=DESC" ${sort == 'DESC'? 'class="active"' : ''}><b>높은 가격순</b></a></li>
    				</ul>
    			</div>
    		</div>
    		</c:if>
    			<c:if test="${list.size() == null && isSearch == 1}">
    				<div style="font-size: 15px; text-align: center;">검색된 상품이 없습니다.</div>
    			</c:if>
    			<c:forEach var="row" items="${list}">
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="product">
    					<a href="/easycook/product/${row.productNo}" class="img-prod"><img class="img-fluid" src="<%=request.getContextPath() %>/resources/product/${row.productImage}">
    						<c:if test="${row.productNo eq todayProNo}">
    						<span class="status">TODAY</span>
    						</c:if>
    						<div class="overlay"></div>
    					</a>
    					<div class="text py-3 pb-4 px-3 text-center">
    						<h3><a href="#">${row.productName}</a></h3>
    						<div class="d-flex">
    							<div class="pricing">
		    						<p class="price">
		    							<c:if test="${row.productNo eq todayProNo}">
		    							<span class="price-dc"><fmt:formatNumber value="${row.productPrice}" pattern="###,###,###"/>원</span>
		    							<span><fmt:formatNumber value="${row.productPrice / 2}" pattern="###,###,###"/>원</span>
		    							</c:if>
		    							<c:if test="${row.productNo ne todayProNo}">
		    							<span><fmt:formatNumber value="${row.productPrice}" pattern="###,###,###"/>원</span>
		    							</c:if>
		    						</p>
		    					</div>
	    					</div>
	    					
    						<div class="bottom-area d-flex px-3">
	    						<div class="m-auto d-flex">
	    							<!-- 제품 상세보기 -->
	    							<a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
	    								<span><i class="ion-ios-menu"></i></span>
	    							</a>
	    							<!-- 장바구니 담기 --> 
	    							<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
	    								<span><i class="ion-ios-cart"></i></span>
	    							</a>
	    							<!-- 찜하기 -->
	    							<a href="javascript:window.open(
	    							'/easycook/mypage/wishlistAddRequire/${row.productName}/${row.productNo}', '_blank','width=400,height=150,top=100,left=500' )"
	    							class="heart d-flex justify-content-center align-items-center ">
	    								<span><i class="ion-ios-heart"></i></span>
	    							</a>
    							</div>
    						</div>
    					</div>
    				</div>
    			</div>
    			</c:forEach>
    		</div>
    </section>
  </body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />