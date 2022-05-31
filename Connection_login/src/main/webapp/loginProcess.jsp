<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
    
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	Context init = new InitialContext();
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mariaDB");
	conn = ds.getConnection();
	
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	ResultSet rs = null;
	
	String sql = "SELECT * FROM mem WHERE id=?";
	pstmt = conn.prepareStatement(sql); 
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	while(rs.next()) {
		String name = rs.getString(3); 
		if(rs.getString(1).equals(id) && rs.getString(2).equals(pass)) {
			session.setAttribute("name", name);
			session.setAttribute("id", id);
			response.sendRedirect("main.jsp");
		}
	}
	conn.close();
	pstmt.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
<script>location.href="loginForm.jsp";</script>
</body>
</html>
