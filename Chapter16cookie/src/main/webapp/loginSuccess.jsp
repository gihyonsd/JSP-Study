<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	String id = request.getParameter("id");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mariaDB");
		conn = ds.getConnection();
		
		String sql = "SELECT * FROM users WHERE id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
	} catch(Exception e) {
		e.printStackTrace();
	}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보보기</title>
<style>
table {
	margin: auto;
	width: 400px;
	border: 1px solid gray;
	text-align: center;
}
</style>
</head>
<body>
	<table>
		<%while(rs.next()) { %>
		<tr>
			<td>이름 :</td>
			<td><%=rs.getString("name") %></td>
		</tr>
		<tr>
			<td>주소 :</td>
			<td><%=rs.getString("addr") %></td>
		</tr>
		<tr>
			<td>이메일 :</td>
			<td><%=rs.getString("email") %></td>
		</tr>
		<tr>
			<td>나이 :</td>
			<td><%=rs.getString("age") %></td>
		</tr>
		<% } %>
	</table>
</body>
</html>