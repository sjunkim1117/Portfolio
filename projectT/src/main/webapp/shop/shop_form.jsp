<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/include/top.jsp" />

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<script>
 jQuery.ajaxSetup({cache:false})
 var path = '${path}' 
 $(document).ready(function() {
		$("#ckBtn").click(function() {
						
			var idValue = $("#id").val();
						
			var dataStr = {
				id : idValue
			};

			$.ajax({
				type : "GET",
				url : path + "/IdCk.do",
				data : dataStr,
				success : function(data) {
					if (data == "T") {
						alert("사용가능한  ID 입니다.")
					} else {
						alert("사용 불가능한 ID 입니다.")
						$("#id").val("");
						$("#id").focus();
					}

				}
			})
		})

	})



 function formCh(){
   if (f1.id.value==""){
	   alert("ID를 입력해 주세요!!");
	   f1.id.focus()
	   return false;
   } else if(f1.password.value==""){
	   alert("암호를 입력해 주세요!!");
	   f1.password.focus()  
	   return false;
   }	
	
}

</script>

<section>

 <br>
 <div align="center">
 <h2> 회원가입 </h2>
 <form name="f1" onSubmit="return formCh()"  action="${path}/ShopFormOK.do">
 <table border=1 width=520>
 <tr><td>회원번호 </td><td><input  type="text" name="custno" value="${custno}" readonly> </td> </tr>
 <tr><td>아 이 디 </td><td><input  type="text" name="id"  id="id" required >
    <input type="button" id="ckBtn" value="아이디체크" ></td> </tr>
 <tr><td>비밀번호 </td><td><input  type="text" name="password"> </td> </tr>
 <tr><td>회원성명 </td><td><input  type="text" name="custname"> </td> </tr>
 <tr><td>회원전화 </td><td><input  type="text" name="phone"> </td> </tr>
 <tr><td>회원주소 </td>
    <td>
    
    <input type="text" name="zipcode" id="sample4_postcode" placeholder="우편번호">
    <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
    <input type="text" name="address" id="sample4_roadAddress" placeholder="도로명주소" size=50 >

    <input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">

    <span id="guide" style="color:#999;display:none"></span>
    <br>
    <input type="text" name="address2" id="sample4_detailAddress" placeholder="상세주소"  size=50>
    <input type="hidden" name="extraAddress" id="sample4_extraAddress" placeholder="참고항목">
  
    </td> 
  </tr>
 <tr><td>가입일자 </td><td>
     <c:set var="now" value="<%=new java.util.Date()%>" />
     <c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
     <input  type="text" name="joindateStr" value="${sysYear}" > </td> </tr>

 <tr><td colspan=2 align="center"> 
     <input type=submit  value="회원가입">
     </td> </tr>
 </table>
 </form>
 
 
 </div>
 <br>
</section>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

//   본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 
//   데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}

</script>


<c:import url="/include/bottom.jsp" />