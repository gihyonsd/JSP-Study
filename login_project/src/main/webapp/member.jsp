<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	int level = (int)session.getAttribute("level");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<h3>
	<%if(level == 0) { %>
		<%=(String)session.getAttribute("id") %>님(<%=(String)session.getAttribute("id") %>) 반갑습니다.
	<%} else  { %>
		<%=(String)session.getAttribute("id") %>님(레벨<%=(int)session.getAttribute("level") %>) 반갑습니다. 
	<% } %>
	</h3>
	<a href="logout.jsp">Logout</a>
</body>
</html>