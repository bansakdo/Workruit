<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>

<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

<%@page import="PProject.*"%>

<jsp:useBean id="dao" scope="application" class="PProject.DatabaseConnect" />
<jsp:useBean id="bookmark" class="PProject.Bookmark"/>
<jsp:useBean id="recruit" class="PProject.Recruit"/>

<style>
.zero {
	margin: 0;
	padding: 0;
}

.title {
	margin-bottom: 10px
}

/* 채용공고 */
.recruit {
	margin: 30px 100px;
}

.card {
	border: #98C7F6 1px solid;
	border-top-width: 5px;
	border-radius: 0px;
}

.cardrow {
	margin-top: 20px;
}

.r_title {
	color: black;
	margin: 0 30px;
}

.info {
	color: black;
	margin: 10px 30px;
}

.r_footer {
	margin: 0 30px;
	font-size: 1.2em;
}

.star {
	cursor: pointer;
	color: #d9d9d9;
}

/* 업계동향 */
.trend {
	margin: 30px 100px;
}

/* figure disign */
.figure {
	width: 100%;
}
.logoa {
	margin: 30px;
}
.logoimg {
	width: auto;
	height: 80px;
	display: block;
	margin-left: auto;
	margin-right: auto;
}
.hoverimg {
	height: 100px;
	margin-left: 60%;
	margin-bottom: 10px;
}
.figure-caption {
	overflow: auto;
	overflow-x: hidden;
}

/* figure hover */
.info h5:nth-of-type(2) {
	display: none;
}
.figure:hover .info h5:first-of-type,
.figure.hover .info h5:first-of-type {
	display: none;
}
.figure:hover .info h5:nth-of-type(2),
.figure.hover .info h5:nth-of-type(2) {
	display: block;
}
</style>

<%
	User user = dao.getUser("hoho");
	/* Recruit recr; */
	Bookmark bmk = dao.getBookmark(1);
	PerCats pCat = dao.getPerCat("hoho");
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String perLcat = pCat.getP_Lcat();
	List<Recruit> recr = dao.getRecomRecr("hoho");

	Date now = new Date();
%>

