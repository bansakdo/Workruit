<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%-- 
<%@page import="PProject.*"%> --%>
    

<jsp:useBean id="dao" scope="application" class="PProject.DatabaseConnect"/>
<jsp:useBean id="ps" class="PProject.PerSche"></jsp:useBean>
<jsp:setProperty property="*" name="ps"/>
<%
// 	PerSche ps = new PerSche();

System.out.println("asdasdsa");
	dao.addPerSche(ps);
	response.sendRedirect("mypage_calender.jsp");
%>


