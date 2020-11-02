<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
   margin: 0;
   padding: 0;
}

.accordion {
   position: absolute;
   left: 50%;
   transform: translateX(-50%);
   width: 1000px;
}

input[id*="answer"] {
   display: none;
}

input[id*="answer"]+label {
   display: block;
   padding: 20px;
   border-bottom: 0;
   color: #fff;
   font-weight: 900;
   background: #1abc9c;
   cursor: pointer;
   position: relative;
}

input[id*="answer"]+label em {
   position: absolute;
   top: 50%;
   right: 10px;
   width: 30px;
   height: 30px;
   margin-top: -15px;
   display: inline-block;
   background: url('/easycook/resources/images/arrow.png') 0 0 no-repeat;
}

input[id*="answer"]+label+div {
   max-height: 0;
   transition: all .35s;
   overflow: hidden;
   background: #fff;
   font-size: 13px;
}

input[id*="answer"]+label+div p {
   display: inline-block;
   padding: 20px;
}

input[id*="answer"]:checked+label+div {
   max-height: 100px;
}

input[id*="answer"]:checked+label em {
   background-position: 0 -30px;
}
label{
   font-size:15px;
}
</style>
</head>
<body class="goto-here">
   <section class="ftco-section">
      <jsp:include page="/WEB-INF/views/common/boardSidebar.jsp" />

      <div class="container" style="height: 800px;">
         <h1>FAQ</h1>
         <hr style="border-color: #1abc9c">
         <div class="wrapper">
            <div class="accordion">
            
               <input type="radio" name="accordion" id="answer01"> 
               <label for="answer01">∎ 주문 취소는 어떻게 하나요?<em></em></label>
               <div>
                  <p>모든 주문은 결제완료 단계에서 '마이페이지'에서 직접 취소가 가능합니다. 
                       상품준비중 상태로 변경되면 고객센터에 안내되어 있는 전화번호로 연락을 주시거나 
                       <br>'고객센터>1:1문의하기'에 취소관련 내용을 남겨주시면 확인 후 취소처리 해 드립니다.
                  </p>
               </div>
               
               
               <input type="radio" name="accordion" id="answer02"> <label
                  for="answer02">∎ 결제 수단으로 무엇이있나요?<em></em></label>
               <div>
                  <p>easyCook에서는 신용카드와 실시간 계좌이체, 무통장입금, 카카오페이, 
                             네이버페이를 통해 결제하실 수 있으며 포인트와 쿠폰을 결제시 함께 사용하실 수 있습니다.
                       </p>
               </div>
               
               <input type="radio" name="accordion" id="answer03"> 
               <label for="answer03">∎ 주문 한 상품이 품절인 경우 어떻게 하나요?<em></em></label>
               <div>
                  <p>주문해 주신 상품이 품절인 경우 - 주문 시 대체상품 배송을 희망하셨을 경우 유선연락 후 
                       유사상품을 배송 해 드리며, 그렇지 않은 경우는 결제수단 취소 및 포인트로 환불처리 해 드립니다.
                       </p>
               </div>
               
               <input type="radio" name="accordion" id="answer04"> 
               <label for="answer04">∎ 고기는 좋은 것을 사용하나요?<em></em></label>
               <div>
                  <p>소고기는 한우 1+ 등급이상, 돼지고기, 닭고기, 오리고기는 모두 국내산을 사용합니다.
                     수입산은 아무래도 긴 유통시간과 유통과정에서의 신선도 유지를 위한 약품 처리 등으로
                     인해 고기에 대한 신뢰성에 의문이 갈 수 밖에 없습니다.
                  </p>
               </div>
            </div>
         </div>
      </div>
   </section>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />