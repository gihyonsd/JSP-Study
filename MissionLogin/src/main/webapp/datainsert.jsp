<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String name = (String)session.getAttribute("name");
	String email = (String)session.getAttribute("email");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mariaDB");
		conn = ds.getConnection();
		
		String sql = "INSERT INTO member2 VALUES(?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
		pstmt.setString(2, name);
		pstmt.executeUpdate();
		out.println("성공");
	} catch(Exception e) {
		e.printStackTrace();
		out.println("실패");
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