<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	Connection conn = null;
	String sql = "insert into student(num, name) value(?,'야옹이')";
	PreparedStatement pstmt = null;
	
	try {
		Context context = new InitialContext();
		DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/mariaDB");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement(sql);
		
		for(int i = 8; i <= 11; i++) {
			pstmt.setInt(1, i);
			if(pstmt.executeUpdate() != 0) {
				out.println(i+" 번 레코드를 등록하였습니다");
			}
		}
	} catch(Exception e) {
		out.println("레코드 등록에 실패하였습니다.");
		e.printStackTrace();
	}
	finally {
		try {
			pstmt.close();
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