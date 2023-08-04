<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/include/top.jsp" />

<section>
    <br>
    <div align="center">
        <h2>로 그 인</h2>
        <form name="f1" id="loginForm">
            <table border="1" width="300" height="150">
                <tr>
                    <td align="center">아이디</td>
                    <td>&emsp;<input type="text" name="id" id="id"/></td>
                </tr>
                <tr>
                    <td align="center">암호</td>
                    <td>&emsp;<input type="password" name="password" id="password" /></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="로그인">
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <br>
</section>

<c:import url="/include/bottom.jsp" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        $("#loginForm").submit(function (e) {
            e.preventDefault();

            var formData = {
                id: $("#id").val(),
                password: $("#password").val()
            };

            $.ajax({
                type: "POST",
                url: "${path}/login.do",
                data: formData,
                success: function (response) {
                    if (response === "empty_id_or_password") {
                        alert("아이디와 비밀번호를 입력해 주세요!!");
                    } else if (response === "id_not_found") {
                        alert("아이디가 존재하지 않습니다.");
                    } else if (response === "wrong_password") {
                        alert("암호가 일치하지 않습니다.");
                    } else if (response === "login_success") {
                        alert("로그인 성공");
                        window.location.href = "${path}/productList.do";
                    } else {
                        alert("알 수 없는 오류가 발생했습니다.");
                    }
                },
                error: function () {
                    alert("알 수 없는 오류가 발생했습니다.");
                }
            });
        });
    });
</script>