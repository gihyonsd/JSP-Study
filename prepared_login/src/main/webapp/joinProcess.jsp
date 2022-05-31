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
	PreparedStatement pstmt = null;
	
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/testdb3";
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url,"java","java");
		
		String sql = "INSERT INTO mem VALUES(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		pstmt.setString(3, name);
		pstmt.setInt(4,age);
		pstmt.setString(5,gender);
		pstmt.setString(6,email);
		int result = pstmt.executeUpdate();
		
		response.sendRedirect("loginForm.jsp");
	} catch(Exception e) {
		e.printStackTrace();
		response.sendRedirect("joinForm.jsp");
	} finally {
		try {
			pstmt.close();
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
%>
