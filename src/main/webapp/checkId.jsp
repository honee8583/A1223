<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.example.team2.bean.MemberBean" %>
<%@ page import="org.example.team2.dao.MemberDAO" %>
<%
    String id = request.getParameter("id");
    boolean isDuplicate = false;

    // MemberDAO를 사용하여 아이디 중복 확인
    MemberDAO memberDAO = new MemberDAO();
    MemberBean existingMember = memberDAO.selectMember(id);

    if (existingMember != null && existingMember.getId() != null) {
        isDuplicate = true;  // 중복된 아이디
    }

    // JSON 응답
    response.setContentType("application/json; charset=UTF-8");
    response.getWriter().write("{\"isDuplicate\": " + isDuplicate + "}");
%>