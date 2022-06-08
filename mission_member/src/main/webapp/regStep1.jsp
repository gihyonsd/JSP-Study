<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
<script>
	function submit2(frm) { //폼에서 액션 경로를 여러개 사용하기 위한 함수
		frm.action = 'check.jsp'; //두번째로 보낼 경로 아이디 중복 체크하는 부분
		frm.submit();
		return false;
	}
</script>
</head>
<body>
	<form name="frm" action="regStep2.jsp" method="post"
		onsubmit="return formCheckreg1()" id="join">
		<fieldset>
			<legend>회원가입 : 기본</legend>
			<table>
				<tr>
					<td><label for="id">아이디</label></td>
					<td><input type="text" name="id" id="id" /><input type="hidden" id="con" value="0"></td>
					<td><button onclick="return submit2(this.form);">중복확인</button>		
						<!-- 중복확인 버튼을 누르면 check.jsp로 이동하여 아이디 중복 검사 -->
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
