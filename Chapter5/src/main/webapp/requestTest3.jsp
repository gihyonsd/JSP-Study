<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request Test3</title>
<style>
body {
	text-align: center;
}
</style>
</head>
<body>
	<h1>쿠키, URL/URI 요청 방식에 관련된 정보 예제</h1>
	쿠키 정보
	<%
	Cookie[] cookie = request.getCookies();
	if(cookie == null) {
	%>
	쿠키가 존재하지 않습니다.<br>
	<% } else {
	for(int i = 0; i < cookie.length; i++) {
		%>
		<%=cookie[i].getName() %>(<%=cookie[i].getValue() %>)&nbsp;&nbsp;<br>
		<%
		}
	}
%>
	서버 도메인명
	<%=request.getServerName() %><br>
	서버 포트번호
	<%=request.getServerPort() %><br>
	요청 URL
	<%=request.getRequestURL() %><br>
	요청 URI
	<%=request.getRequestURI() %><br>
	요청 쿼리
	<%=request.getQueryString() %><br>
	클라이언트 호스트명
	<%=request.getRemoteHost() %><br>
	클라이언트 IP 주소
	<%=request.getRemoteAddr() %><br>
	프로토콜
	<%=request.getProtocol() %><br>
	요청 방식
	<%=request.getMethod() %><br>
	컨텍스트 경로
	<%=request.getContextPath() %>
</body>
</html>