<%@page import="java.io.Console"%>
<%@page import="java.util.*"%>
<%@page import="PProject.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!-- 						사용 안함. 참고용.							 -->
<jsp:useBean id="dao" scope="application" class="PProject.DatabaseConnect" />
<jsp:useBean id="bmk" class="PProject.Bookmark"/>
<jsp:useBean id="recr" class="PProject.Recruit" />
<jsp:useBean id="pCat" class="PProject.PerCats" />
<jsp:useBean id="pSche" class="PProject.PerSche" />
<jsp:useBean id="user" class="PProject.User" />
<jsp:useBean id="hist" class="PProject.History" />
<%-- <jsp:setProperty property="*" name="bmk"/> --%>
<!-- 
		즐겨찾기한 직종 조회 / 추가 / 해제 
		즐겨찾기한 공고 조회 / 추가 / 해제 
		개인 일정 조회 / 추가 / 수정 
		개인정보 조회 / 수정 
		공고 기록 

 -->
<%
String action = request.getParameter("action");
String section = request.getParameter("section");
String menu = request.getParameter("menu");
/* Bookmark bmk; */
/* User user;
History hist;
Recruit recr;
PerCats pCat;
PerSche pSche; */
//dao.selectAllUser();

user = dao.getUser("hoho");
	switch(section) {
	case "search" : 
		break;
	case "myPage" : 
		if(menu.equals("interest")) {
			if(action.equals("addPerCat")) {
%><jsp:setProperty property="*" name="pCat"/><%
				dao.addPerCat(pCat);
			} else if(action.equals("delPerCat")) {
				int p_id = Integer.parseInt(String.valueOf(request.getAttribute("num")));
				dao.delPerCat(p_id);
			}
			response.sendRedirect("mypage_interest.jsp");
		} else if(menu.equals("bookmark")) {
			
		} else if(menu.equals("calender")) {
			
		} else if(menu.equals("trend")) {
			
		}
		break;
	case "index" : 
		break;
	default :
		break;
	}

	switch(action) {
	case "bmk_select" :
		bmk = dao.getBookmark(1);
		out.println(bmk.getB_recruitId());
		break;
	case "bmk_insert" : 
		bmk = new Bookmark(); 
		bmk.setB_recruitId(Integer.parseInt(request.getParameter("b_recruitId")));
		bmk.setB_userId(request.getParameter("b_userId"));
		dao.addBookmark(bmk);
		break;
	case "bmk_delete" : 
		int b_id = Integer.parseInt(request.getParameter("b_id"));
		dao.delBookmark(b_id);
		break;
		
	 
	}

 
 %>
 
 

