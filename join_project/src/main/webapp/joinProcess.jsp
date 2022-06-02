<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String date = request.getParameter("date");
	String email = request.getParameter("email");
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mariaDB");
		conn = ds.getConnection();
		stmt = conn.createStatement();
		String sql = "INSERT INTO memb_basic(id, password, name) VALUES('"+id+"','"+pass+"','"+name+"'); INSERT INTO memb_info(id, date, email) VALUES('"+id+"','"+date+"','"+email+"')";
		rs = stmt.executeQuery(sql);
		response.sendRedirect("loginForm.jsp");
		
	} catch(Exception e) {
		e.printStackTrace();
		response.sendRedirect("joinForm.jsp");
	} finally {
		try {
			stmt.close();
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
%>