<!-- 맞춤 채용공고 -->
<div class="recruit">
	<h5 class="zero title"><%=perLcat%> 분야 맞춤 채용공고</h5>

	<!-- 공고1행 -->
	<div class="card-deck zero cardrow">

	<%
	
	for(int i = 0 ; i < 4 ; i++) {
		Date endDate = recr.get(i).getR_end();
	    // 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
	    long diff = endDate.getTime() - now.getTime();
	    long diffDays = diff / (24 * 60 * 60 * 1000);

	    System.out.println("r_id : " + recr.get(i).getR_id());
	    System.out.println("r_title : " + recr.get(i).getR_title());
		if (i==0){
		%>
			<div class="card" style="padding: 0; margin: 0;">
				<figure class="figure card-body zero">
					<div class="logoa">
						<a href="recruit.jsp?r_id=<%=recr.get(i).getR_id() %>"><img src="img/com_logo/<%=recr.get(i).getR_img() %>" class="zero figure-img img-fluid logoimg" alt="..."></a>
						<input type="hidden" name="r_id" id="r_id" value="<%=recr.get(i).getR_id() %>">
					</div>
					<figcaption class="figure-caption">
						<h6 class="zero r_title"><%=recr.get(i).getR_com()%></h6>
						<div class="info">
							<h5 class="zero">
								<%=recr.get(i).getR_title() %>
							</h5>
							<h5 class="zero">
								<%=recr.get(i).getR_title() %><br>
								<span><%=recr.get(i).getR_Scat() %></span><br>
								<span><%=recr.get(i).getR_exp() %></span><br>
								<span><img onerror="this.src='https://www.dummyimage.com/350x100/ffffff/fff.png';" src="img/com_hover/<%=recr.get(i).getR_img() %>" class="zero figure-img img-fluid hoverimg" alt="..."></span>
							</h5>
						</div>
						<div class="r_footer">
							<a href="addBookmark.jsp?r_id=<%=recr.get(i).getR_id() %>" onclick="alert('즐겨찾기 추가')">
								<span class="fas fa-star star"></span>
							</a>
							<span style="margin-left: 100px;">D-<%=diffDays %></span>
							<span class="badge badge-danger" style="margin-left: 10px;">즉시지원</span>
						</div>
					</figcaption>
				</figure>
			</div>
		<%
		}
		else {
		%>
			<div class="card" style="padding: 0; margin: 0 0 0 20px;">
				<figure class="figure card-body zero">
					<div class="logoa">
						<a href="recruit.jsp?r_id=<%=recr.get(i).getR_id() %>"><img src="img/com_logo/<%=recr.get(i).getR_img() %>" class="zero figure-img img-fluid logoimg" alt="..."></a>
						<input type="hidden" name="r_id" id="r_id" value="<%=recr.get(i).getR_id() %>">
					</div>
					<figcaption class="figure-caption">
						<h6 class="zero r_title"><%=recr.get(i).getR_title()%></h6>
						<div class="info">
							<h5 class="zero">
								<%=recr.get(i).getR_title() %>
							</h5>
							<h5 class="zero">
								<%=recr.get(i).getR_title() %><br>
								<span><%=recr.get(i).getR_Scat() %></span><br>
								<span><%=recr.get(i).getR_exp() %></span><br>
								<span><img onerror="this.src='https://www.dummyimage.com/350x100/ffffff/fff.png';" src="img/com_hover/<%=recr.get(i).getR_img() %>" class="zero figure-img img-fluid hoverimg" alt="..."></span>
							</h5>
						</div>
						<div class="r_footer">
							<a href="addBookmark.jsp?r_id=<%=recr.get(i).getR_id()%>" onclick="alert('즐겨찾기 추가')">
								<span class="fas fa-star star"></span>
							</a>
							<span style="margin-left: 100px;">D-<%=diffDays%></span>
							<span class="badge badge-danger" style="margin-left: 10px;">즉시지원</span>
						</div>
					</figcaption>
				</figure>
			</div>
			<%
		}

	}
	%>
	</div>
	
	<!-- 공고2행 -->
	<div class="card-deck zero cardrow">

	<%
	
	for(int i = 4 ; i < 8 ; i++) {
		Date endDate = recr.get(i).getR_end();
	     
	    // 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
	    long diff = endDate.getTime() - now.getTime();
	    long diffDays = diff / (24 * 60 * 60 * 1000);
	    
		if (i==4){
		%>
			<div class="card" style="padding: 0; margin: 0;">
				<figure class="figure card-body zero">
					<div class="logoa">
						<a href="recruit.jsp?r_id=<%=recr.get(i).getR_id() %>"><img src="img/com_logo/<%=recr.get(i).getR_img() %>" class="zero figure-img img-fluid logoimg" alt="..."></a>
						<input type="hidden" name="r_id" id="r_id" value="<%=recr.get(i).getR_id() %>">
					</div>
					<figcaption class="figure-caption">
						<h6 class="zero r_title"><%=recr.get(i).getR_title()%></h6>
						<div class="info">
							<h5 class="zero">
								<%=recr.get(i).getR_title() %>
							</h5>
							<h5 class="zero">
								<%=recr.get(i).getR_title() %><br>
								<span><%=recr.get(i).getR_Scat() %></span><br>
								<span><%=recr.get(i).getR_exp() %></span><br>
								<span><img onerror="this.src='https://www.dummyimage.com/350x100/ffffff/fff.png';" src="img/com_hover/<%=recr.get(i).getR_img() %>" class="zero figure-img img-fluid hoverimg" alt="..."></span>
							</h5>
						</div>
						<div class="r_footer">
							<a href="aaddBookmark.jsp?r_id=<%=recr.get(i).getR_id()%>" onclick="alert('즐겨찾기 추가')">
								<span class="fas fa-star star"></span>
							</a>
							<span style="margin-left: 100px;">D-<%=diffDays%></span>
							<span class="badge badge-danger" style="margin-left: 10px;">즉시지원</span>
						</div>
					</figcaption>
				</figure>
			</div>
			
		<%
		}
		else {
			%>
			<div class="card" style="padding: 0; margin: 0 0 0 20px;">
				<figure class="figure card-body zero">
					<div class="logoa">
						<a href="recruit.jsp?r_id=<%=recr.get(i).getR_id() %>"><img src="img/com_logo/<%=recr.get(i).getR_img() %>" class="zero figure-img img-fluid logoimg" alt="..."></a>
						<input type="hidden" name="r_id" id="r_id" value="<%=recr.get(i).getR_id() %>">
					</div>
					<figcaption class="figure-caption">
						<h6 class="zero r_title"><%=recr.get(i).getR_title()%></h6>
						<div class="info">
							<h5 class="zero">
								<%=recr.get(i).getR_title() %>
							</h5>
							<h5 class="zero">
								<%=recr.get(i).getR_title() %><br>
								<span><%=recr.get(i).getR_Scat() %></span><br>
								<span><%=recr.get(i).getR_exp() %></span><br>
								<span><img onerror="this.src='https://www.dummyimage.com/350x100/ffffff/fff.png';" src="img/com_hover/<%=recr.get(i).getR_img() %>" class="zero figure-img img-fluid hoverimg" alt="..."></span>
							</h5>
						</div>
						<div class="r_footer">
							<a href="addBookmark.jsp?r_id=<%=recr.get(i).getR_id()%>" onclick="alert('즐겨찾기 추가')">
								<span class="fas fa-star star"></span>
							</a>
							<span style="margin-left: 100px;">D-<%=diffDays%></span>
							<span class="badge badge-danger" style="margin-left: 10px;">즉시지원</span>
						</div>
					</figcaption>
				</figure>
			</div>
			<%
		}

	}
	%>
	</div>
	
</div>

<!-- 관심분야 동향 -->
<div class="trend">
	<h5 class="zero title"><%=perLcat %>분야 업계동향</h5>
	<%
		Ynh news = new Ynh();
		String[][] searchedNews = news.customSearch(perLcat, 10);			//[index][title, context, url]
		
	%>
	<ul class="list-group list-group-flush"> 
		<%for(int i = 0 ; i < 10 ; i++) { %>
		<li class="list-group-item"><a href="<%=searchedNews[i][2]%>"><%=searchedNews[i][0]%></a></li>
		<%} %>
	</ul>
</div>

<script>
$(".hover").mouseover(function() {
	$(this).addClass("hover");
});
$(".hover").mouseleave(function() {
	$(this).removeClass("hover");
});
</script>