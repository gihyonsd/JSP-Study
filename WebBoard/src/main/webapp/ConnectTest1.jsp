<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "common.JDBConnect1" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	JDBConnect1 jdbc1 = new JDBConnect1();
	jdbc1.close();
%>
</body>
</html>