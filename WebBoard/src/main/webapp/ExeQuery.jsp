<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="common.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 목록 조회 테스트</h2>
	
	<%
		Statement stmt = null;
		ResultSet rs = null;
		
		//DB 연결
		JDBConnect1 jdbc = new JDBConnect1();
		
		//쿼리문
		String sql = "SELECT id, pass, name, regidate FROM member";
		stmt = jdbc.conn.createStatement();
		
		//쿼리 수행
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			String id = rs.getString(1);
			String pw = rs.getString(2);
			String name = rs.getString("name");
			java.sql.Date regidate = rs.getDate("regidate");
			
			out.println(String.format("%s %s %s %s", id, pw, name, regidate) + "<br>");
		}
		jdbc.close();
	%>
</body>
</html>