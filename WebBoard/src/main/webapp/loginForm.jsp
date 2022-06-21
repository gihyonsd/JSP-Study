<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="nav.jsp" />
	<h2>로그인 페이지</h2>
	<%=request.getAttribute("loginErrMsg") == null ? "" : request.getAttribute("loginErrMsg") %>
	<%
		if(session.getAttribute("UserId") == null) { // 로그인 상태 확인
			//로그아웃 상태
	%>
	<form action="loginProcess.jsp" method="post" name="loginFrm" onsubmit="return validateForm(this);">
		아이디<input type="text" name="userid"><br>
		비밀번호<input type="password" name="passwd"><br>
		<input type="submit" value="로그인하기">
	</form>
	<% } else { //로그인한 상태 %>
	<%=session.getAttribute("UserName") %>님, 반갑습니다.<br>
	<% } %>
	<script>
		function validateForm(form) {
			if(!form.userid.value) {
				alert('아이디를 입력하시오.');
				return false;
			}
			if(form.passwd.value=='') {
				alert('비밀번호를 입력하시오.');
				return false;
			}
		}
	</script>
</body>
</html>