<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*, java.util.*" %>
<%@page import="PProject.*"%>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="dao" scope="application" class="PProject.DatabaseConnect" />
<jsp:useBean id="Bookmark" class="PProject.Bookmark" />
<jsp:setProperty property="*" name="Bookmark"/>

<%
int b_id = Integer.parseInt(request.getParameter("b_id"));
dao.delBookmark(b_id);
response.sendRedirect("mypage_bookmark.jsp");
%>