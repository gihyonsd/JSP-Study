<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/testdb3";
	Class.forName(driver);
	conn = DriverManager.getConnection(url,"java","java");
	String sql = "SELECT * FROM mem";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	pstmt.close();
	conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 시스템 관리자모드(회원목록보기)</title>
<style>
	table {
		margin: auto;
		width: 400px;
		border: 1px solid gray;
		text-align: center;
	}
	.td_title {
		font-weight: bold;
		font-size: x-large;
	}
</style>
</head>
<body>
	<table>
		<tr><td colspan=2 class = "td_title">회원목록</td></tr>
		<%while(rs.next()) { %>
		<tr>
			<td>
				<a href = "member_info.jsp?id=<%=rs.getString("id") %>"><%=rs.getString("id") %></a>
			</td>
			<td>
				<a href = "member_delete.jsp?id=<%=rs.getString("id") %>">삭제</a>
			</td>
		</tr>
		<% } %>
	</table>
</body>
</html>