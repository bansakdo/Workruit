<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*, java.util.*" %>
<%@page import="PProject.*"%>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="dao" scope="application" class="PProject.DatabaseConnect" />
<jsp:useBean id="PerCats" class="PProject.PerCats" />
<jsp:setProperty property="*" name="PerCats"/>

<%
int p_id = Integer.parseInt(request.getParameter("p_id"));
dao.delPerCat(p_id);
response.sendRedirect("mypage_interest.jsp");
%>