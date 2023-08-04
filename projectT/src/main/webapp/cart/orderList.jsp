<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 아래 제이쿼리는 1.0이상이면 원하는 버전을 사용하셔도 무방합니다. -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

<script>
function iamport(){
	//가맹점 식별코드
	IMP.init('imp85131862');
	IMP.request_pay({
	    pg : 'kakaopay.TC0ONETIME',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '${li[0].productName} 외' , //결제창에서 보여질 이름
	    amount : '${li[0].totalprice}', //실제 결제되는 가격
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '${li[0].custname}',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '${li[0].address}',
	    buyer_postcode : '123-456'
	}, function(rsp) {
		console.log(rsp);
	    if ( rsp.success ) {
	    	var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	    	 var msg = '결제에 실패하였습니다.';
	         msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
}
</script>
<c:import url="/include/top.jsp" />

<section>
  <br>
  <div class="receipt-container">
    <div class="receipt-header">주문내역</div>
    <table class="receipt-table">
      <c:forEach items="${li}" var="o" begin="0" end="0">
        <c:set var="date" value="${o.regdate}" />
        <tr>
          <th>주문번호</th>
          <td>${o.idx}</td>
          <th>주문날짜</th>
          <td>
            <fmt:formatDate value="${date}" type="date" pattern="yyyy-MM-dd" />
          </td>
        </tr>
        <tr>
          <th>구매자이름</th>
          <td colspan="3">&nbsp; ${o.custname}</td>
        </tr>
        <tr>
          <th>구매자코드</th>
          <td colspan="3">&nbsp;${o.custNo}</td>
        </tr>
        <tr>
          <th>주소</th>
          <td colspan="3">&nbsp;${o.address}</td>
        </tr>
      </c:forEach>
    </table>
    <br>
    <table class="receipt-table">
      <tr>
        <th>상품코드</th>
        <th>제품명</th>
        <th>수량</th>
      </tr>
      <c:forEach items="${li}" var="o">
        <tr>
          <td>${o.productId}</td>
          <td>
            <!-- Move the image to the left of the product name -->
            <div class="receipt-image">
              <img src="${path}/product/files/${o.productImg}" alt="${o.productName}">
            </div>
            <div>${o.productName}</div>
          </td>
          <td>${o.amount}</td>
        </tr>
        <c:set var="total" value="${o.totalprice}" />
        <c:set var="deli" value="${o.deli}" />
      </c:forEach>
      <tr>
        <td colspan="3" class="receipt-total">
          상품금액: <fmt:formatNumber value="${total-deli}" pattern="#,###"/>&nbsp;<br>
          배송비: <fmt:formatNumber value="${deli}" pattern="#,###"/>&nbsp;<br>
          총 결제금액: <fmt:formatNumber value="${total}" pattern="#,###"/>&nbsp;
        </td>
      </tr>
      <!-- Payment button cell -->
      <tr>
        <td colspan="3" class="receipt-button-cell">
          <button class="payment-button" onclick="iamport()">결제하기</button>
        </td>
      </tr>
    </table>
  </div>
  <br>
</section>

<c:import url="/include/bottom.jsp" />
