<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
</head>
<body>
	<form name = "frm" action="loginProcess.jsp" method="post" onsubmit = "return formCheck()">
		<fieldset>
			<legend>로그인</legend>
			<table>
				<tr>
					<td><label for="id">아이디</label></td>
					<td><input type="text" name="id" id="id" /></td>
				</tr>
				<tr>
					<td><label for="pass">비밀번호</label></td>
					<td><input type="password" name="pass" id="pass" /></td>
				</tr>
			</table>
		</fieldset>
		<input type="reset" value="다시입력">&nbsp;<input type ="submit" value = "로그인"><br>
		♣ 아이디가 없으면 <a href = "regStep1.jsp">회원가입</a>
	</form>
	<script src = "script.js"></script>
</body>
</html>