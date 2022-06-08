<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String id = request.getParameter("id");	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/testdb3";
	Class.forName(driver);
	conn = DriverManager.getConnection(url,"java","java");
	String sql = "SELECT * FROM member WHERE id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(rs.next()) { %>
	<script>
	alert('중복입니다.')
	location.href = "regStep1.jsp"
	</script>
	<% } else { %>
	<script>
	alert('사용가능한 아이디 입니다.')
	location.href = "regStep1.jsp"
	</script>
	<% } %>
</body>
</html>