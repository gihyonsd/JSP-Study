<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
session.setAttribute("id", request.getParameter("id"));
%>
<%
Cookie[] cookies = request.getCookies();
String id = (String) session.getAttribute("id");
int visitCount = 0;
for (Cookie cookie : cookies) {
	if (cookie.getName().equals(id)) {
		visitCount = Integer.parseInt(cookie.getValue());
	}
}
%>
<%
visitCount++;
Cookie cookie = new Cookie(id, "1");
Cookie c[] = request.getCookies();
for (int i = 0; i < c.length; i++) {
	if (c[i].getName().equals(id)) {
		cookie.setValue(Integer.toString(Integer.parseInt(c[i].getValue()) + 1));
	}
}
response.addCookie(cookie);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3><%=(String) session.getAttribute("id")%>님 반갑습니다.
	</h3>
	<h3><%=visitCount%>번째 방문입니다.
	</h3>
	<a href="logout.jsp">로그아웃</a>
</body>
</html>