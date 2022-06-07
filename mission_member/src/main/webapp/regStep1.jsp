<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String id = request.getParameter("id");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String driver = "org.mariadb.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/testdb3";

Class.forName(driver);
conn = DriverManager.getConnection(url,"java","java");

String sql = "SELECT * FROM member";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
while(rs.next()) {
	String check = rs.getString("id");
	request.setAttribute("check", check);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
<script>
function idCheck() {
	var id1 = "${check}";
	if(id1 == frm.id.value) {
		alert("아이디가 중복입니다.");
		return false;
	} else {
		alert("사용가능한 아이디입니다.");
		return false;
	}
}
</script>
</head>
<body>
	<form name="frm" action="regStep2.jsp" method="post"
		onsubmit="return formCheckreg1()">
		<fieldset>
			<legend>회원가입 : 기본</legend>
			<table>
				<tr>
					<td><label for="id">아이디</label></td>
					<td><input type="text" name="id" id="id" /></td>
					<td><button onclick="return idCheck();">중복확인</button>
				</tr>
				<tr>
					<td><label for="pass1">비밀번호</label></td>
					<td><input type="password" name="pass1" id="pass1" /></td>
				</tr>
				<tr>
					<td><label for="pass2">비밀번호 확인</label></td>
					<td><input type="password" name="pass2" id="pass2" /></td>
				</tr>
			</table>
		</fieldset>
		<button type="reset">다시입력</button>
		<button onclick="return formCheckreg1();">다음단계</button>
		<br>
	</form>
	♣ 아이디가 있으면
	<a href="login.jsp">로그인</a>
	<script src="script.js"></script>
</body>
</html>