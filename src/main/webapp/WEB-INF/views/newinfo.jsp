<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NewInfo</title>
</head>
<body>
<p>${newbieid}님 신규가입 환영합니다!</p>
<p>성함 : ${newbiename}</p>
<p>ID : ${newbieid}</p>
<p>PW : ${newbiepw}</p>
<p>Mobile : ${newbiemobile}</p>
<input type="button" value="돌아가기" onclick="location.href='/'">
<input type="button" value="로그인하기" onclick="location.href='/selected?path=login'">
</body>
</html>