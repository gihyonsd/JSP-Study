<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.JDBConnect1" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 추가 테스트</h2>
	<%
	PreparedStatement pstmt = null;
	
	//DB 연결
	JDBConnect1 jdbc = new JDBConnect1();
	
	//테스트용 입력값
	String id = "test1";
	String pass = "1111";
	String name = "테스트 회원1";
	
	//쿼리문
	String sql = "INSERT INTO member VALUES(?,?,?,sysdate)";
	pstmt = jdbc.conn.prepareStatement(sql);
	pstmt.setString(1,id);
	pstmt.setString(2, pass);
	pstmt.setString(3, name);
	
	//쿼리 수행
	int result = pstmt.executeUpdate();
	out.println(result + "행이 입력되었습니다.");
	
	jdbc.close();
	%>
</body>
</html>