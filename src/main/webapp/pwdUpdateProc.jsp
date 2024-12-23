<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.example.team2.dao.MemberDAO" %>

<%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    MemberDAO memberDAO = new MemberDAO();
    memberDAO.updatePwd(id, password);

    response.sendRedirect("index.jsp");
%>