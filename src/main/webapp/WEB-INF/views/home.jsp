<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<style>
body {
	background-image:url('https://cdn.pixabay.com/photo/2021/03/15/10/56/daffodils-6096727_960_720.jpg');
	background-repeat:no-repeat;
	background-size:100%;	
}
#startpage {
	height : 400px;
	width : 400px;
	border-radius : 10%;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%,-50%);
	background: rgb(231, 238, 250);
}
#intro {
	font-size : 30px;
	text-align : center;
}
h3 {
	font-size : 30px;
	text-align : center;
	
}
#login {
	font-size : 30px;
	text-align : center;
	
}
#newbi {
	font-size : 20px;
	text-align : center;
}
</style>
<body>
<div id=intro>
	<h1>HUMAN호텔 관리 프로그램</h1>
</div>
<div id=startpage>
	<!-- <a href='selected?path=login'>관리자 로그인</a>&nbsp;&nbsp;
	<a href='selected?path=newbie'>회원가입</a> -->
	<h3>로그인하기</h3>
	<form id=login method="post" action="/checkuser" id="fmlogin">
		ID : <input style="width:200px;height:30px;font-size:20px;" type="text" name="userid" required><br>
		PW : <input style="width:190px;height:30px;font-size:20px;" type="password" name="userpw" required><br><br>
		<input style="width:120px;height:50px;font-size:30px;" type="submit" value="로그인">
		<input style="width:100px;height:50px;font-size:30px;" type="button" value="취소" onclick="location.href='/'">
	</form>
	<div id=newbi>
		<a href='/newbie'>회원가입</a>
	</div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('submit','#fmlogin',function(){
	if($('input[name=userid]').val()==''){
		alert('로그인 아이디를 입력하시오');
		return false;
	}
	if($('input[name=userpw]').val()==''){
		alert('패스워드를 입력하시오');
		return false;
		
	let pstr1=$.trim($('input[name=userid]').val());
	$('input[name=userid]').val(pstr1);
	
	let pstr2=$.trim($('input[name=userpw]').val());
	$('input[name=userpw]').val(pstr2);
	
	}
})
</script>
</html>
