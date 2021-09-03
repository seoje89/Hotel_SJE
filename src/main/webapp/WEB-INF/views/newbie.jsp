<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Newbie</title>
</head>
<body>
	<form method="post" action="/goNewbie" id="fm">
		이름 : <input id="nbname" type="text" name="nbname" required><br>
		ID : <input id="nbid" type="text" name="nbid" required><br>
		PW : <input id="nbpw" type="password" name="nbpw" required><br>
		PW확인 : <input id="nbpwcheck" type="password" name="nbpwcheck" required><br><br>
		<!-- 핸드폰번호 : <input type="text" name="nbmobile"><br><br> -->
		<input type="submit" value="회원가입">
	</form>
	<input type="button" value="취소" onclick="location.href='/'">
<!-- 	<input type="button" value="로그인하기" onclick="location.href='/selected?path=login'"> -->
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