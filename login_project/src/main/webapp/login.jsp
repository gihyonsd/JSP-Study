<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	
	Connection conn = null;
	String sql = "select * from member";
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mariaDB");
		conn = ds.getConnection();
		
		String id = request.getParameter("id");
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			String name = rs.getString(2);
			int level = rs.getInt(3);
			if (rs.getString(1).equals(id) && id != null) {
				session.setAttribute("id", name);
				session.setAttribute("level", level);
				response.sendRedirect("member.jsp");
			}
			else {
			    out.print("<script>alert('없는 id 입니다.'); location.href = 'login.html';</script>");
			}
		}
	} catch (Exception e) {
		out.println("데이터 가져오기 실패");
		e.printStackTrace();
	} finally {
		try {
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>