<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Newbie</title>
</head>
<style>
body {
	background-image:url('https://cdn.pixabay.com/photo/2020/01/14/22/46/alps-4766515_960_720.jpg');
	background-repeat:no-repeat;
	background-size:100%;	
}
#new {
	height : 400px;
	width : 400px;
	border-radius : 10%;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%,-50%);
	background: rgb(231, 238, 250);
}
h3 {
	font-size : 30px;
	text-align : center;	
}
#newbi {
	font-size : 30px;
	padding-left : 20px;
}
#btns {
	text-align : center;
}
#intro {
	font-size : 30px;
	text-align : center;
}
</style>
<body>
	<div id="intro">
		<h1>HUMAN호텔 이용객 회원가입</h1>
	</div>
	<div id="new">
		<h3>회원정보입력</h3>
		<form id="newbi" method="post" action="/goNewbie" id="fm">
			이름&nbsp;&nbsp;&nbsp;&nbsp; : <input style="width:200px;height:30px;font-size:30px;" id="nbname" type="text" name="nbname" required><br>
			ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <input style="width:200px;height:30px;font-size:30px;" id="nbid" type="text" name="nbid" required><br>
			PW&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <input style="width:195px;height:30px;font-size:30px;" id="nbpw" type="password" name="nbpw" required><br>
			PW확인 : <input style="width:200px;height:30px;font-size:30px;" id="nbpwcheck" type="password" name="nbpwcheck" required><br><br>
			<!-- 핸드폰번호 : <input type="text" name="nbmobile"><br><br> -->
			<div id="btns">
				<input style="width:150px;height:50px;font-size:30px;" type="submit" value="회원가입">
				<input style="width:100px;height:50px;font-size:30px;" type="button" value="취소" onclick="location.href='/'">
			</div>
		</form>
		
	<!-- 	<input type="button" value="로그인하기" onclick="location.href='/selected?path=login'"> -->
	</div>
</body>

<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
/* form태그의 submit을 이런식으로 처리할수 있다
.on('click','#fm',function(){
	if....
	
	....
	
	return true;  <= 이걸 처리해줘야 submit이 작동됨
})
*/
.on('blur','#nbname',function(){
	if($('#nbname').val()==''){
		alert("이름은 필수입력해야합니다");
		return false;
	}
})

.on('blur','#nbid',function(){
	if($('#nbid').val()==''){
		alert("id는 필수입력해야합니다");
		return false;
	}
})

.on('blur','#nbpw',function(){
	if($('#nbpw').val()==''){
		alert("비밀번호는 필수입력해야합니다");
		return false;
	}
})

.on('blur','#nbpwcheck',function(){
	let a = $('#nbpwcheck').val();
	let b = $('#nbpw').val();
	if(a==''){
			alert("비밀번호 확인란은 필수입력해야합니다");
			return false;
		} else if(a!='' && b != a){
			alert("비밀번호와 비밀번호 확인란이 같지 않습니다");
			$('#nbpwcheck').val('');
			return false;
		} 
})

</script>
</html>