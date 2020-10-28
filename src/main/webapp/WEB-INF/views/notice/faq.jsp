<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/boardSidebar.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    
    <title>FAQ</title>
    
    <script type="text/javascript" charset="utf-8">
    // answer 항목에 Markdown 문법을 지원 합니다.
    var FAQ = [
      { 
           category: ""
         , question: "<b> ∎ 주문 취소는 어떻게 하나요?</b>"
         , answer: "      모든 주문은 결제완료 단계에서 '마이페이지'에서 직접 취소가 가능합니다. 상품준비중 상태로 변경되면 고객센터에 안내되어 있는 전화번호로 연락을 주시거나 '고객센터>1:1문의하기'에 취소관련 내용을 남겨주시면 확인 후 취소처리 해 드립니다." 
      }, { 
           category: ""
         , question: "<b> ∎ 결제 수단으로 무엇이있나요?</b>"
         , answer: "      easyCook에서는 신용카드와 실시간 계좌이체, 무통장입금, 카카오페이, 네이버페이를 통해 결제하실 수 있으며 포인트와 쿠폰을 결제시 함께 사용하실 수 있습니다." 
      }, { 
           category: ""
         , question: "<b> ∎ 주문 한 상품이 품절인 경우 어떻게 하나요?</b>"
         , answer: "      주문해 주신 상품이 품절인 경우 - 주문 시 대체상품 배송을 희망하셨을 경우 유선연락 후 유사상품을 배송 해 드리며, 그렇지 않은 경우는 결제수단 취소 및 포인트로 환불처리 해 드립니다." 
      },{ 
           category: ""
               , question: "<b> ∎ 주문 한 상품이 품절인 경우 어떻게 하나요?</b>"
               , answer: "      주문해 주신 상품이 품절인 경우 - 주문 시 대체상품 배송을 희망하셨을 경우 유선연락 후 유사상품을 배송 해 드리며, 그렇지 않은 경우는 결제수단 취소 및 포인트로 환불처리 해 드립니다." 
            }
    ]
    </script>

   <link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/marked/0.3.2/marked.js"></script>
    
</head>
<style>
    .faqHeader {
        font-size: 27px;
        margin: 20px;
    }

    .panel-heading [data-toggle="collapse"]:after {
        font-family: 'Glyphicons Halflings';
        content: "\e072"; /* "play" icon */
        float: right;
        color: #F58723;
        font-size: 18px;
        line-height: 22px;
        /* rotate "play" icon from > (right arrow) to down arrow */
        -webkit-transform: rotate(-90deg);
        -moz-transform: rotate(-90deg);
        -ms-transform: rotate(-90deg);
        -o-transform: rotate(-90deg);
        transform: rotate(-90deg);
    }

    .panel-heading [data-toggle="collapse"].collapsed:after {
        /* rotate "play" icon from > (right arrow) to ^ (up arrow) */
        -webkit-transform: rotate(90deg);
        -moz-transform: rotate(90deg);
        -ms-transform: rotate(90deg);
        -o-transform: rotate(90deg);
        transform: rotate(90deg);
        color: #454444;
    }
    
    .panel-body table {
      margin:15px 0;
      border:0;
    }
    .panel-body th {
      margin:15px 0;
      font-weight:bold;
      background-color:#dddddd;
      color:#cccccc
      border: 1px solid #cccccc;
      border-width:1px
    }
    
   .panel-body th,.panel-body td {
      font-size:0.95em;
      text-align:center;
      padding:4px;
      border-collapse:collapse;
   }
   .panel-body td {
      border: 1px solid #cccccc;
      border-width:1px
   }
   .panel-body tr {
      border: 1px solid #ffffff;
   }
    
</style>
<body>
<div class="container">


<!-- FAQ - START -->
<div class="container">
    <br />
    <br />
    <br />
    <div class="panel-group" id="accordion">
    </div>
</div>


<!-- FAQ - END -->

</div>

<script type="text/javascript" charset="utf-8">

   function createHtmlFAQ(q, a, id)
   {
      return (
          "<div class=\"panel panel-default\">" +
          "    <div class=\"panel-heading\">" +
          "        <h4 class=\"panel-title\">" +
          "            <a class=\"accordion-toggle\" data-toggle=\"collapse\" data-parent=\"#accordion\" href=\"#collapse"+id+"\">"+q+"</a>" +
          "        </h4>" +
          "    </div>" +
          "    <div id=\"collapse"+id+"\" class=\"panel-collapse collapse\">" +
          "        <div class=\"panel-body\">" +
          "            " + marked(a) +
          "        </div>" +
          "    </div>" +
          "</div>\n");
   }

   $(document).ready(function(){
      var cArray = [];
      for(i in FAQ)
      {
         var cItem = {};
         var indexCategory = -1;
         for(j in cArray)
         {
            if (cArray[j].text == FAQ[i].category) {
               indexCategory = j;
               break;
            }
         }
         
         if (indexCategory == -1) {
            cItem.text = FAQ[i].category;
            cItem.html = createHtmlFAQ(FAQ[i].question, FAQ[i].answer, i);
            cArray.push(cItem);
         } else {
            cArray[indexCategory].html += createHtmlFAQ(FAQ[i].question, FAQ[i].answer, i);
         }
      }
      
      var html = "";
      
      for(i in cArray)
      {
         html += "<div class=\"faqHeader\">"+cArray[i].text+"</div>\n" + cArray[i].html + "<br />"
      }
      
      $("#accordion").html($(html));
      $(".accordion-toggle:first").click();
   });
</script>

</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />