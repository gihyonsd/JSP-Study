<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>   
    
<%
	Connection conn = null;
	Statement stmt = null;
	
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/testdb3";
	
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	ResultSet rs = null;
	Class.forName(driver);
	conn = DriverManager.getConnection(url,"java","java");
	stmt = conn.createStatement();
	
	String sql = "SELECT * FROM member";
	rs = stmt.executeQuery(sql);
	while(rs.next()) {
		String name = rs.getString(3);
		if(id.equals(rs.getString(1)) && pass.equals(rs.getString(2))) {
			session.setAttribute("name", name);
			response.sendRedirect("main.jsp");
		} else {
			response.sendRedirect("loginForm.jsp");
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>