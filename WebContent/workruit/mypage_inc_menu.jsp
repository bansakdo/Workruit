<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.menu_ui{
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: auto;
    background-color: white;
    border-right: 1px solid lightgray;
}

.menu_li {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-align: center;
    text-decoration: none;
}

.menu_title{
	text-align: center;
	font-weight: bold;
	font-size: 20px;
	margin-top: 30px;
	margin-bottom: 10px;
	
}

.menu_active {
    background-color: #5265b2;
    color: white;
    text-align: center;
    text-decoration: none;
    transition: all 0.3s ease-in-out;
}

.menu_li:hover:not(.active) {
    background-color: #5265b2;
    color: white;
    text-decoration: none;
    transition: all 0.3s ease-in-out;
}

.high {
    height: auto;
}
</style>
</head>
<body>

<ul class="menu_ui sticky-top">
	<li class="menu_title">마이페이지</li>

    <li><a href="mypage_interest.jsp" class="menu_li" id="menu1">관심분야</a></li>
    <li><a href="mypage_bookmark.jsp" class="menu_li" id="menu2">즐겨찾기</a></li>
    <li><a href="mypage_calendar.jsp" class="menu_li" id="menu3">일정관리</a></li>
    <li><a href="mypage_trend.jsp" class="menu_li" id="menu4">업계동향</a></li>
</ul>

