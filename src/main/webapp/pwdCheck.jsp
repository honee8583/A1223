<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        form {
            width: 400px;
            height: 200px;
            padding: 10px;
            border: 2px solid skyblue;
            border-radius: 30px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .btn {
            margin: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>
    <script>
        function check() {
            let value = document.pwdCheck.password.value;
            if (value == null || value === "") {
                alert('비밀번호를 입력해주세요');
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

    <h2>비밀번호 확인</h2>
    <form name="pwdCheck" action="pwdCheckProc.jsp" onsubmit="return check()">
        <input type="text" name="target" value="<%=request.getParameter("target")%>" hidden />
        기존 비밀번호 <input type="password" name="password" /> <br>
        <div class="btn">
            <input class="btn" type="submit" value="확인" />
            <input class="btn" type="button" onclick="location.href='index.jsp'" value="취소" />
        </div>
    </form>

</body>
</html>