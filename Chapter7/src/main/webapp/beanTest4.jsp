<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="beantest" class="test.BeanTest2" scope="page"></jsp:useBean>
<jsp:setProperty name="beantest" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>자바빈 속성 값 출력</h1>
	<b>이름 : </b><%=beantest.getName()%>
	<b>주소 : </b><%=beantest.getAddr()%>
	<b>이메일 주소 : </b><%=beantest.getEmail()%>
	<b>생년 월일 : </b><%=beantest.getBirthday()%>
</body>
</html>