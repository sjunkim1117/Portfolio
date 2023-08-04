<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/include/top.jsp" />

<script>
    function listK() {
        alert("목록보기");
        location.href = "${path}/productList.do";
    }

    function delK(k) {
        alert("삭제하기" + k);
        location.href = "${path}/productDelete.do?productId=" + k;
    }

    function setRating(rating) {
        document.getElementById("ratingInput").value = rating;
        var stars = document.getElementsByClassName("star");
        for (var i = 0; i < stars.length; i++) {
            if (i < rating) {
                stars[i].innerHTML = "★";
            } else {
                stars[i].innerHTML = "☆";
            }
        }
    }
</script>

<style>
    .star-rating {
        font-size: 18px;
    }
    
    .star-rating span {
    	cursor: pointer;
    }
</style>

<section>
    <br>
    <div align="center">
        <h2>${p.productName}</h2>
        <form action=${path}/cartInsert.do >
			 <input type=hidden name=productId value="${p.productId}" >
			 <input type=hidden name=custNo value="${m.custno}" >

			<table border=1 width=700 height=350>
				<tr><td align="center" width=150>상품번호</td>  
				   <td > &emsp; ${p.productId} </td>
				   <td rowspan=4 width=110>
				   <img src=${path}/product/files/${p.productImgStr} width=200  height=250 />  </td>  </tr> 
				<tr><td align="center">상품이름</td>  
				   <td> &emsp; ${p.productName} </td></tr> 
				<tr><td align="center">상품가격</td>  
				   <td>&emsp;${p.productPrice} </td></tr>
				<tr><td  align="center">상품설명</td>  
				   <td ><textarea cols=40  rows=9 name=productDesc>${p.productDesc}
				    </textarea> </td></tr>
				<tr><td align="center">구매수량</td>  
				   <td colspan=2> &emsp;
				   <input type=number name=amount min=1  max=5 value=1> </td></tr> 
				       
				<tr><td align="center">등록날짜</td>  
				   <td colspan=2> &emsp; ${p.productDate} </td></tr>     
				<tr><td colspan=3  align="center"> 
				
				    <input  type=submit value="상품구매" >
				    &emsp;&emsp;
				    <input  type=button value="목록보기" onClick="listK()" >
				    &emsp;&emsp;
				    <input  type=button value="삭제하기" onClick="delK('${p.productId}')" >
				   </td></tr>
			</table>
		</form>

<br><br>

        <table border="1" width="700">
		    <tr>
		        <td>작성자</td>
		        <td width="300" align="center">댓글</td>
		        <td>작성일자</td>
		        <td width="120">별점</td>
		    </tr>
		     <c:forEach items="${reviewList}" var="review">
       		 <tr>
	            <td>${review.reviewId}</td>
	            <td>${review.reviewText}</td>
	            <td><fmt:formatDate value="${review.reviewDate}" pattern="yyyy-MM-dd" /></td>
	            <td>
                <div class="star-rating">
                    <c:forEach begin="1" end="${review.starRating}">
                        ★
                    </c:forEach>
                    <c:forEach begin="${review.starRating + 1}" end="5">
                        ☆
                    </c:forEach>
                </div>
            </td>
        </tr>
    </c:forEach>
		</table>

 <br><br><b>리뷰남기기</b>
	  <form action="${path}/productReviewSubmit.do" method="post">
        <input type="hidden" name="productId" value="${p.productId}" />
        <table border="1" width="700">
            <tr>
                <td>작성자</td>
                <td colspan="3">&nbsp;<input type=hidden value="${m.id}" name="reviewId" >${m.id}</td>
            </tr>
            <tr>
                <td width="100" align="center">댓글</td>
                <td colspan="3"><textarea name="reviewText" cols="60" rows="10"></textarea></td>
            </tr>
            <tr>
                <td>작성일자</td>
        		<td width="150">
            		<input type="date" name="reviewDate"/>
      			</td>
                <td width="120" align=center>별점</td>
                <td>
                    <div class="star-rating" onclick="setRating(event.target.dataset.rating)">
                        <span class="star" data-rating="1">☆</span>
                        <span class="star" data-rating="2">☆</span>
                        <span class="star" data-rating="3">☆</span>
                        <span class="star" data-rating="4">☆</span>
                        <span class="star" data-rating="5">☆</span>
                    </div>
                    <input type="hidden" name="rating" id="ratingInput" value="0" />
                </td>
            </tr>
            <tr>
                <td colspan=4 align=center>
                	<input type=submit value="리뷰등록"></td>
            </tr>
        </table>
     </form>
    </div>
    <br>
</section>

<c:import url="/include/bottom.jsp" />
