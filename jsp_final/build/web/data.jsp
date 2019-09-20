<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ include file="config.jsp" %>
<%

Object user_id = session.getAttribute("user_id");
if (user_id == null) {
	response.sendRedirect("login.jsp");
}

Connection connect = null;
Statement statement = null;

try {
	Class.forName("com.mysql.jdbc.Driver");
	connect =  DriverManager.getConnection("jdbc:mysql://" + mysql_host + "/" + mysql_db + "" +"?user=" + mysql_username + "&password=" + mysql_password);
	statement = connect.createStatement();
	ResultSet user_data = statement.executeQuery("SELECT * FROM `users` WHERE `id` = '" + user_id.toString() + "';");
	if (!user_data.next()) {
		session.removeAttribute("user_id");
		response.sendRedirect("login.jsp");
	}
}  catch (Exception e) {
	out.println(e.getMessage());
	e.printStackTrace();
}

%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>รายชื่อผู้ใช้</title>
	<link href="assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="assets/css/offcanvas.css" rel="stylesheet">
	<link href="assets/css/style.css" rel="stylesheet">
	<script defer src="assets/js/all.js"></script>
</head>

<body class="bg-light">
	<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand mb-0 h1" href="#">JSP Final</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item">
						<a class="nav-link" href="home.jsp"><i class="fas fa-home"></i>&nbsp; หน้าหลัก</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="#"><i class="fas fa-list"></i>&nbsp; รายชื่อผู้ใช้</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="map.jsp"><i class="fas fa-map-marked-alt"></i>&nbsp; แผนที่</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="about.jsp"><i class="fas fa-id-card"></i>&nbsp; ผู้จัดทำ</a>
					</li>
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a class="nav-link" href="logout.jsp"><i class="fas fa-sign-out-alt"></i>&nbsp; ออกจากระบบ</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<main role="main" class="container" >
		<h2 class="pt-1 pb-2"><i class="fas fa-list"></i>&nbsp; รายชื่อผู้ใช้</h2>
		<div class="card">
			<div class="card-body">
				<div class="table-responsive" >
					<table class="table table-bordered">
						<thead>
							<tr class="text-center" >
								<th scope="col" width="10%">ลำดับ</th>
								<th scope="col">ชื่อผู้ใช้</th>
								<th scope="col">ที่อยู่อีเมล</th>
								<th scope="col">ชื่อ-นามสกุล</th>
							</tr>
						</thead>
						<tbody>
							<%

							try {
								ResultSet result = statement.executeQuery("SELECT * FROM `users` ORDER BY `id` ASC;");
								while (result.next()) {
							%>
									<tr>
										<td class="text-center"><%=result.getString("id")%></td>
										<td><%=result.getString("username")%></td>
										<td><%=result.getString("email")%></td>
										<td><%=result.getString("name")%></td>
									</tr>
							<%
								}
							}  catch (Exception e) {
								out.println(e.getMessage());
								e.printStackTrace();
							}
							try {
								if (statement != null){
									statement.close();
									connect.close();
								}
							} catch (SQLException e) {
							}

							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>
	<p class="mt-4 small text-muted text-center">&copy; 2019 Likecyber</p>
	<script defer src="assets/js/jquery-3.4.1.min.js"></script>
	<script defer src="assets/js/bootstrap.min.js"></script>
</body>

</html>
