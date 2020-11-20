<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="PProject.*"%>

<jsp:useBean id="dao" scope="application" class="PProject.DatabaseConnect" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage - calendar</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/css/bootstrap.min.css" integrity="sha384-SI27wrMjH3ZZ89r4o+fGIJtnzkAnFs3E4qz9DIYioCQ5l9Rd/7UAa8DHcaL8jkWt" crossorigin="anonymous">
<link href='/PProject/assets/fullcalendar-4.3.1/packages/core/main.css' rel='stylesheet' />
<link href='/PProject/assets/fullcalendar-4.3.1/packages/daygrid/main.css' rel='stylesheet' />

<style>
.main {
	width: 100%;
}
.row {
	margin: 0 100px;
}

#calendar {
    width: 80%;
    margin: 30px 0;
  }
</style>
</head>

<body onload="active()">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<script src='/PProject/assets/fullcalendar-4.3.1/packages/core/main.js'></script>
<script src='/PProject/assets/fullcalendar-4.3.1/packages/interaction/main.js'></script>
<script src='/PProject/assets/fullcalendar-4.3.1/packages/daygrid/main.js'></script>

<div class="main">
	<jsp:include page="inc_header.jsp" flush="false"/>
	<jsp:include page="inc_navbar.jsp" flush="false" />
	
	<div class="row">
		<div class="col-3">
			<jsp:include page="mypage_inc_menu.jsp" flush="false"/>
		</div>
		
		<div class="col-9">
			<div class="page-header" style="margin-top: 30px;">
				<h3>일정관리</h3>
			</div>
			
			<div id="calendar"></div>
			
			<%
			request.setCharacterEncoding("utf-8");
			
			String[][] results = null;
			String[][] per_results = null;
			
			int numOfRst = 0;
			int numOfPst = 0;
			
			String dbUrl = "jdbc:mysql://localhost:3306/pproj?characterEncoding=UTF-8&serverTimezone=UTC";
			Class.forName("com.mysql.jdbc.Driver");
			
			String sql = "select b_id, b_recruitId, r_com, r_start, r_end from recruit LEFT JOIN bookmark ON recruit.r_id = bookmark.b_recruitId where bookmark.b_userId=? order by b_recruitId asc";
			String sql2 = "select * from persche";
			
			try {
				Connection conn = DriverManager.getConnection(dbUrl, "root","gachon654321");
				PreparedStatement pstmt = null;
				PreparedStatement pstmt2 = null;
				ResultSet rs = null;
				ResultSet rs2 = null;
				
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				
				//즐겨찾기한 공고 불러오기
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "hoho");
				rs = pstmt.executeQuery();
				rs.last();
				numOfRst = rs.getRow();
				rs.beforeFirst();
				int i = 0;
				results = new String[numOfRst][5];
				while(rs.next()) {
					results[i][0] = String.valueOf(rs.getInt("b_id"));
					results[i][1] = String.valueOf(rs.getInt("b_recruitId"));
					results[i][2] = rs.getString("r_com");
					results[i][3] = dateFormat.format(rs.getTimestamp("r_start"));
					results[i][4] = dateFormat.format(rs.getTimestamp("r_end"));
					i++;
				}
				
				//개인 일정 불러오기
				pstmt2 = conn.prepareStatement(sql2);
				rs2 = pstmt2.executeQuery();
				rs2.last();
				numOfPst = rs2.getRow();
				rs2.beforeFirst();
				int a = 0;
				per_results = new String[numOfPst][5];
				while(rs2.next()) {
					per_results[a][0] = String.valueOf(rs2.getInt("ps_id"));
					per_results[a][1] = rs2.getString("ps_title");
					per_results[a][2] = rs2.getString("ps_content");
					per_results[a][3] = rs2.getString("ps_start");
					per_results[a][4] = rs2.getString("ps_end");
					a++;
				}
				
				
			%>
			<!-- 즐겨찾기한 공고 불러오기 -->
				<select id="b_id" name="b_id" style="display:none;">
			<%
					for(int j = 0 ; j < numOfRst ; j++) {
						%>
						<option value="<%=results[j][0]%>"><%=results[j][0]%></option>
						<%
					}
			%>
				</select>
				<select id="r_id" name="r_id" style="display:none;">
			<%
					for(int j = 0 ; j < numOfRst ; j++) {
						%>
						<option value="<%=results[j][1]%>"><%=results[j][1]%></option>
						<%
					}
			%>
				</select>
				<select id="com" name="com" style="display:none;">
			<%
					for(int j = 0 ; j < numOfRst ; j++) {
						%>
						<option value="<%=results[j][2]%>"><%=results[j][1]%></option>
						<%
					}
			%>
				</select>
				<select id="start" name="start" style="display:none;">
			<%
					for(int j = 0 ; j < numOfRst ; j++) {
						%>
						<option value="<%=results[j][3]%>"><%=results[j][1]%></option>
						<%
					}
			%>
				</select>
				<select id="end" name="end" style="display:none;">
			<%
					for(int j = 0 ; j < numOfRst ; j++) {
						%>
						<option value="<%=results[j][4]%>"><%=results[j][1]%></option>
						<%
					}
			%>
				</select>
			<!-- 즐겨찾기한 공고 불러오기 끝-->
			
			<!-- 개인 일정 불러오기 -->
				<select id="ps_id" name="ps_id" style="display:none;">
			<%
					for(int b = 0 ; b < numOfPst ; b++) {
						%>
						<option value="<%=per_results[b][0]%>"><%=per_results[b][0]%></option>
						<%
					}
			%>
				</select>
				<select id="ps_title" name="ps_title" style="display:none;">
			<%
					for(int b = 0 ; b < numOfPst ; b++) {
						%>
						<option value="<%=per_results[b][1]%>"><%=per_results[b][1]%></option>
						<%
					}
			%>
				</select>
				<select id="ps_content" name="ps_content" style="display:none;">
			<%
					for(int b = 0 ; b < numOfPst ; b++) {
						%>
						<option value="<%=per_results[b][2]%>"><%=per_results[b][1]%></option>
						<%
					}
			%>
				</select>
				<select id="ps_start" name="ps_start" style="display:none;">
			<%
					for(int b = 0 ; b < numOfPst ; b++) {
						%>
						<option value="<%=per_results[b][3]%>"><%=per_results[b][1]%></option>
						<%
					}
			%>
				</select>
				<select id="ps_end" name="ps_end" style="display:none;">
			<%
					for(int b = 0 ; b < numOfPst ; b++) {
						%>
						<option value="<%=per_results[b][4]%>"><%=per_results[b][1]%></option>
						<%
					}
			%>
				</select>
			<!-- 개인 일정 불러오기 끝-->
		<%
			pstmt.close();
			pstmt2.close();
			rs.close();
			rs2.close();
	        conn.close();

        } catch(SQLException e) {
			out.print(e.toString());
        }
		%>
		</div>
	</div>
