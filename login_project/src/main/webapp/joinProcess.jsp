<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	
	Connection conn = null;
	Statement stmt = null;
	
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/testdb3";
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url,"java","java");
		stmt = conn.createStatement();
		
		String sql = "INSERT INTO member(id, pass, name, age, gender, email) VALUES('"+id+"','"+pass+"','"+name+"','"+age+"','"+gender+"','"+email+"')";
		stmt.executeQuery(sql);
		response.sendRedirect("loginForm.jsp");
	} catch(Exception e) {
		e.printStackTrace();
		response.sendRedirect("joinForm.jsp");
	}
%>
