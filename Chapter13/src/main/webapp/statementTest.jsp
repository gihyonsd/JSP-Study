<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	Connection conn = null;
	String sql = "insert into student(num, name) value(7,'야옹이')";
	Statement stmt = null;
	
	try {
		Context context = new InitialContext();
		DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/mariaDB");
		conn = ds.getConnection();
		stmt = conn.createStatement();
		
		int result = stmt.executeUpdate(sql);
		if(result != 0) {
			out.println("레코드가 등록됐다");
		}
	} catch(Exception e) {
		out.println("레코드가 등록 실패하였다.");
		e.printStackTrace();
	}
	finally {
		try {
			stmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
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