</div>

<!-- 개인 일정 추가 Modal 불러오기용 -->
<input type="hidden" class="btn btn-primary" data-toggle="modal" data-target="#addPerModal">

<!-- 개인 일정 추가 Modal -->
<form method="post" action="addPerSche.jsp">
	<div class="modal fade" role="dialog" id="addPerModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">일정 추가</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
					<div class="form-group">
						<label for="ps_title">일정</label>
						<input type="text" class="form-control" id="ps_title" name="ps_title">
					</div>

					<div class="form-group">
						<label for="ps_start">시작 날짜</label>
						<input type="date" class="form-control" id="ps_start" name="ps_start">
					</div>
					
					<div class="form-group">
						<label for="ps_end">끝나는 날짜</label>
						<input type="date" class="form-control" id="ps_end" name="ps_end">
					</div>

					<div class="form-group">
						<label for="ps_content">내용</label>
						<input type="text" class="form-control" id="ps_content" name="ps_content">
					</div>
				</div>
				
				<div class="modal-footer">
					<input type="submit" class="btn btn-primary" value="확인">
					<input type="button" class="btn btn-secondary" data-dismiss="modal" value="취소">
				</div>
			</div>
		</div>
	</div>
</form>

<script>

function active() {
	$("#menu3").addClass("menu_active");
}
</script>

