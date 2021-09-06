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

<form method="post" action="/checkuser" id="fmlogin">
	ID : <input type="text" name="userid"><br>
	PW : <input type="password" name="userpw"><br><br>
	<input type="submit" value="로그인">
	<input type="button" value="취소" onclick="location.href='/'">
</form>
<a href='/newbie'>회원가입</a>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('submit','#fmlogin',function(){
	let pstr1=$.trim($('input[name=userid]').val());
	$('input[name=userid]').val(pstr1);
	
	let pstr2=$.trim($('input[name=userpw]').val());
	$('input[name=userpw]').val(pstr2);
	
	if($('input[name=userid]').val()==''){
		alert('로그인 아이디를 입력하시오');
		return false;
	}
	if($('input[name=userpw]').val()==''){
		alert('패스워드를 입력하시오');
		return false;
	}
})
</script>
</html>
