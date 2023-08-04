<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/include/top.jsp" />

<section>
<br>
<div align="center">
<h2>비누몰 상품 &emsp; </h2>

<!-- 가로로 3개씩 나누기 위해 각 상품을 div로 묶음 -->
<c:forEach items="${li}"  var="m" varStatus="status">
  <c:if test="${status.index % 3 == 0}">
    <div style="display: flex; justify-content: space-around; margin-bottom: 20px;">
  </c:if>
  
  <div class="product-container">
    <div class="product-id">제품코드: ${m.productId}</div>
    <a href="productOne.do?productId=${m.productId}">
      <img src="${path}/product/files/${m.productImgStr}" width="150" height="150" alt="${m.productName}">
    </a>
    <div class="product-name">${m.productName}</div>
    <div>
      <fmt:formatNumber value="${m.productPrice}" pattern="#,###"/> 원
    </div>

  </div>

  <c:if test="${status.index % 3 == 2 || status.index == fn:length(li) - 1}">
</div>
  </c:if>
</c:forEach>

</div>
<br>
</section>

<c:import url="/include/bottom.jsp" />
