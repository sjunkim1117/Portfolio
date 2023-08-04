<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/include/top.jsp" />
<section>
 <br>
 <div align="center">
 <h2> 회원목록페이지 </h2>
 
 <table border=1>
  <tr align="center"> 
	 <td>회원번호</td> <td>회원이름</td> <td>전화번호</td>
	 <td>주소</td>    <td>가입날짜</td> 
  </tr>    
 
 
 <c:forEach items="${li}"  var="m" >
 <tr> 
	 <td align="center">${m.custno} </td>
	 <td align="center">
	  <a href=${path}/ShopEdit.do?custno=${m.custno}>
	    ${m.custname}
	  </a>
	 
	 </td>
	 <td>${m.phone}</td>
	 <td>${m.address}</td>
	 <td>
	 
	   <fmt:parseDate  value="${m.joindate}" var="registered" pattern="yyyy-MM-dd" />
       <fmt:formatDate value="${registered}" pattern="yyyy년MM월dd일" />
	 </td>
  </tr> 
 
 
 </c:forEach>
 </table>
 
 <form action=${path}/ShopSelectAll.do>
 <select name=ch1 >
   <option value='custname'> 이 름 </option>
   <option value='phone'> 전화번호 </option>
   <option value='address'> 주 소 </option>   
 </select>
 <input type=text  name=ch2>
 <input type="submit" value="검색하기"> 
 </form>
  
 </div>
 <br>
</section>
<c:import url="/include/bottom.jsp" />