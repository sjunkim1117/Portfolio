<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/include/top.jsp" />
<script>
function delK(k){
	location.href="cartDelete.do?cartId="+k+"&custNo="+${m.custno};
}

function delK2(){
	location.href="cartDeleteAll.do?custNo="+${m.custno};
}
</script>

<section>
<br>
<div align=center>
<h2>장바구니 &emsp; </h2>
<form method="post" name="f1" >
 <table border=1  width=800>
 <tr align="center">
      <th> 장바구니ID </th> 
      <th> 상품이름   </th> <th> 상품가격  </th>
      <th> 구매수량   </th> <th> 상품이미지 </th>
      <th> 주문취소  </th>
 </tr>

<c:forEach items="${li}"  var="c" >
<input type=hidden name=cartId value="${c.cartId}"/>
<input type=hidden name=custNo value="${m.custno}"/>
<input type=hidden name=productId value="${c.productId}"/>
<input type=hidden name=productname value="${c.productName}"/>

 <tr> 
      <td align=left>${c.cartId}</td>
      <td align=center>${c.productName}</td>
      <td align=center>
      <fmt:formatNumber value="${c.productPrice}" pattern="#,###" />원</td>
      <td align=center ><input type=number name=amount value="${c.amount}" style=width:30px;></td>
      <td align=center><img src="${path}/product/files/${c.productImgStr}" width=50 height=50></td>
      <td align=center><input type=button value="삭제" onClick="delK('${c.cartId}')"></td>
      <c:set var="total" value="${total + (c.productPrice * c.amount)}" />   
 </tr>
</c:forEach>
 
<tr>
	<td colspan=6 align="left"> 
	<c:if test="${total >= 20000}">
 구매금액 : 
 <fmt:formatNumber value="${total-deli}" pattern="#,###"/> <br/>
 배송비 : 0 <c:set var="deli" value="0" /> <br/>
 장바구니 금액합계 : 
 <fmt:formatNumber value="${total}" pattern="#,###"/> 
 </c:if>
 <c:if test="${total-deli < 20000}">
 구매금액 :  
 <fmt:formatNumber value="${total-deli}" pattern="#,###"/> <br/>
 배송비 : 3000원 (20000원 이상부터 배송비 무료) <c:set var="deli" value="3000" /> <br/>
 장바구니 금액합계 : 
 <fmt:formatNumber value="${total+3000}" pattern="#,###"/> 
  </c:if>
	 </td>
</tr>
<tr>
	<td colspan=6 align="center">
		<input type=hidden name=deli value="${deli}"> 
		<input type=hidden name=totalprice value="${total}"> 
		<input type=submit value="주문하기" onClick="javaScript:action='${path}/cartOrder.do'">
		<input type=submit value="수정하기" onClick="javaScript:action='${path}/cartUpdate.do'">
		<input type=button value="전체삭제" onClick="delK2()">
	</td>
</tr>
</table>
</form>
</div>
<br>

</section>




<c:import url="/include/bottom.jsp" />