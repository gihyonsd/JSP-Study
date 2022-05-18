<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="beantest" class="test.BeanTest" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JavaBean Test</title>
</head>
<body>
	<b>자바빈 사용 예제</b>
	<h3><%=beantest.getName() %></h3>
</body>
</html>