,<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>workruit</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/css/bootstrap.min.css" integrity="sha384-SI27wrMjH3ZZ89r4o+fGIJtnzkAnFs3E4qz9DIYioCQ5l9Rd/7UAa8DHcaL8jkWt" crossorigin="anonymous">

<style>
.index {
	width: 100%;
	position: fixed;
	top: 0;
}

.study {
	width: 100%;
	height: 720px;
	/* position: absolute; */
}

.inlogo {
    position: absolute;
	top: 30px;
	left: 100px;
}

.menu {
	list-style-type: none;
	margin: 0;
  	padding: 0;
    position: absolute;
	top: 30px;
	right: 100px;
}
.menu > li {
	float: left;
}
.menu_li { 	
  	display: inline-block;
	color: white;
	text-align: center;
	padding: 0 20px;
	text-decoration: none;
	font-size: 17px;
}

.menu_active {
    color: #5265b2;
    text-decoration: none;
    transition: all 0.3s ease-in-out;
}
.menu_li:hover:not(.active) {
    color: #5265b2;
    text-decoration: none;
    transition: all 0.3s ease-in-out;
}

.service {	
	width: 500px;
    position: absolute;
    left: 900px;
    top: 150px;
}
</style>
</head>

<body>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/js/bootstrap.min.js" integrity="sha384-3qaqj0lc6sV/qpzrc1N5DC6i1VRn/HyX4qdPaiEFbn54VjQBEU341pvjz7Dv3n6P" crossorigin="anonymous"></script>

<div class="index">
	
	<img class="study" src="study.png" alt="index_image">

	<a href="index.jsp" class="inlogo"><img src="logo.png" width="250px" alt="logo"></a>
	
	<ul class="menu">
		<li><a class="menu_li" href="#">소개</a></li>
		<li><a class="menu_li" href="#">이용방법</a></li>
		<li><a class="menu_li" href="#">고객센터</a></li>
		<li><a class="menu_li" href="#">회원가입</a></li>
		<li><a class="menu_li" href="main.jsp">로그인</a></li>
	</ul>

	<img class="service" src="service.png" alt="service_image">
	
</div>

</body>
</html>