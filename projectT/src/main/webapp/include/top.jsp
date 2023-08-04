<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:set var="path" value="${pageContext.request.contextPath}" scope="session" />
<c:set var="key" value="a0ce51e7c89af8bc4bd7db6fa847a5c5" scope="session" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비누몰</title>
<link href="${path}/include/top.css" rel="stylesheet" type="text/css" />
</head>
<body>
<header>
  <div class="div1"><h1> 비누나라 </h1></div>
</header>
<nav>
  <a class="rounded-link1" href="${path}/ShopSelectAll.do">회원목록</a>

  <c:if test="${m.id eq 'admin'}">
    
    <a class="rounded-link1" href="${path}/product/productForm.jsp">상품등록</a>
  </c:if>

  <a class="rounded-link1" href="${path}/productList.do">상품목록</a>
  <a class="rounded-link1" href="${path}/index.jsp">홈으로</a>

  <div class="loggedin">
    <c:if test="${empty m.custno}">
      <a class="rounded-link" href="${path}/login/login.jsp">로그인</a>
      <a class="rounded-link" href="${path}/ShopForm.do">회원가입</a>
    </c:if>
  </div>

  <div class="loggedin">
    <c:if test="${!empty m.custno}">
      사용자: ${m.id}
      <a class="rounded-link" href="${path}/logout.do?custno=${m.custno}">로그아웃</a>
      <a class="rounded-link" href="${path}/cartList.do?custNo=${m.custno}">장바구니</a>
      <a class="rounded-link" href="${path}/orderMoney.do?custNo=${m.custno}">주문내역</a>
    </c:if>
  </div>
</nav>
</body>
</html>