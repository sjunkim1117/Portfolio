<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/include/top.jsp" />

<section>
<br>
<div align=center>
<h2>${m.id} 님의  주문내역 &emsp; </h2>
<table border=1  width=200>
 <tr align="center">
      <th> 주문번호 </th>
      <th> 금액 </th>  
 </tr>
<c:forEach items="${ol}"  var="o" >
 <tr> 
      <td align=center><a href="orderList.do?custno=${m.custno}&idx=${o.idx}">${o.idx}</a></td>
      <td align=center>${o.totalprice}</td>  
 </tr>
</c:forEach>
</table>
 

</div>
<br>

</section>




<c:import url="/include/bottom.jsp" />