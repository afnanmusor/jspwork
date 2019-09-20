<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ include file="config.jsp" %>
<%

Object user_id = session.getAttribute("user_id");
if (user_id != null) {
	response.sendRedirect("home.jsp");
}

Connection connect = null;
Statement statement = null;

String error_text = null;

if ("POST".equalsIgnoreCase(request.getMethod())) {
	try {
		Class.forName("com.mysql.jdbc.Driver");
		connect =  DriverManager.getConnection("jdbc:mysql://" + mysql_host + "/" + mysql_db + "" +"?user=" + mysql_username + "&password=" + mysql_password);
		statement = connect.createStatement();
		if (!statement.executeQuery("SELECT * FROM `users` WHERE `username` = '" + request.getParameter("username") + "';").next()) {
			if (request.getParameter("password").equals(request.getParameter("confirm_password"))) {
				statement.execute("INSERT INTO `users` (`id`, `username`, `password`, `email`, `name`) VALUES (NULL, '" + request.getParameter("username") + "', '" + request.getParameter("password") + "', '" + request.getParameter("email") + "', '" + request.getParameter("name") + "');");
				response.sendRedirect("login.jsp?registered=" + request.getParameter("username"));
			} else {
				error_text = "รหัสผ่านทั้งสองช่องไม่ตรงกัน";
			}
		} else {
			error_text = "มีชื่อผู้ใช้นี้อยู่ในระบบอยู่แล้ว";
		}
	}  catch (Exception e) {
		error_text = e.getMessage();
	}
	try {
		if (statement != null){
			statement.close();
			connect.close();
		}
	} catch (SQLException e) {
	}
}

%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>สมัครผู้ใช้ใหม่</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="assets/css/floating-labels.css" rel="stylesheet">
	<link href="assets/css/style.css" rel="stylesheet">
	<script defer src="assets/js/all.js"></script>
</head>

<body>
    <form action="register.jsp" method="POST" class="form-signup">
        <div class="text-center mb-4">
            <i class="fas fa-user-plus fa-4x mb-4"></i>
            <h1 class="h3 mb-2 font-weight-normal">สมัครผู้ใช้ใหม่</h1>
        </div>
		<%

		if (error_text != null) {
		%>
		<div class="alert alert-danger alert-dismissible fade show" role="alert">
			<i class="fas fa-exclamation-triangle"></i>&nbsp; <%=error_text%>
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<%
		}

		%>
        <div class="form-label-group">
            <input type="text" name="username" id="username" class="form-control" placeholder="ชื่อผู้ใช้" value="<% if (request.getParameter("username") != null) { out.print(request.getParameter("username")); } %>" required autofocus>
            <label for="username">ชื่อผู้ใช้</label>
        </div>

		<div class="form-label-group">
            <input type="email" name="email" id="email" class="form-control" placeholder="ที่อยู่อีเมล" value="<% if (request.getParameter("email") != null) { out.print(request.getParameter("email")); } %>" required>
            <label for="email">ที่อยู่อีเมล</label>
        </div>

		<div class="form-label-group">
            <input type="text" name="name" id="name" class="form-control" placeholder="ชื่อ-นามสกุล" value="<% if (request.getParameter("name") != null) { out.print(request.getParameter("name")); } %>" required>
            <label for="name">ชื่อ-นามสกุล</label>
        </div>

        <div class="form-label-group">
            <input type="password" name="password" id="password" class="form-control" placeholder="รหัสผ่าน" required>
            <label for="password">รหัสผ่าน</label>
        </div>

		<div class="form-label-group">
            <input type="password" name="confirm_password" id="confirm_password" class="form-control" placeholder="ยืนยันรหัสผ่าน" required>
            <label for="confirm_password">ยืนยันรหัสผ่าน</label>
        </div>

        <button class="btn btn-lg btn-primary btn-block" type="submit">สมัครผู้ใช้ใหม่</button>
		<p class="mt-2 small text-center">มีบัญชีอยู่แล้ว? <a href="login.jsp">ลงชื่อเข้าใช้</a></p>
        <p class="mt-3 small text-muted text-center">&copy; 2019 Likecyber</p>
    </form>
	<script defer src="assets/js/jquery-3.4.1.min.js"></script>
	<script defer src="assets/js/bootstrap.min.js"></script>
</body>

</html>
