<%@ page import="org.example.team2.dao.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>

<%
    request.setCharacterEncoding("utf-8");
    String[] hobby = request.getParameterValues("hobby");
    String str = "";

    if (hobby != null && hobby.length > 0) {
        for (int i = 0; i < hobby.length; i++) {
            str += hobby[i] + " ";
        }
    }
%>

<jsp:useBean id="memberbean" class="org.example.team2.bean.MemberBean">
    <jsp:setProperty name="memberbean" property="*"/>
</jsp:useBean>

<script>
    alert("회원정보가 수정되었습니다");
</script>

<%
    memberbean.setHobby(str);
    String id = request.getParameter("id");

    MemberDAO memberDAO = new MemberDAO();
    memberDAO.updateMember(memberbean);

    response.sendRedirect("index.jsp?id=" + id);
%>

