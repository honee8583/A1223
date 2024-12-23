<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        #main {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 20vh;

            border: 2px solid skyblue;
            border-radius: 20px;
            width: 500px;
            padding: 50px 30px;
        }
        #redstar {
            color: red;
        }
        #id {
            margin: 7px;
            width: 100%;
        }
        #labeltxt {
            display: inline-block;
            width: 120px;
        }
        #btn {
            width: 100%;
            text-align: right;
        }
    </style>
</head>
<body>

<%
        HttpSession userSession = request.getSession(false);  // 세션이 없으면 null 반환
        if (userSession == null || userSession.getAttribute("id") == null) {
%>

    <form action="loginProc.jsp" method="post">
        <h2>로그인</h2>
        <div id="main">
            <div id="id">
                <label id="labeltxt">아이디 <label id="redstar">*</label></label>
                <input type="text" id="inputtxt" name="id" style="width: 250px;">
            </div>

            <div id="id">
                <label id="labeltxt">비밀번호 <label id="redstar">*</label></label>
                <input type="password" name="password" style="width: 250px;">
            </div>

            <center>
                <div id="btn">
                    <input type="submit" value="로그인">
                    <input type="button" value="회원가입" onclick="location.href='join.jsp'">
                </div>
            </center>
        </div>
    </form>
<%
    } else {
        String id = (String) session.getAttribute("id");
        String name = (String) session.getAttribute("name");
%>
         <center>
        <h2><%=name %>님 환영합니다.</h2>

        <div id="btn">
<%--            <a href="logout.jsp"><input type="button" value="로그아웃"></a>--%>
<%--            <a href="update.jsp"><input type="button" value="회원정보수정"></a>--%>
            <a href="logout.jsp"><input type="button" value="로그아웃"></a>
            <a href="pwdCheck.jsp?target=info"><input type="button" value="회원정보수정"></a>
            <a href="pwdCheck.jsp?target=pwd"><input type="button" value="비밀번호 변경"></a>
        </div>
<%
    }
%>

</body>
</html>