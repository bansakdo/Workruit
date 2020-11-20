<%@page import="java.text.SimpleDateFormat"%>
<%@page import="PProject.Recruit"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/css/bootstrap.min.css" integrity="sha384-SI27wrMjH3ZZ89r4o+fGIJtnzkAnFs3E4qz9DIYioCQ5l9Rd/7UAa8DHcaL8jkWt" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/css/bootstrap.min.css" integrity="sha384-SI27wrMjH3ZZ89r4o+fGIJtnzkAnFs3E4qz9DIYioCQ5l9Rd/7UAa8DHcaL8jkWt" crossorigin="anonymous">
<link href='/pproject/assets/fullcalendar-4.3.1/packages/core/main.css' rel='stylesheet' />
<link href='/pproject/assets/fullcalendar-4.3.1/packages/daygrid/main.css' rel='stylesheet' />
<jsp:useBean id="dao" scope="application" class="PProject.DatabaseConnect"/>


<style>
.box1 {
	border: 1px solid red;
	margin: auto;
	width: 80%;
}

.box2 {
	border: 1px solid red;
	display: inline-block;
}

#imgcenter {
	border: 1px solid #5265b2;
	text-align: center;
}

.parent {
	display: flex;
}

.child1 {
	flex: 1;
}

.child2 {
	flex: 2;
}

#contents #list #noticeview th {
	font-size: 15px;
	letter-spacing: -1px;
	color: #757575;
	background: url(list_bg.png) repeat-x center top;
	max-height: 33px;
	color: #000;
	padding: 6px 0 10px 0px !important;
}

#countdown, #newcountdown {
	display: inline;
	color: red;
	font-size: 30px;
}

#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
	text-align: center;
}

#customers1 td, #customers1 th {
	border: 2px solid #5265b2;
	padding: 8px;
	text-align: center;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: center;
	background-color: #5265b2;
	color: white;
}

#contents #list #noticeview th.left {
	border-left: 1px solid;
	border-color: #d7d7d7;
}

#list-item-2 {
	position: relative;
}

#box {
	position: absolute;
	width: 900px;
	height: 300px;
	left: 0;
	right: 0;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
	border: 1px solid;
	background: #ffffff;
}

#box img {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

.my-hr1 {
	border: 0;
	height: 2px;
	background: #2F4F4F;
}

.main {
	width: 100%;
	border: 0;
	padding: 0;
	min-height: 100%;
	background-position: center;
	background-size: cover;
}

.recruit {
	margin: 30px 100px;
}

.section1 {
	height: 300px;
	border: #5265b2 1px solid;
}

.section {
	height: 500px;
	border: #5265b2 1px solid;
}

#countdown {
	
	color: red;
	font-size: 22px;
}

