<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <script>
        function check() {
            const pwd = document.pwdUpdate.password.value;
            const pwdCheck = document.pwdUpdate.pwdCheck.value;

            if (pwd != pwdCheck) {
                alert('비밀번호를 다시한번 확인해주세요!');
                return false;
            }
            return true;
        }
    </script>

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
</head>
<body>

    <h2>비밀번호 수정</h2>
    <form name="pwdUpdate" action="pwdUpdateProc.jsp" onsubmit="return check()">
        <input type="text" name="id" hidden />
        새 비밀번호 <input type="password" name="password" /> <br>
        비밀번호 확인 <input type="password" name="pwdCheck" /> <br>
        <div class="btn">
            <input class="btn" type="submit" value="수정" />
            <input class="btn" type="button" onclick="location.href='index.jsp'" value="취소" />
        </div>
    </form>

</body>
</html>