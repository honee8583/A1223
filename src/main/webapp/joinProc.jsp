<%@ page import="org.example.team2.dao.MemberDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
    %>
    <jsp:useBean id="bean" class="org.example.team2.bean.MemberBean">
        <jsp:setProperty name="bean" property="*"/>
    </jsp:useBean>

    <%
        MemberDAO mdao = new MemberDAO();
        mdao.insertMember(bean);

        response.sendRedirect("index.jsp");     // 회원가입 진행 후 index로 이동
    %>
</body>
</html>