</style>
</head>
<%
int r_id = Integer.parseInt(request.getParameter("r_id"));
Recruit recr = dao.getRecruit(r_id);
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
String lcat = recr.getR_Lcat();
%>
<body data-spy="scroll" data-target="#list-example">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/733ba69ffe.js" crossorigin="anonymous"></script>
	<script src="https://use.fontawesome.com/releases/v5.12.0/js/all.js" data-search-pseudo-elements></script>
	<script src="https://use.fontawesome.com/releases/v5.12.0/js/all.js" data-auto-replace-svg="nest"></script>
	<script src="https://tistory3.daumcdn.net/tistory/941717/skin/images/jquery.min.js" type="text/javascript"></script>
	<script src="https://tistory3.daumcdn.net/tistory/941717/skin/images/snowfall.jquery.js" type="text/javascript"></script>


	<div class="main">
		<jsp:include page="inc_header.jsp" flush="false" />
		<jsp:include page="inc_navbar.jsp" flush="false" />

		<div class="row recruit">
					<div class="col-3">
						<div id="list-example" class="list-group sticky-top">
							<a class="list-group-item list-group-item-action active" href="#recruit">채용공고</a> 
							<a class="list-group-item list-group-item-action" href="#section">모집분야 </a>
							<a class="list-group-item list-group-item-action" href="#company">기업정보</a>
							<a class="list-group-item list-group-item-action" href="#customers">맞춤형공고</a>
				    	</div>	
				    </div>
			
	       			
	       			<div class="col-9">
	     				<table width="700" border="0" cellspacing="0" cellpadding="0" id="contents">
							<tr>
								<td height="100" valign="top" align="right"><img src="img/general.gif" id="recruit" align="right" width="770" height="67"></td>
							</tr>
				
							<tr>
								<td><table width="710" border="0" align="right" cellpadding="0" cellspacing="0" id="list">
									<tr>
										<td valign="top"><table width="730" border="0" cellspacing="0" cellpadding="0" id="noticeview">
											<tr>
												<th height="" class="right left" style="padding: 9px 0 10px 0px; FONT-SIZE: 18px; text-align: center;">
												[신입/경력]<strong><font color=#e95b71><span style=FONT-SIZE: 9pt> <%=recr.getR_title() %>
												</th>
											</tr>
											<tr>
												 <td style="border-bottom: 1px solid; border-color: #e7e7e7; padding: 8px 5px 8px 5px;">
												<!-- div style="float:left; line-height:22px;"><strong>* 채용구분 :</strong> 수시</div -->
												<div style="float: left; line-height: 22px;">
													<strong><b style="color: #f00;">*</b> 채용형태 :</strong><%=recr.getR_exp() %> &nbsp; 
												</div>
												<div style="float: left; padding-left: 10px; padding-right: 10px;"></div>
												<div style="float: left; line-height: 22px;">
													<strong><b style="color: #f00;">*</b> 접수기간 :</strong> <%=dateFormat.format(recr.getR_start()) %> ~ <span id="endDate"><%=dateFormat.format(recr.getR_end()) %></span>
												</div>
											</td>
										</tr>


										<tr>
											<td style="padding: 10px;" class="the_contents_area">
												<DIV style="WIDTH: 750px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px">
													<TABLE style="WIDTH: 700px; MARGIN: 0px auto" cellSpacing=0 cellPadding=0 border=0>
														<TBODY>
															<TR>
																<TD>
																	<div width=100% align="center">
																		<IMG border=0 alt="" src="img/com_logo/<%=recr.getR_img() %>">
																	</div>
																	<DIV style="WIDTH: 750px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px">
																		<TABLE style="WIDTH: 770px; MARGIN: 0px auto" cellSpacing=0 cellPadding=0 border=0>
																			<TBODY>
																				<TR>
																					<TD>&nbsp;<MAP id=main_Map name=main_Map>
																							<AREA href="#;" shape=rect alt="&#65533;&#45190;&#44439;吏&#65533;&#65533;&#47663;&#44876; &#65533;&#47890;&#44902;&#65533;&#49422;&#50989; 媛&#65533;湲&#65533;" coords=19,621,522,742>
																						</MAP></TD>
																				</TR>
																				<TR>
																					<TD>&nbsp;</TD>
																				</TR>
																				<tr>
																					<TD><HREF =HTTP: ) target="_blank" remNormalList.php?act='view&amp;idx=650"' recruit.hackers.com> </A>&nbsp;</TD>
																				</TR>
																			</TBODY>
																		</TABLE>
																	</DIV>
																	<P id="section" style="LINE-HEIGHT: 2">
