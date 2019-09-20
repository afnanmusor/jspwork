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
try {
	if (statement != null){
		statement.close();
		connect.close();
	}
} catch (SQLException e) {
}

%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>ผู้จัดทำ</title>
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
					<li class="nav-item">
						<a class="nav-link" href="data.jsp"><i class="fas fa-list"></i>&nbsp; รายชื่อผู้ใช้</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="map.jsp"><i class="fas fa-map-marked-alt"></i>&nbsp; แผนที่</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="#"><i class="fas fa-id-card"></i>&nbsp; ผู้จัดทำ</a>
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
	<main role="main" class="container">
		<h2 class="pt-1 pb-2"><i class="fas fa-id-card"></i>&nbsp; ผู้จัดทำ</h2>
		<div class="card">
			<div class="card-body">
				<div class="row text-center pt-4">
					<div class="col-lg-4 pb-4">
						<img alt="นูรุลฮูดา เจะดือราแม" class="rounded-circle shadow" width="140" height="140" src="assets/img/nuda.jpg" />
						<h5 class="pt-4 mb-3">ผู้พัฒนาระบบ</h5>
						<h2>นูรุลฮูดา เจะดือราแม</h2>
						<p class="text-muted">รหัสประจำตัวนักศึกษา: 6139010039</p>
						<p class="pt-3"><a class="btn btn-primary" href="https://www.facebook.com/gunjames.james.5" role="button"><i class="fab fa-facebook-square"></i>&nbsp; @nuda.gunjames.james.5</a></p>
					</div>
					<div class="col-lg-4 pb-4">
						<img alt="อัฟนาน  มูซอ" class="rounded-circle shadow" width="140" height="140" src="assets/img/afnan.jpg" />
						<h5 class="pt-4 mb-3">ผู้ช่วยพัฒนาระบบ</h5>
						<h2>อัฟนาน  มูซอ</h2>
						<p class="text-muted">รหัสประจำตัวนักศึกษา: 6139010037</p>
						<p class="pt-3"><a class="btn btn-primary" href="https://www.facebook.com/thenang.indy.7" role="button"><i class="fab fa-facebook-square"></i>&nbsp; @thenang.indy.7</a></p>
					</div>
					<div class="col-lg-4 pb-4">
						<img alt="ธีระ บินกาเซ็ม" class="rounded-circle shadow" width="140" height="140" src="assets/img/teera.jpg" />
						<h5 class="pt-4 mb-3">ครูที่ปรึกษา</h5>
						<h2>ธีระ บินกาเซ็ม</h2>
						<p class="text-muted">หัวหน้าแผนกวิชา เทคโนโลยีสารสนเทศ</p>
						<p class="pt-3"><a class="btn btn-primary" href="https://www.facebook.com/BillKasem" role="button"><i class="fab fa-facebook-square"></i>&nbsp; @BillKasem</a></p>
					</div>
				</div>
			</div>
		</div>
	</main>
	<p class="mt-4 small text-muted text-center">&copy; 2019 Likecyber</p>
	<script defer src="assets/js/jquery-3.4.1.min.js"></script>
	<script defer src="assets/js/bootstrap.min.js"></script>
</body>

</html>
