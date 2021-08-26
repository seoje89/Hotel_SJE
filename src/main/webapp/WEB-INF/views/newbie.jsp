<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Newbie</title>
</head>
<body>
	<form method="get" action="/newbie">
		이름 : <input type="text" name="nbname"><br>
		ID : <input type="text" name="nbid"><br>
		PW : <input type="password" name="nbpw"><br>
		PW확인 : <input type="password" name="nbpwcheck"><br>
		핸드폰번호 : <input type="text" name="nbmobile"><br><br>
		<input type="submit" value="회원가입">
	</form>
	<input type="button" value="취소" onclick="location.href='/'">
	<input type="button" value="로그인하기" onclick="location.href='/selected?path=login'">
</body>
</html>