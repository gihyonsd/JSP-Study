<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
	<% response.setStatus(200); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
img {
	width: 50px;
	height: 50px;
	float: left;
}
</style>
</head>
<body>
	발생한 예외 종류 :
	<%=exception.getClass().getName()%>
	<img src="error.png">
</body>
</html>