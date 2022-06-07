<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	if(id.equals("") || id.equals(null)) {
		response.sendRedirect("login.jsp");
		return;
	}
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/testdb3";
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url,"java","java");
		
		String sql = "SELECT * FROM member WHERE id = ?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		rs = pstmt.executeQuery();
		
		if(rs.next() && pass.equals(rs.getString("pass"))) {
			session.setAttribute("sessionid", id);
			response.sendRedirect("memList.jsp");
			return;
		} else {
			out.println("<script>alert('아이디 또는 비밀번호 오류');</script>");
			response.sendRedirect("login.jsp");
			return;
		}
		
	}catch(ClassNotFoundException e) {
		e.printStackTrace();
	}catch(SQLException e) {
		e.printStackTrace();
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		try {
			pstmt.close();
			conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
%>
