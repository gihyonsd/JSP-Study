<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	if((session).getAttribute("sessionid") != null) { //세션 id가 null이 아니면
		session.removeAttribute("sessionid"); //세션에서 삭제
		response.sendRedirect("login.jsp"); //login.jsp로 이동
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src = "script.js"></script>
</body>
</html>