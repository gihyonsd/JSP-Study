<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass1");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
</head>
<body>
	<form name="frm" action="regInsert.jsp" method="post" onsubmit="return formCheckreg2()">
	<input type = "hidden" name = "id" value = "<%=id %>">
	<input type = "hidden" name = "pass" value = "<%=pass %>">
	<h3>
		신청 아이디 : <%=id %>
	</h3>
		<fieldset>
			<legend>회원가입 : 상세</legend>
			<table>
				<tr>
					<td><label for="email">이메일</label></td>
					<td><input type="text" name="email" id="email" /></td>
				</tr>
				<tr>
					<td><label for="phone">휴대번호</label></td>
					<td><input type="text" name="phone" id="phone" /></td>
				</tr>
				<tr>
					<td><label for="birth"> 생년월일</label></td>
					<td><input type="date" name="birth" id="birth" /></td>
				</tr>
			</table>
		</fieldset>
		<button type = "reset">다시입력</button>
		<button onclick ="location.href='regStep1.jsp'">이전단계</button>
		<button onclick ="return formCheckreg2();">다음단계</button>
	</form>
	<script src = "script.js"></script>
</body>
</html>