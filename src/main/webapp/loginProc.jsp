<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.example.team2.bean.MemberBean" %>
<%@ page import="org.example.team2.dao.MemberDAO" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>로그인 처리</title>
</head>
<body>
<%
    String id = request.getParameter("id");
    String password = request.getParameter("password");




    if (id != null && password != null) {
        MemberDAO mdao = new MemberDAO();

        // 로그인 검증 (MemberBean 객체 반환)
        MemberBean member = mdao.useLogin(id, password);

        if (member != null) {
            // 로그인 성공 시 세션에 사용자 정보 저장
            session.setAttribute("member", member);

            // 로그인 후 메인 페이지로 리다이렉트
            response.sendRedirect("index.jsp");
        } else {
%>
            <script>
                alert("아이디 또는 비밀번호가 올바르지 않습니다.");
                history.go(-1);
            </script>
<%
        }
    } else {
%>
    <script>
        alert("아이디와 비밀번호를 입력해주세요.");
        history.go(-1);
    </script>
<%
    }
%>
</body>
</html>