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

String username = null;
if (request.getParameter("registered") != null) {
	username = request.getParameter("registered");
}
if (request.getParameter("username") != null) {
	username = request.getParameter("username");
}

Connection connect = null;
Statement statement = null;

String error_text = null;

if ("POST".equalsIgnoreCase(request.getMethod())) {
	try {
		Class.forName("com.mysql.jdbc.Driver");
		connect =  DriverManager.getConnection("jdbc:mysql://" + mysql_host + "/" + mysql_db + "" +"?user=" + mysql_username + "&password=" + mysql_password);
		statement = connect.createStatement();
		ResultSet result = statement.executeQuery("SELECT * FROM `users` WHERE `username` = '" + request.getParameter("username") + "' AND `password` = '" + request.getParameter("password") + "';");
		if (result.next()) {
			session.setAttribute("user_id", result.getString("id"));
			if (request.getParameter("remember_me") != null) {
				session.setMaxInactiveInterval(86400);
			} else {
				session.setMaxInactiveInterval(900);
			}
			response.sendRedirect("home.jsp");
		} else {
			error_text = "ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง";
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
    <title>ลงชื่อเข้าใช้</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/floating-labels.css" rel="stylesheet">
	<link href="assets/css/style.css" rel="stylesheet">
	<link rel="stylesheet" href="assets/css/master.css">
	<script defer src="assets/js/all.js"></script>
</head>

<body>
	<div class="login-box">
		<img src="assets/img/logo.png" class="avatar" alt="Avatar Image">
		<h1>Login</h1>
		<form action="login.jsp" method="POST">
		  <!-- USERNAME INPUT -->
		  <label for="username">Username</label>
		  <input type="text" name="username" id="username" placeholder="Enter Username" value="<% if (username != null) { out.print(username); } %>" required <% if (request.getParameter("registered") == null) { out.print("autofocus"); } %>>
		  <!-- PASSWORD INPUT -->
		  <label for="password">Password</label>
		  <input type="password" name="password" id="password" placeholder="Enter Password" required <% if (request.getParameter("registered") != null) { out.print("autofocus"); } %>>
		  <input type="submit" value="Log In">
		  <a  href="register.jsp">Don't have An account</a>
		</form>
	  </div>
	<script defer src="assets/js/jquery-3.4.1.min.js"></script>
	<script defer src="assets/js/bootstrap.min.js"></script>
</body>

</html>
