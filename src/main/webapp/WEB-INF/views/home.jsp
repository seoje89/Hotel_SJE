<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<!-- <a href='selected?path=login'>관리자 로그인</a>&nbsp;&nbsp;
<a href='selected?path=newbie'>회원가입</a> -->

<form method="post" action="/checkuser">
	ID : <input type="text" name="userid"><br>
	PW : <input type="password" name="userpw"><br><br>
	<input type="submit" value="로그인">
	<input type="button" value="취소" onclick="location.href='/'">
</form>
<a href='/newbie'>회원가입</a>
</body>
</html>
