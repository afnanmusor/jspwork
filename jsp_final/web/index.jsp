<%

Object user_id = session.getAttribute("user_id");
if (user_id != null) {
	response.sendRedirect("home.jsp");
} else {
	response.sendRedirect("login.jsp");
}

%>
