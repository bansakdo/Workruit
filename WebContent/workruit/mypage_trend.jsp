<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<jsp:useBean id="ynh" scope="application" class="PProject.Ynh"/>
<jsp:useBean id="dao" scope="application" class="PProject.DatabaseConnect"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage - bookmark</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/css/bootstrap.min.css" integrity="sha384-SI27wrMjH3ZZ89r4o+fGIJtnzkAnFs3E4qz9DIYioCQ5l9Rd/7UAa8DHcaL8jkWt" crossorigin="anonymous">

<style>
.main {
	width: 100%;
}

.row {
	margin: 0 100px;
}
</style>
</head>

<body onload="active()">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<%
	/* User user = dao.getUser("hoho"); */
	String[] Lcats = dao.getPerLcat("hoho");
	int length = Lcats.length;
	int numOfArticle = 3;
	/* ynh.selectTopic(query, num) */
%>

<div class="main">
	<jsp:include page="inc_header.jsp" flush="false" />
	<jsp:include page="inc_navbar.jsp" flush="false" />

	<div class="row">
		<div class="col-3">
			<jsp:include page="mypage_inc_menu.jsp" flush="false" />
		</div>

		<div class="col-9">
			<div class="page-header" style="margin-top: 30px;">
				<h3>업계동향</h3>
			</div>
			
			<div class="accordion" id="accordionExample">
				<%
				for(int i = 0 ; i < length ; i++) {
					String[][] cse = ynh.customSearch(Lcats[i], numOfArticle);
					String[] topics = ynh.selectTopic(cse);
				%>
				<div class="card">
					<div class="card-header" id="headingOne">
						<h2 class="mb-0">
						<%
					if(i == 0) {
				%>
							<button class="btn btn-link" style="color: black;" type="button"
							data-toggle="collapse" data-target="#collapse<%=i %>"
								aria-expanded="true" aria-controls="collapse<%=i%>">
				<%
					} else {
				%>
							<button class="btn btn-link collapsed" style="color: black;"
							data-toggle="collapse" data-target="#collapse<%=i %>"
								aria-expanded="false" aria-controls="collapse<%=i%>">
				<%
					}
				%>
								<%=Lcats[i] %></button>
						</h2>
					</div>

				<% 
					if(i == 0) {
				%>
						<div id="collapse<%=i %>" class="collapse show"
					 aria-labelledby="heading<%=i %>" data-parent="#accordionExample">
				<%
					} else{
				%>
						<div id="collapse<%=i %>" class="collapse "
					 aria-labelledby="heading<%=i %>" data-parent="#accordionExample">
				<%
					}
				%>
						<div class="card-body">
							<ul>		
				<%
					for(int j = 0 ; j < numOfArticle ; j++) {
						String titles =  ynh.getNewsTitle(cse[j][2]);
				%>
								<li style="color: #007bff;"><a href="<%=cse[j][2]%>"><%=cse[j][0] %></a></li>
								<!-- 
								<li style="color: #007bff;"><a href="https://news.naver.com/main/read.nhn?mode=LS2D&mid=shm&sid1=105&sid2=230&oid=009&aid=0004476312">데이터3법 연내 통과 불투명...빅데이터 활성화 골든타임 놓치나</a></li>
								<li style="color: #007bff;"><a href="https://news.naver.com/main/read.nhn?mode=LS2D&mid=shm&sid1=105&sid2=230&oid=009&aid=0004476312">IoT 가전‧전자 기업 빅데이터 공동플랫폼 ‘담다’ 첫 공개</a></li>
								 -->
				<%
					}
				%>
							</ul>
							<p style="color: #91dffa; font-size: 15px; margin-left: 20px;">키워드 : 
							<%
							for(int k = 0 ; k < topics.length ; k++) {
								if(k > 5) break;
								out.print(topics[k] + "  ");
							}
							%>
							</p>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>

		</div>
	</div>
</div>
</div>

<script>
function active() {
	$("#menu4").addClass("menu_active");
}
</script>

</body>
</html>