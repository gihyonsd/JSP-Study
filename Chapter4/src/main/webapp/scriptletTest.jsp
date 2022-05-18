<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.util.Calendar" %>
<%
Calendar c = Calendar.getInstance();
int hour = c.get(Calendar.HOUR_OF_DAY);
int minute = c.get(Calendar.MINUTE);
int second = c.get(Calendar.SECOND);
%>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="1"> 
<title>Scriptlet Test</title>
</head>
<body>
<h1>현재 시간은 <%=hour %>시 <%=minute %>분 <%=second %>초 입니다.</h1>
</body>
</html>