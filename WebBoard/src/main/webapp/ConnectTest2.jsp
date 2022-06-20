<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.JDBConnect2" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String driver = application.getInitParameter("OracleDriver");
	String url = application.getInitParameter("OracleURL");
	String id = application.getInitParameter("OracleID");
	String passwd = application.getInitParameter("OraclePasswd");
	
	JDBConnect2 jdbc2 = new JDBConnect2(driver, url, id, passwd);
	jdbc2.close();
%>
</body>
</html>

