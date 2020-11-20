<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.sql.*, java.util.*" %>
<%@page import="PProject.*"%>

<jsp:useBean id="dao" scope="application" class="PProject.DatabaseConnect" />

<!DOCTYPE html>
<html>
<head>



<meta charset="UTF-8">
<title>mypage - interest</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/css/bootstrap.min.css" integrity="sha384-SI27wrMjH3ZZ89r4o+fGIJtnzkAnFs3E4qz9DIYioCQ5l9Rd/7UAa8DHcaL8jkWt" crossorigin="anonymous">

<style>
.main {
	width: 100%;
}
.interest {
	margin: 30px 0;
}
.row {
	margin: 0 100px;
}
.delete {
	text-decoration: none;
	color: black;
	cursor: pointer;
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
				<h3>관심분야 수정</h3>
			</div>
			
			<form action="addPerCat.jsp" method="post" class="interest">
				<input type="hidden" name="p_userId" value="hoho">
				<div class="form-row">
					<div class="col">
						<select class="form-control form-control-lg" id="cat_l" name="p_Lcat">
							<option selected>대분류</option>
							<option value="IT">IT</option>
							<option value="제조">제조</option>
							<option value="화학">화학</option>
							<option value="생산">생산</option>
							<option value="서비스">서비스</option>
						</select>
					</div>
					
					<script>
					$("#cat_l").change(function() {
						$("#cat_m option[name='cat_m_op']").remove();
						$("#cat_s option[name='cat_s_op']").remove();
						
						var cat_l_text = $("#cat_l option:selected").text();
						
						//대분류 : IT 선택했을 시
						if(cat_l_text == "IT") {
							$("#cat_m").append("<option name='cat_m_op' value='게임'>게임</option>");
							$("#cat_m").append("<option name='cat_m_op' value='네트워크/통신'>네트워크/통신</option>");
							$("#cat_m").append("<option name='cat_m_op' value='모바일/APP'>모바일/APP</option>");
							$("#cat_m").append("<option name='cat_m_op' value='정보보안'>정보보안</option>");
							
							$("#cat_m").change(function() {
								$("#cat_s option[name='cat_s_op']").remove();
								
								var cat_m_text = $("#cat_m option:selected").text();
								
								if(cat_m_text == "게임"){
									$("#cat_s").append("<option name='cat_s_op' value='QA'>QA</option>");
									$("#cat_s").append("<option name='cat_s_op' value='매니저'>매니저</option>");
									$("#cat_s").append("<option name='cat_s_op' value='번역'>번역</option>");
									$("#cat_s").append("<option name='cat_s_op' value='엔지니어'>엔지니어</option>");
								}
								else if(cat_m_text == "네트워크/통신"){
									$("#cat_s").append("<option name='cat_s_op' value='Web 개발'>Web 개발</option>");
									$("#cat_s").append("<option name='cat_s_op' value='서버 엔지니어'>서버 엔지니어</option>");
									$("#cat_s").append("<option name='cat_s_op' value='연구개발'>연구개발</option>");
									$("#cat_s").append("<option name='cat_s_op' value='웹/서버/DB 개발자'>웹/서버/DB 개발자</option>");
									$("#cat_s").append("<option name='cat_s_op' value='웹개발'>웹개발</option>");
								}
								else if(cat_m_text == "모바일/APP"){
									$("#cat_s").append("<option name='cat_s_op' value='Android 개발'>Android 개발</option>");
									$("#cat_s").append("<option name='cat_s_op' value='App 개발'>App 개발</option>");
									$("#cat_s").append("<option name='cat_s_op' value='QA'>QA</option>");
									$("#cat_s").append("<option name='cat_s_op' value='클라이언트 앱 개발자'>클라이언트 앱 개발자</option>");
								}
								else if(cat_m_text == "정보보안"){
									$("#cat_s").append("<option name='cat_s_op' value='IT인프라 및 솔루션 영업'>IT인프라 및 솔루션 영업</option>");
									$("#cat_s").append("<option name='cat_s_op' value='JAVA개발자'>JAVA개발자</option>");
									$("#cat_s").append("<option name='cat_s_op' value='보안 솔루션 운영 엔지니어'>보안 솔루션 운영 엔지니어</option>");
									$("#cat_s").append("<option name='cat_s_op' value='악성코드분석'>악성코드분석</option>");
									$("#cat_s").append("<option name='cat_s_op' value='영업 기술부'>영업 기술부</option>");
								}
							}); //$("#cat_m").change 끝
						}
						//대분류 : 제조 선택했을 시
						else if(cat_l_text == "제조"){
							$("#cat_m").append("<option name='cat_m_op' value='기술'>기술</option>");
							$("#cat_m").append("<option name='cat_m_op' value='반도체'>반도체</option>");
							$("#cat_m").append("<option name='cat_m_op' value='영업'>영업</option>");
							
							$("#cat_m").change(function() {
								$("#cat_s option[name='cat_s_op']").remove();
								
								var cat_m_text = $("#cat_m option:selected").text();
								
								if(cat_m_text == "기술"){
									$("#cat_s").append("<option name='cat_s_op' value='영업'>영업</option>");
								}
								else if(cat_m_text == "반도체"){
									$("#cat_s").append("<option name='cat_s_op' value='개발'>개발</option>");
									$("#cat_s").append("<option name='cat_s_op' value='생산'>생산</option>");
									$("#cat_s").append("<option name='cat_s_op' value='조립 및 설치'>조립 및 설치</option>");
								}
								else if(cat_m_text == "영업"){
									$("#cat_s").append("<option name='cat_s_op' value='의류'>번역</option>");
								}
							}); //$("#cat_m").change 끝
						}
						//대분류 : 생산 선택했을 시
						else if(cat_l_text == "생산"){
							$("#cat_m").append("<option name='cat_m_op' value='의류'>영업</option>");
							
							$("#cat_m").change(function() {
								$("#cat_s option[name='cat_s_op']").remove();
								
								var cat_m_text = $("#cat_m option:selected").text();
								
								if(cat_m_text == "의류"){
									$("#cat_s").append("<option name='cat_s_op' value='영업'>영업</option>");
								}
							}); //$("#cat_m").change 끝
						}
						//대분류 : 화학 선택했을 시
						else if(cat_l_text == "화학"){
							$("#cat_m").append("<option name='cat_m_op' value='설계'>설계</option>");
							$("#cat_m").append("<option name='cat_m_op' value='연구'>연구</option>");
							$("#cat_m").append("<option name='cat_m_op' value='영업'>영업</option>");
							$("#cat_m").append("<option name='cat_m_op' value='제조'>제조</option>");
							$("#cat_m").append("<option name='cat_m_op' value='화장품'>화장품</option>");
							
							$("#cat_m").change(function() {
								$("#cat_s option[name='cat_s_op']").remove();
								
								var cat_m_text = $("#cat_m option:selected").text();
								
								if(cat_m_text == "설계"){
									$("#cat_s").append("<option name='cat_s_op' value='Auto CAD'>Auto CAD</option>");
								}
								else if(cat_m_text == "연구"){
									$("#cat_s").append("<option name='cat_s_op' value='개발'>개발</option>");
								}
								else if(cat_m_text == "영업"){
									$("#cat_s").append("<option name='cat_s_op' value='영업/서비스'>영업/서비스</option>");
								}
								else if(cat_m_text == "제조"){
									$("#cat_s").append("<option name='cat_s_op' value='연구'>연구</option>");
								}
								else if(cat_m_text == "화장품"){
									$("#cat_s").append("<option name='cat_s_op' value='생산'>생산</option>");
									$("#cat_s").append("<option name='cat_s_op' value='영업'>영업</option>");
								}
							}); //$("#cat_m").change 끝
						}
						//대분류 : 서비스 선택했을 시
						else if(cat_l_text == "서비스"){
							$("#cat_m").append("<option name='cat_m_op' value='스포츠, 레저'>스포츠, 레저</option>");
							$("#cat_m").append("<option name='cat_m_op' value='외식, 프랜차이즈'>외식, 프랜차이즈</option>");
							$("#cat_m").append("<option name='cat_m_op' value='호텔, 여행'>호텔, 여행</option>");
							
							$("#cat_m").change(function() {
								$("#cat_s option[name='cat_s_op']").remove();
								
								var cat_m_text = $("#cat_m option:selected").text();
								
								if(cat_m_text == "스포츠, 레저"){
									$("#cat_s").append("<option name='cat_s_op' value='관리자'>관리자</option>");
									$("#cat_s").append("<option name='cat_s_op' value='서비스 운영팀'>서비스 운영팀</option>");
									$("#cat_s").append("<option name='cat_s_op' value='유아체육 교사'>유아체육 교사</option>");
									$("#cat_s").append("<option name='cat_s_op' value='유아체육, 스포츠클럽'>유아체육, 스포츠클럽</option>");
								}
								else if(cat_m_text == "외식, 프랜차이즈"){
									$("#cat_s").append("<option name='cat_s_op' value='총무관리직'>총무관리직</option>");
									$("#cat_s").append("<option name='cat_s_op' value='홀 관리자'>홀 관리자</option>");
									$("#cat_s").append("<option name='cat_s_op' value='홀 서비스'>홀 서비스</option>");
								}
								else if(cat_m_text == "호텔, 여행"){
									$("#cat_s").append("<option name='cat_s_op' value='Houseman'>Houseman</option>");
									$("#cat_s").append("<option name='cat_s_op' value='단기계약직'>단기계약직</option>");
									$("#cat_s").append("<option name='cat_s_op' value='세일즈'>세일즈</option>");
									$("#cat_s").append("<option name='cat_s_op' value='예약 관리'>예약 관리</option>");
									$("#cat_s").append("<option name='cat_s_op' value='회계업무'>회계업무</option>");
								}
							}); //$("#cat_m").change 끝
						}
					}); //$("#cat_l").change 끝
					</script>
					
					<div class="col">
						<select class="form-control form-control-lg" id="cat_m" name="p_Mcat">
							<option selected>중분류</option>
						</select>
					</div>
					<div class="col">
						<select class="form-control form-control-lg" id="cat_s" name="p_Scat">
							<option selected>소분류</option>
						</select>
					</div>
					
					<div class="col">
						<input type="submit" class="btn btn-outline-dark btn-lg" value="추가">
					</div>
				</div>
			</form>

			<table class="table table-hover">
				<thead class="thead-light">
					<tr>
						<th scope="col">#</th>
						<th scope="col">대분류</th>
						<th scope="col">중분류</th>
						<th scope="col">소분류</th>
						<th scope="col">삭제</th>
					</tr>
				</thead>
				
				<tbody>
			<%
				ArrayList<PerCats> pdatas = (ArrayList<PerCats>)dao.getAllPerCat();
				for(PerCats p : (ArrayList<PerCats>) pdatas) {
			%>
					<tr>
						<th scope="row"><%=p.getP_id()%></th>
						<td><%=p.getP_Lcat()%></td>
						<td><%=p.getP_Mcat()%></td>
						<td><%=p.getP_Scat()%></td>
						<td id="deleteCat">
							<a href="#" class="delete" onclick="deleteCatFunction(<%=p.getP_id()%>)" data-toggle="modal" data-target="#deleteModal" title="관심분야삭제">
								<span class="far fa-times-circle fa-lg"></span>
							</a>
						</td>
					</tr>
			<%
				}
			%>
				</tbody>
			</table>

		</div>
	</div>
</div>

<script>
function active() {
	$("#menu1").addClass("menu_active");
}
</script>

<script>
function deleteCatFunction(p_id) {
    $('input[name=p_id]').val(p_id);
}
</script>


<!-- 관심분야 삭제 Modal -->
<form action="delPerCat.jsp" method="post">
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">관심분야 삭제</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">정말로 삭제 하시겠습니까?</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-primary" value="확인">
					<input type="button" class="btn btn-secondary"data-dismiss="modal" value="취소">
				</div>
				<input type="hidden" name="p_id">
			</div>
		</div>
	</div>
</form>

</body>
</html>