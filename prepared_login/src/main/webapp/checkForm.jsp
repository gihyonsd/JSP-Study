<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.check {
	margin:0 auto;
	width: 400px;
	}
	input {
	margin: 10px;
	}
</style>
</head>
<body>
	<form action = "check.jsp" method="post">
 	<div class = "check">
 	아이디 : 
	<input type = "text" name = "id" id = "id"><input type="submit" value = "중복체크">
	</div>
	</form>
</body>
</html>