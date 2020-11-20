<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.logo {
	margin-top: 10px;
	margin-left: 100px;
}
.home > a > img {
	cursor: pointer;
}
.header {
	margin-right: 100px;
}
.header_li {
	text-decoration: none;
	color: #5265b2;
}
.header_active {
    color: white;
    background-color: #5265b2;
    text-decoration: none;
    transition: all 0.3s ease-in-out;
}

.header_li:hover:not(.active) {
    color: white;
    background-color: #5265b2;
    text-decoration: none;
    transition: all 0.3s ease-in-out;
}

</style>

<nav class="navbar navbar-light home">
	<a class="navbar-brand logo" href="main.jsp">
		<img src="logo.png" width="250px" alt="logo">
	</a>
	
	<ul class="nav justify-content-end header">
		<li class="nav-item"><a class="nav-link header_li" href="mypage_interest.jsp">마이페이지</a></li>
		<li class="nav-item"><a class="nav-link header_li" href="index.jsp">로그아웃</a></li>
	</ul>
</nav>