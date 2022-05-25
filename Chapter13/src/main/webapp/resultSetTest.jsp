<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>

<%
	Connection conn = null;
	String sql = "select * from student";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mariaDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			out.println("<h3>"+rs.getInt(1)+","+rs.getString(2)+"</h3>");
		}
	} catch(Exception e) {
		out.println("데이터 가져오기에 실패하였습니다.");
		e.printStackTrace();
	} finally {
		try {
			rs.close();
			pstmt.close();
			conn.close();
		}
		catch(Exception e) {
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