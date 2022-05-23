<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String day = "day";
String cookie = request.getHeader("Cookie");

if (cookie != null) {
	Cookie cookies[] = request.getCookies();

	for (int i = 0; i < cookies.length; i++) {
		if (cookies[i].getName().equals("day")) {
	day = cookies[i].getValue();
		}
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 이용한 화면 설정 예제</title>
</head>
<style>
<%if (day.equals("day")) {%> body { background-color :white;
	color: black;
}

<%} else {%> body { background-color :black;
	color: white;
}
<%}%>
</style>
<body>
	<%
	if (day.equals("day")) {
	%>
	<h3>낮 모드</h3>
	<%
	} else {
	%>
	<h3>밤 모드</h3>
	<%
	}
	%>

	<form action="daynight2.jsp" method="post">
		<input type="radio" name="day" value="day"
			<%if (day.equals("day")) {%> checked <%}%>> 낮 <input
			type="radio" name="day" value="night" <%if (day.equals("night")) {%>
			checked <%}%>> 밤 <input type="submit" value="설정">
	</form>
</body>
</html>