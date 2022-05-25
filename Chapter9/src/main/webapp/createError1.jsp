<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		if(name == null) {
			throw new NullPointerException(); //null일시 예외처리 발생 null이란 아무것도 없음을 의미
											  //모든 참조유형에 대한 기본값은 null
											  //null은 유효한 객체 인스턴스가 아니므로 할당 되는 메모리가 없다.
		}
	%>
</body>
</html>