<!-- 																		<STRONG><SPAN style="FONT-FAMILY: 굴림">1.
																		</SPAN><FONT class=font8><SPAN style="FONT-FAMILY: 굴림">담당업무</SPAN></FONT><FONT
																			class=font7 face=Tahoma><SPAN
																				style="FONT-FAMILY: 굴림"> </SPAN></FONT><FONT class=font8><SPAN
																				style="FONT-FAMILY: 굴림">및</SPAN></FONT><FONT class=font7
																			face=Tahoma><SPAN style="FONT-FAMILY: 굴림">
																			</SPAN></FONT><FONT class=font8><SPAN
																				style="FONT-FAMILY: 굴림">자격</SPAN></FONT><FONT class=font7
																			face=Tahoma><SPAN style="FONT-FAMILY: 굴림">/</SPAN></FONT><FONT
																			class=font8><SPAN style="FONT-FAMILY: 굴림">우대사항</SPAN></FONT></STRONG> -->
																			<strong><span style="FONT-FAMILY: 굴림">
																				1. 담당업무 및 자격 / 우대사항 
																			</span></strong>
																	</P> <FONT class=font8><SPAN style="FONT-FAMILY: Verdana">


																			<TABLE style="WIDTH: 545pt; BORDER-COLLAPSE: collapse" cellSpacing=0 cellPadding=0 width=725 border=0>
																				<COLGROUP>
																					<COL style="WIDTH: 83pt; mso-width-source: userset; mso-width-alt: 3520" width=110>
																					<COL style="WIDTH: 65pt; mso-width-source: userset; mso-width-alt: 2784" width=87>
																					<COL style="WIDTH: 8pt; mso-width-source: userset; mso-width-alt: 320" width=10>
																					<COL style="WIDTH: 389pt; mso-width-source: userset; mso-width-alt: 16576" width=518>
																				<TBODY>
																					<TR style="HEIGHT: 36.75pt; mso-height-source: userset" height=49>
																						<TD class=xl73 style="BORDER-TOP: #7f7f7f 0.5pt solid; HEIGHT: 270pt; BORDER-RIGHT: #7f7f7f 0.5pt solid; WIDTH: 83pt; BORDER-BOTTOM: #7f7f7f 0.5pt solid; BORDER-LEFT: #7f7f7f 0.5pt solid; BACKGROUND-COLOR: #dbe5f1" height=360 rowSpan=6 width=110>
																							<P style="LINE-HEIGHT: 2" align=center>
																								<FONT face=돋움><STRONG><FONT face=굴림><%=recr.getR_Scat() %><br>[신입/경력]</FONT></STRONG></FONT>
																							</P>
																							<P style="LINE-HEIGHT: 2" align=center>
																								 <SPAN style="FONT-FAMILY: 굴림"></SPAN></FONT>
																							</P>
																						</TD>
																						<TD class=xl69 style="BORDER-TOP: #7f7f7f 0.5pt solid; BORDER-RIGHT: #7f7f7f 0.5pt solid; WIDTH: 65pt; BORDER-BOTTOM: #7f7f7f 0.5pt solid; BORDER-LEFT: #7f7f7f; BACKGROUND-COLOR: #f2f2f2" width=87>
																							<P style="LINE-HEIGHT: 2" align=center>
																								<FONT class=font8 face=돋움><STRONG><SPAN style="FONT-FAMILY: 굴림">구분</SPAN></STRONG></FONT>
																							</P>
																						</TD>
																						<TD class=xl70 style="BORDER-TOP: #7f7f7f 0.5pt solid; BORDER-RIGHT: #f0f0f0; WIDTH: 8pt; BORDER-BOTTOM: #7f7f7f 0.5pt solid; BORDER-LEFT: #7f7f7f; BACKGROUND-COLOR: transparent" width=10>
																							<STRONG><FONT face=Tahoma><SPAN style="FONT-FAMILY: 굴림"><P style="LINE-HEIGHT: 2">
																									<STRONG><FONT face=Tahoma><SPAN style="FONT-FAMILY: 굴림"> </SPAN></FONT></STRONG>
																							</P></SPAN></FONT></STRONG>
																						</TD>
																						<TD class=xl68 style="BORDER-TOP: #7f7f7f 0.5pt solid; BORDER-RIGHT: #7f7f7f 0.5pt solid; WIDTH: 389pt; BORDER-BOTTOM: #7f7f7f 0.5pt solid; BORDER-LEFT: #f0f0f0; BACKGROUND-COLOR: transparent" width=518>
																							<FONT face=돋움><SPAN style="FONT-FAMILY: 굴림"><P style="LINE-HEIGHT: 2">
																							<FONT face=돋움><SPAN style="FONT-FAMILY: 굴림"><%=recr.getR_exp() %></SPAN></FONT>
																							</P></SPAN></FONT>
																						</TD>
																					</TR>
																					<TR style="HEIGHT: 36.75pt; mso-height-source: userset" height=49>
																						<TD class=xl67 style="BORDER-TOP: #7f7f7f; HEIGHT: 36.75pt; BORDER-RIGHT: #7f7f7f 0.5pt solid; WIDTH: 65pt; BORDER-BOTTOM: #7f7f7f 0.5pt solid; BORDER-LEFT: #7f7f7f; BACKGROUND-COLOR: #f2f2f2" height=49 width=87>
																							<P style="LINE-HEIGHT: 2" align=center><FONT face=돋움><STRONG>
																								<SPAN style="FONT-FAMILY: 굴림">고용형태</SPAN>
																							</STRONG></FONT></P>
																						</TD>
																						<TD class=xl70 style="BORDER-TOP: #7f7f7f; BORDER-RIGHT: #f0f0f0; WIDTH: 8pt; BORDER-BOTTOM: #7f7f7f 0.5pt solid; BORDER-LEFT: #7f7f7f; BACKGROUND-COLOR: transparent" width=10>
																							<STRONG><FONT face=Tahoma><SPAN style="FONT-FAMILY: 굴림">
																								<P style="LINE-HEIGHT: 2">
																									<STRONG><FONT face=Tahoma><SPAN style="FONT-FAMILY: 굴림"> </SPAN></FONT></STRONG>
																								</P>
																							</SPAN></FONT></STRONG>
																						</TD>
																						<TD class=xl68 style="BORDER-TOP: #7f7f7f; BORDER-RIGHT: #7f7f7f 0.5pt solid; WIDTH: 389pt; BORDER-BOTTOM: #7f7f7f 0.5pt solid; BORDER-LEFT: #f0f0f0; BACKGROUND-COLOR: transparent" width=518>
																							<P style="LINE-HEIGHT: 2">
																								<FONT face=돋움><SPAN style="FONT-FAMILY: 굴림">정규직</SPAN></FONT>
																							</P>
																						</TD>
																					</TR>
																					<TR style="HEIGHT: 52.5pt; mso-height-source: userset" height=70>
																						<TD class=xl69 style="BORDER-TOP: #7f7f7f; HEIGHT: 52.5pt; BORDER-RIGHT: #7f7f7f 0.5pt solid; WIDTH: 65pt; BORDER-BOTTOM: #7f7f7f 0.5pt solid; BORDER-LEFT: #7f7f7f; BACKGROUND-COLOR: #f2f2f2" height=70 width=87>
																							<P style="LINE-HEIGHT: 2" align=center>
																								<FONT class=font8 face=돋움><STRONG>
																									<SPAN style="FONT-FAMILY: 굴림">담당업무</SPAN>
																								</STRONG></FONT>
																							</P>
																						</TD>
																						
																						
																						
																						
																						<TD class=xl70 style="BORDER-TOP: #7f7f7f; BORDER-RIGHT: #f0f0f0; WIDTH: 8pt; BORDER-BOTTOM: #7f7f7f 0.5pt solid; BORDER-LEFT: #7f7f7f; BACKGROUND-COLOR: transparent" width=10>
																							<STRONG><FONT face=Tahoma><SPAN style="FONT-FAMILY: 굴림">
																								<P style="LINE-HEIGHT: 2">
																									<STRONG><FONT face=Tahoma><SPAN style="FONT-FAMILY: 굴림"> </SPAN></FONT></STRONG>
																								</P>
																							</SPAN></FONT></STRONG>
																						</TD>
																						<TD class=xl66 style="BORDER-TOP: #7f7f7f; BORDER-RIGHT: #7f7f7f 0.5pt solid; WIDTH: 389pt; BORDER-BOTTOM: #7f7f7f 0.5pt solid; BORDER-LEFT: #f0f0f0; BACKGROUND-COLOR: transparent" width=518><FONT face=Tahoma><SPAN style="FONT-FAMILY: 굴림">
																									<P style="LINE-HEIGHT: 2">
																										<FONT face=Tahoma><SPAN style="FONT-FAMILY: 굴림"> <%=recr.getR_notice() %> </SPAN></FONT>
																									</P>
																							</SPAN></FONT></TD>
																					</TR>
																					<hr>

																					</TR>
																				</TBODY>
																			</TABLE>
																			
																			<DIV></DIV>
																			
																			<TR>
																			<TD>&nbsp;</TD>
																			</TR>
																			
																			<TR>
																			<TD>&nbsp;</TD>
																			</TR>
																			
																			<TR>
																			<TD>&nbsp;</TD>
																			</TR>
																			
																			<TR>
																			<TD>&nbsp;</TD>
																			</TR>


																			<TR>
																				<TD><IMG id="company" border=0 alt="" src="cont.jpg"></TD>
																			</TR>
																			
																			
																			
																			<TR>&nbsp;</TR>
																			
																			<TR>
																			<TD>&nbsp;</TD>
																			</TR>
																			
																			<TR>
																			<TD>&nbsp;</TD>
																			</TR>

																			<TR>
																				<TD><IMG alt="" src="img/hachac.jpeg" style="width:760px;">
																				</TD>
																			</TR>
														</TBODY>
													</TABLE>
													<DIV></DIV>
													<DIV></DIV>
													<DIV></DIV>
												</DIV>
										<tr>
											<td style="border-top: 1px solid; border-color: #e7e7e7; padding: 8px 5px 8px 5px;">
											<strong>[신입/경력]</strong> <%=recr.getR_title() %> <br>
											접수기간:<%=dateFormat.format(recr.getR_start()) %> ~ <%=dateFormat.format(recr.getR_end()) %><br>
											
											<font color=#e95b71>
													
													남은 기간:
													
													<h2 id="countdown"></h2>
											</td>
												
										</tr>

					<TR>
						<TD>&nbsp;</TD>
					</TR>
					
					<TR>
						<TD>&nbsp;<hr></TD>
						
					</TR>


					
			
					<table id="customers">
					 <tr>
					  <th>기업</th>
					  <th>채용 공고</th>
					  <th>마감일</th>
					  <th>즐겨찾기</th>
					</tr>
					
					<tr>
					  <td><a href="https://career.nexon.com/user/recruit/notice/noticeList?joinCorp=NX"><b>넥슨</b></a></td>
					  <td><a href="">-[모바일배포시스템팀] 모바일게임 플랫폼 서버 개발자 모집</a></td>
					  <td>~2019-12-18<a href=""><img src="img/cal.png" style="width:30px; height:30px; float:right;"></a></td>
					  <td><i class="fas fa-star bookmark"></i></td>
					</tr>
					  
					  <tr>
					  <td><a href="https://careers.ncsoft.com/"><b>엔씨소프트</b></a></td>
					  <td><a href="">-[NC소프트] 연말정산 매니저 모집</a></td>
					  <td>~2019-12-20<a href=""><img src="img/cal.png" style="width:30px; height:30px; float:right;"></a></td>
					 <td><i class="fas fa-star bookmark"></i></td>
					</tr>
					
					<tr>
					  <td><a href="http://bobgate.net/"><b>Bobgate</b></a></td>
					  <td><a href="">-모바일게임 번역 영작/일본어/중국어(번체)/인도네시아어 작업자</a></td>
					   <td>~2020-01-08<a href=""><img src="img/cal.png" style="width:30px; height:30px; float:right;"></a></td>
					  <td><i class="fas fa-star bookmark"></i></td>
					</tr>
					
					<tr>
					  <td><a href="https://kakaogames.recruiter.co.kr/appsite/company/index"><b>kakaogames</b></a></td>
					  <td><a href="">-[프렌즈게임즈]주니어 인사운영 담당자 영입</a></td>
					   <td>~2019-12-18<a href=""><img src="img/cal.png" style="width:30px; height:30px; float:right;"></a></td>
					 <td><i class="fas fa-star bookmark"></i></td>
					</tr>
					
					<tr>
					  <td><a href="http://www.itian.co.kr/?act=info.page&pcode=sub7_3"><b>itian</b></a></td>
					  <td><a href="">-Global APT 1위 파이어아이솔루션 운영 보안 엔지니어(신입)</a></td>
					   <td>~2019-12-19<a href=""><img src="img/cal.png" style="width:30px; height:30px; float:right;"></a></td>
					 <td><i class="fas fa-star bookmark"></i></td>
					</tr>
					
					
					<tr>
					  <td><a href="https://softinfo.co.kr/"><b>Soft Information Service CO.</b></a></td>
					  <td><a href="">-[인재모집]소프트웨어, 하드웨어 전문인력 신입&경력</a></td>
					   <td>2019-12-20<a href=""><img src="img/cal.png" style="width:30px; height:30px; float:right;"></a></td>
					  <td><i class="fas fa-star bookmark"></i></td>
					</tr>
					
				
					<tr>
					  <td><a href="http://www.bellins.net/detail/recruit.html?id=recruit_04"><b>BellI&S</b></a></td>
					  <td><a href="">-[종근당 계열사] 솔루션구축 JAVA 개발자 정규직 채용<br>-근무지: 서울 강남구 &nbsp;&nbsp; -요구 경력: 신입</a></td>
					  <td>2019-12-20<a href=""><img src="img/cal.png" style="width:30px; height:30px; float:right; "></a></td>
					  <td><i class="fas fa-star bookmark"></i></td>
					</tr>
					
					<tr>
					 <td><a href="https://www.inetcop.org/careers"><b>inetcop</b></a></td>
					  <td><a href="">-모바일 악성코드 분석 관제 요원 모집</a></td>
					  <td>2019-12-18<a href=""><img src="img/cal.png" style="width:30px; height:30px; float:right;"></a></td>
					  <td><i class="fas fa-star bookmark"></i></td>
					</tr>
					
					
					
					</table>
					
						
					</div>






