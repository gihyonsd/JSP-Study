<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date" %> 
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();//date객체를 이용해 현재 시간 nowTime으로 받아옴
	SimpleDateFormat st = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); //SimpleDateFormat 클래스로 date는 "yyyy/MM/dd" time은 "hh:mm:ss"로 받아옴
	String regdate = st.format(nowTime); //regdate는 현재 시간 
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String birth = request.getParameter("birth");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/testdb3";
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url,"java","java");		
		String sql = "INSERT INTO member(level, id, pass, email, phone, birth, regdate) VALUES(?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, 1); //level값은 1로 고정
		pstmt.setString(2, id);
		pstmt.setString(3, pass);
		pstmt.setString(4, email);
		pstmt.setString(5, phone);
		pstmt.setString(6, birth);
		pstmt.setString(7, regdate);
		int result = pstmt.executeUpdate();
		if(result != 0) {
			out.println("회원 등록 완료<br>");
		}
	} catch(Exception e) {
		e.printStackTrace();
		response.sendRedirect("regStep1.jsp");
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보보기</title>
<style>
table {
	margin: auto;
	width: 400px;
	border: 1px solid gray;
	text-align: center;
}
</style>
</head>
<body>
	<h3>아이디 : <%=id %></h3>
	<h3>비밀번호 : <%=pass %></h3>
	<h3>이메일 : <%=email %></h3>
	<h3>휴대번호 : <%=phone %></h3>
	<h3>생년월일 : <%=birth %></h3>
	<a href = "login.jsp">로그인</a>
<script src = "script.js"></script>
</body>
</html>