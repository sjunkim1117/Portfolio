<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  


<c:import url="/include/top.jsp" />
<section>
 <br>
 <div align="center">
 	    <c:if test="${empty m.custno}">
 		  <br><br><br><br><h2>로그인 후 이용하시길 바랍니다</h2>
 		</c:if>
 		<c:if test="${!empty m.custno}">
 		  <br><br><br><br><h2>어서오세요! ${m.id} 님!</h2>
 		</c:if>
 
 </div>
 <br>
</section>
<c:import url="/include/bottom.jsp" />