<script>
 $(document).ready(function(){
    $("body").scrollspy({
        target: "#list-example",
        offset : 200
    });
});

 document.addEventListener('DOMContentLoaded', function() {

$('td i').on('click', function() { // we are letting the li bind to the event
	alert('즐겨찾기를 해제하시겠습니까?');
});
});

//CountDownTimer('12/31/2019', 'countdown');
//CountDownTimer('01/01/2021 00:00 AM', 'newcountdown');
CountDownTimer(document.getElementById("endDate").innerText, 'countdown');

function CountDownTimer(dt, id)
{
    var end = new Date(dt);

    var _second = 1000;
    var _minute = _second * 60;
    var _hour = _minute * 60;
    var _day = _hour * 24;
    var timer;

    function showRemaining() {
        var now = new Date();
        var distance = end - now;
        if (distance < 0) {

            clearInterval(timer);
            document.getElementById(id).innerHTML = 'EXPIRED!';

            return;
        }
        var days = Math.floor(distance / _day);
        var hours = Math.floor((distance % _day) / _hour);
        var minutes = Math.floor((distance % _hour) / _minute);
        var seconds = Math.floor((distance % _minute) / _second);

        document.getElementById(id).innerHTML = days + '일 ';
        document.getElementById(id).innerHTML += hours + '시간 ';
        document.getElementById(id).innerHTML += minutes + '분 ';
        document.getElementById(id).innerHTML += seconds + '초';
    }

    timer = setInterval(showRemaining, 1000);
}


</script>
</body>
</html>