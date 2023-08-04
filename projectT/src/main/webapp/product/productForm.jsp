<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/include/top.jsp" />

<section>
<br>
<div align=center>
<h2>쇼핑몰 상품등록 하기</h2>
<form name=f1 action=${path}/productFormOK.do method="post"
 onSubmit="return ch1()"   enctype="multipart/form-data" >
<table border=1 width=650 height=350>
<tr><td align="center">상품이름</td>  
   <td> &emsp;<input type=text name=productName    /> </td></tr> 
<tr><td align="center">상품가격</td>  
   <td>&emsp;<input type=text name=productPrice    /> </td></tr>
<tr><td align="center">상품설명</td>  
   <td>&emsp;<textarea cols=60  rows=9 name=productDesc > </textarea> </td></tr>
<tr><td align="center">사진첨부</td>  
   <td>&emsp;<input type=file name=productImg  /> </td></tr>
<tr><td colspan=2  align="center"> 
    <input  type=submit value="상품등록">&emsp;
    <input  type=button value="다시작성">
   </td></tr>
</table>
</form>
</div>
<br>

</section>




<c:import url="/include/bottom.jsp" />