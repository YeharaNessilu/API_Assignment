<%--
  Created by IntelliJ IDEA.
  User: Shavindi
  Date: 6/19/2025
  Time: 12:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Get current session, if exists
    session.invalidate();  // Session එක ඉවත් කරනවා

    // Redirect to login page (index.jsp)
    response.sendRedirect("index.jsp");
%>
