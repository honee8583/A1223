<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.example.team2.dao.MemberDAO" %>

<%
    MemberDAO memberDAO = new MemberDAO();
    String id = (String) session.getAttribute("id");
    String password = request.getParameter("password");
    boolean result = memberDAO.checkPwd(id, password);

    if (!result) {
        System.out.println("비밀번호가 다릅니다!");
        response.sendRedirect("index.jsp");
    } else {
        System.out.println("비밀번호가 일치합니다!");
        String target = request.getParameter("target");
        if (target.equals("info")) {
            response.sendRedirect("update.jsp");
        } else if (target.equals("pwd")) {
            response.sendRedirect("pwdUpdate.jsp");
        }
    }
%>