<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String sessionid;
	if(session.getAttribute("sessionid") != null) {
		sessionid = (String)session.getAttribute("sessionid");
		out.println("id : <strong>" + sessionid + "</strong>님 반갑습니다.");
	}
	else {
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
		
		String sql = "SELECT * FROM member";
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버리스트</title>
</head>
<body>
	<table border="1">
		<caption>회원목록</caption>
		<thead>
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이메일</th>
				<th>휴대번호</th>
				<th>생년월일</th>
				<th>등록일자</th>
			</tr>
		</thead>
		<tbody>
<%while(rs.next()) {
		String id = rs.getString("id");
		String pass = rs.getString("pass");
		String email = rs.getString("email");
		String phone = rs.getString("phone");
		String birth = rs.getString("birth");
		String regdate = rs.getString("regdate");
%>
			<tr>
				<td><%=id %></td>
				<td><%=pass %></td>
				<td><%=email %></td>
				<td><%=phone %></td>
				<td><%=birth %></td>
				<td><%=regdate %></td>
			</tr>
<%		
	}
%>
		</tbody>
	</table>
	<a href="logout.jsp">로그아웃</a>
</body>
</html>
<%
 	}
 	catch(ClassNotFoundException e) {
 		e.printStackTrace();
 	}
 	catch(SQLException e) {
 		e.printStackTrace();
 	}
 	catch(Exception e) {
 		e.printStackTrace();
 	}
 	finally {
 		try {
 			rs.close();
 			pstmt.close();
 			conn.close();
 		}
 		catch(SQLException e) {
 			e.printStackTrace();
 		}
 	} 
 
 %>