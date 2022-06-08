<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");

if (request.getHeader("refer") == null || id.equals("") || id.equals(null)) { //임의접속방지
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
	conn = DriverManager.getConnection(url, "java", "java");

	String sql = "SELECT * FROM member WHERE id = ?";

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);

	rs = pstmt.executeQuery();

	if (rs.next() && pass.equals(rs.getString("pass"))) { //데이터베이스에 데이터가 있고 비밀번호와 데이터베이스에서 받아온 비밀번호가 같을 경우
		session.setAttribute("sessionid", id); // id를 sessionid로 세션으로 받음
		session.setAttribute("level", rs.getInt("level")); //level을 세션으로 받아서 memList에서 처리
		response.sendRedirect("memList.jsp"); //memList.jsp로 이동
		return;
	} else {
		out.print("<script>alert('id또는 비밀번호가 틀립니다.'); location.href = 'login.jsp';</script>"); //아이디 비밀번호가 다를 시 script로 alert창을 띄우고 login.jsp로 이동
		return;
	}

} catch (ClassNotFoundException e) {
	e.printStackTrace();
} catch (SQLException e) {
	e.printStackTrace();
} catch (Exception e) {
	e.printStackTrace();
} finally {
	try {
		pstmt.close();
		conn.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}

}
%>
