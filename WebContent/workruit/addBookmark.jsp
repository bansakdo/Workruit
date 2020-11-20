<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*, java.util.*" %>
<%@page import=PProject.*"%>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="dao" scope="application" class="PProject.DatabaseConnect" />
<jsp:useBean id="Bookmark" class="PProject.Bookmark" />
<jsp:setProperty property="*" name="Bookmark"/>

<%
int r_id = Integer.parseInt(request.getParameter("r_id"));
dao.addBookmark(r_id);
/* dao.addBookmarl(r_id); */
response.sendRedirect("main.jsp");
%>