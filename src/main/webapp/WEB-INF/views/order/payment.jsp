<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
var IMP = window.IMP; // 생략가능
IMP.init('imp94061782');

IMP.request_pay({
    pg : 'html5_inicis', // version 1.1.0부터 지원.
    pay_method : 'card', 
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:결제테스트', // 주문명 - 주문번호
    amount : ${param.ordersTotal},
    buyer_email : '${param.email}',
    buyer_name : '${param.name}',
    buyer_tel : '${param.tel}',
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        alert(msg);
      	location.href="/easycook/order/paymentComplete?check=" + ${orders.check} + "&discountCoupon=" + ${orders.discountCoupon}
      		+ "&couponNo=" + ${orders.couponNo} + "&discountPoint=" +  ${orders.discountPoint} + "&ordersTotal=" + ${orders.ordersTotal};

        // 최종금액(finalTotal), 쿠폰썼는지 확인후 ucoupon 상태 1로 전환 및 쿠폰 디스카운트, 
     	// 장바구니 삭제
     	// orders, ordersDetail 추가 
     	// 최종금액(finalTotal) / 1% 적립금 +, 쓴적립금 확인후 제거

    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        alert(msg);
        location.href="/easycook/";
    }
    
    
});
</script>
<body>
	total : ${orders.ordersTotal}
</body>
</html>