<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String name = (String)session.getAttribute("name");
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 시스템 메인 페이지</title>
</head>
<body>
	<h3>
		'<%=id%>'님 환영합니다.
	</h3>
	<%if(id.equals("admin")) { %>
	<a href="member_list.jsp">관리자모드 접속(회원 목록 보기)</a>
	<% } else { %>
		<h3>안녕하세요!</h3>
	<% } %>
</body>
</html>