<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String id = request.getParameter("id");
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		String driver = "org.mariadb.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/testdb3";
		Class.forName(driver);
		conn = DriverManager.getConnection(url,"java","java");
		stmt = conn.createStatement();
		String sql = "DELETE FROM member WHERE id='"+id+"'";
		rs = stmt.executeQuery(sql);
		
		response.sendRedirect("member_list.jsp");
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		try {
			stmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
%>
