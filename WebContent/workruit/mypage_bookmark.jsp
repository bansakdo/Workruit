<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.sql.*, java.util.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="PProject.*"%>

<jsp:useBean id="dao" scope="application" class="PProject.DatabaseConnect" />

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

.booklist {
	margin-top: 30px;
}

.bookmark {
	color: #ffd700;
	cursor: pointer;
}

.pagination {
	margin-top: 50px;
}
</style>
</head>

<body onload="active()">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<script src="https://kit.fontawesome.com/733ba69ffe.js" crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/releases/v5.12.0/js/all.js" data-search-pseudo-elements></script>
<script src="https://use.fontawesome.com/releases/v5.12.0/js/all.js" data-auto-replace-svg="nest"></script>

<div class="main">
	<jsp:include page="inc_header.jsp" flush="false" />
	<jsp:include page="inc_navbar.jsp" flush="false" />

	<div class="row">
		<div class="col-3">
			<jsp:include page="mypage_inc_menu.jsp" flush="false" />
		</div>

		<div class="col-9">
			<div class="page-header" style="margin-top: 30px;">
				<h3>즐겨찾기 목록</h3>
			</div>

			<table class="table table-hover booklist">
				<thead class="thead-light">
					<tr>
						<th scope="col">#</th>
						<th scope="col">직종</th>
						<th scope="col">제목</th>
						<th scope="col">회사명</th>
						<th scope="col">마감일</th>
						<th scope="col"><span class="fas fa-star bookmark"></span></th>
					</tr>
				</thead>
				
				<tbody>

			<%
				
				ArrayList<Recruit> datas = (ArrayList<Recruit>)dao.getBookmarkRecruit("hoho");
				for(Recruit r : (ArrayList<Recruit>) datas) {
					
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			%>

					<tr>
						<th scope="row"><%=r.getR_id()%></th>
						<td><%=r.getR_Mcat()%></td>
						<td><%=r.getR_title()%></td>
						<td><%=r.getR_com()%></td>
						<td><%=dateFormat.format(r.getR_end())%></td>
						<td id="deleteBook">
							<a href="#" class="delete" onclick="delBookmarkFunction(<%=Integer.parseInt(r.getR_img())%>)" data-toggle="modal" data-target="#delBookModal" title="즐겨찾기 해제">
								<span class="fas fa-star bookmark"></span>
							</a>
						</td>
					</tr>
					
			<%
				}
			%>
				</tbody>
			</table>

			<ul class="pagination justify-content-center">
				<li class="page-item disabled"><a class="page-link" href="#"><</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">></a></li>
			</ul>

		</div>
	</div>
</div>

<script>
function active() {
	$("#menu2").addClass("menu_active");
}
</script>

<script>
function delBookmarkFunction(b_id) {
    $('input[name=b_id]').val(b_id);
}
</script>


<!-- 관심분야 삭제 Modal -->
<form action="delBookmark.jsp" method="post">
	<div class="modal fade" id="delBookModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">즐겨찾기를 해제하시겠습니까?</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">즐겨찾기를 해제하시면 해당 공고와 관련한 일정은<br>캘린더에서 모두 삭제됩니다.</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-primary" value="확인">
					<input type="button" class="btn btn-secondary"data-dismiss="modal" value="취소">
				</div>
				<input type="hidden" name="b_id">
			</div>
		</div>
	</div>
</form>

</body>
</html>