<script>
document.addEventListener('DOMContentLoaded', function() {
	//오늘날짜 표시
	var now = new Date();
	var yyyy = now.getFullYear();
	var MM = now.getMonth()+1;
	var dd = now.getDate();
	var today = yyyy+"-"+MM+"-"+dd;
	if(dd<10) {
		today = yyyy+"-"+MM+"-0"+dd;
	}
	//$("#seldate").val(today);
	
	var calendarEl = document.getElementById('calendar');

	var calendar = new FullCalendar.Calendar(calendarEl, {
		plugins : [ 'interaction', 'dayGrid' ],
		locale: 'ko',
		editable : true,
		eventLimit : true, // allow "more" link when too many events
		
		dateClick: function(info) {
			var clickday = info.dateStr;
	        //alert('clicked ' + clickday);
	        //info.dayEl.style.backgroundColor = 'red';
	        //$('#seldate').val(clickday);
	        
	        /* var dateCon = prompt('일정을 입력하세요.');
	        addPerSche(dateCon, clickday); */
	    },
	    
	    select: function(info) {
	    	alert('selected ' + info.startStr + ' to ' + info.endStr);
	    },
	    
	    header: {
	        right: 'addEventButton today prev,next'
	    },
	    
	    customButtons: {
	    	 addEventButton: {
	    		 text: '일정 추가',
	    		 click: function() {
	    			 $('#addPerModal').modal('show');
	    		 }
	    	 }
	    },
		
		events : [
			{
			title : '설계서',
			start : '2019-12-04',
			color : '#E5FBDB'
			}
		]
	    
	});
	
	//개인 일정 추가
    var addPerSche = function(dateCon, clickday) {
    	if(dateCon != "" && dateCon != null) {

			console.log("dateCon : " + dateCon);
	    	calendar.addEvent({
		        title: dateCon,
		        start: clickday,
		        color: '#E5FBDB',
		        allDay: true
	   	 	});
	    	
 			$("#ps_title").val(dateCon);
 			$("#ps_start").val(clickday);
 			$("#ps_end").val(clickday);
 			
 			/* var scheform = document.getElementById("scheform");
 			$("scheform").submit(); */
 			
			/* document.ps_title = dateCon;
			document.ps_start = clickday;
			document.ps_end = clickday;
			console.log("ps_title : " + document.ps_title);
			console.log("ps_end : " + document.ps_end);
			console.log("clickday : " + clickday); */
			//document.selform.submit();
			//document.getElementById('scheform').submit();
    	}
    }
	
	var addSche = function() {
		//달력에 마크추가 - 즐겨찾기한 공고
		var bidArray = document.getElementById('b_id').options;
		var bArray = [];
		var ridArray = document.getElementById('r_id').options;
		var rArray = [];
		var comArray = document.getElementById('com').options;
		var cArray = [];
		var startArray = document.getElementById('start').options;
		var sArray = [];
		var endArray = document.getElementById('end').options;
		var eArray = [];
		
		for(var i=0; i<bidArray.length; i++){
			bArray[i] = bidArray[i].value;
			rArray[i] = ridArray[i].value;
			cArray[i] = comArray[i].value;
			sArray[i] = startArray[i].value;
			eArray[i] = endArray[i].value;
			
			//alert(bArray[i] + rArray[i] + cArray[i] + sArray[i] + eArray[i]);
			calendar.addEvent({
		          title: cArray[i],
		          start: sArray[i],
		          end: eArray[i],
		          color: '#98C7F6',
		          allDay: true
		    });
		}
		
		//달력에 마크추가 - 개인 일정
		var psidArray = document.getElementById('ps_id').options;
		var piArray = [];
		var pstArray = document.getElementById('ps_title').options;
		var ptArray = [];
		var pscArray = document.getElementById('ps_content').options;
		var pcArray = [];
		var pstartArray = document.getElementById('ps_start').options;
		var psArray = [];
		var pendArray = document.getElementById('ps_end').options;
		var peArray = [];
		
		for(var i=0; i<psidArray.length; i++){
			piArray[i] = psidArray[i].value;
			ptArray[i] = pstArray[i].value;
			pcArray[i] = pscArray[i].value;
			psArray[i] = pstartArray[i].value;
			peArray[i] = pendArray[i].value;
			
			calendar.addEvent({
		          title: ptArray[i],
		          start: psArray[i],
		          end: peArray[i],
		          color: '#E5FBDB',
		          allDay: true
		    });
		}
    }

	addSche();
	calendar.render();
});
</script>

</body>
</html>