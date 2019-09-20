package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/config.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");


String mysql_host = "localhost";
String mysql_username = "root";
String mysql_password = "";
String mysql_db = "jsp_final";


      out.write('\n');
      out.write('\n');


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


      out.write("\n");
      out.write("\n");
      out.write("<!doctype html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("    <title>ลงชื่อเข้าใช้</title>\n");
      out.write("    <link href=\"assets/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("    <link href=\"assets/css/floating-labels.css\" rel=\"stylesheet\">\n");
      out.write("\t<link href=\"assets/css/style.css\" rel=\"stylesheet\">\n");
      out.write("\t<script defer src=\"assets/js/all.js\"></script>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("    <form action=\"login.jsp\" method=\"POST\" class=\"form-signin\">\n");
      out.write("        <div class=\"text-center mb-4\">\n");
      out.write("            <i class=\"fas fa-user fa-4x mb-3\" ></i>\n");
      out.write("            <h1 class=\"h3 mb-2 font-weight-normal\">ยินดีต้อนรับ</h1>\n");
      out.write("            <p>โปรดลงชื่อเข้าใช้ เพื่อดำเนินการต่อ</p>\n");
      out.write("        </div>\n");
      out.write("\t\t");


		if (error_text != null) {
		
      out.write("\n");
      out.write("\t\t<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">\n");
      out.write("\t\t\t<i class=\"fas fa-exclamation-triangle\"></i>&nbsp; ");
      out.print(error_text);
      out.write("\n");
      out.write("\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n");
      out.write("\t\t\t\t<span aria-hidden=\"true\">&times;</span>\n");
      out.write("\t\t\t</button>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t");

		} else if (request.getParameter("registered") != null) {
		
      out.write("\n");
      out.write("\t\t<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">\n");
      out.write("\t\t\t<i class=\"fas fa-info-circle\"></i>&nbsp; สมัครผู้ใช้ใหม่สำเร็จ โปรดลงชื่อเข้าใช้\n");
      out.write("\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n");
      out.write("\t\t\t\t<span aria-hidden=\"true\">&times;</span>\n");
      out.write("\t\t\t</button>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t");

		}
		
      out.write("\n");
      out.write("        <div class=\"form-label-group\">\n");
      out.write("            <input type=\"text\" name=\"username\" id=\"username\" class=\"form-control\" placeholder=\"ชื่อผู้ใช้\" value=\"");
 if (username != null) { out.print(username); } 
      out.write("\" required ");
 if (request.getParameter("registered") == null) { out.print("autofocus"); } 
      out.write(">\n");
      out.write("            <label for=\"username\">ชื่อผู้ใช้</label>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div class=\"form-label-group\">\n");
      out.write("            <input type=\"password\" name=\"password\" id=\"password\" class=\"form-control\" placeholder=\"รหัสผ่าน\" required ");
 if (request.getParameter("registered") != null) { out.print("autofocus"); } 
      out.write(">\n");
      out.write("            <label for=\"password\">รหัสผ่าน</label>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div class=\"checkbox mb-3\">\n");
      out.write("            <label>\n");
      out.write("                <input type=\"checkbox\" name=\"remember_me\" value=\"true\" ");
 if (request.getParameter("remember_me") != null) { out.print("checked"); } 
      out.write("> จดจำบัญชีของฉัน\n");
      out.write("            </label>\n");
      out.write("        </div>\n");
      out.write("        <button class=\"btn btn-lg btn-primary btn-block\" type=\"submit\">ลงชื่อเข้าใช้</button>\n");
      out.write("\t\t<p class=\"mt-2 small text-center\">ไม่มีบัญชีผู้ใช้? <a href=\"register.jsp\">สมัครผู้ใช้ใหม่</a></p>\n");
      out.write("        <p class=\"mt-3 small text-muted text-center\">&copy; 2019 Likecyber</p>\n");
      out.write("    </form>\n");
      out.write("\t<script defer src=\"assets/js/jquery-3.4.1.min.js\"></script>\n");
      out.write("\t<script defer src=\"assets/js/bootstrap.min.js\"></script>\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
