<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실관리</title>
</head>
<style>
		body{
			background-image:url('https://cdn.pixabay.com/photo/2021/03/15/10/56/daffodils-6096727_960_720.jpg');
			background-repeat:no-repeat;
			background-size:100%;	
		}
        #header {
            margin: auto;
            height: 100px;
          /*  background-color: yellow; */
            display: flex;
            align-items: center;
        }
         #link {
        	width:65%;
        }
        #btns {
        	width:35%;
        }
        #header h2 {display: inline;}
        #roomlist {
            width: 40%;
            height: 500px;
          /*  background-color: rgb(177, 228, 96); */
            float: left;
        }
        #roomdetails {
            width: 40%;
            height: 500px;
          	background-color: rgb(255, 239, 185);
          	border-radius: 20px;
            float: left;
        }
        #buttons {
            display: flex;
            justify-content: center;
            padding-top: 40px;
        }
        #buttons input {
            margin: 0px 10px;
            font-size: 22px;
            text-align: center;
            width: 80px;
            height: 50px;
        }
    </style>
<body>
    <div id="header">
    	<div id="link">
    		&nbsp;&nbsp;&nbsp;
    		<h2><a href="/room">객실관리</a></h2>
    		&nbsp;&nbsp;&nbsp;
    		<h2><a href="/booking">예약관리</a></h2>
    	</div>
    	<div id="btns">
  		<p>${loginid}님<input id="logout" type="button" value="로그아웃" onclick="location.href='/logout'"></p>
  		
  	</div>
    </div>
    <div id="main">
	    <div id="roomlist">
	        <table style="padding-left: 100px;">
	            <th style="text-align: center; font-size:20px"><h3>객실목록</h3></th>
	            <tr></tr>
	            <td><select id="roomList" size="10" style="font-size: 16px; background-color: white; width: 300px; height: 400px; vertical-align:middle; text-align-last:center">
	               
	               <%--  <c:forEach items="${list}" var="room">
	                	<option value="${room.roomcode}">${room.roomname},${room.typename},${room.howmany},${room.howmuch}</option>
	                </c:forEach>  --%>            
	            </select></td>
	        </table>
	    </div>
	    <div id="roomdetails">
	        <table style="padding-left: 15px;">
	        	<th style="text-align: center; font-size:20px"><h3>객실정보입력</h3></th>
	        	<tr></tr>
	            <td><h3>객실이름</h3></td>
	            <td><input id="rname" type="text" style="font-size: 20px; width: 100px;"><input type=hidden id=roomcode></td>
	            <tr></tr>                
	            <td><h3>객실분류</h3></td>
	            <td>
	                <select id="rclass" size="5" style="font-size: 14px; width: 110px;">
	                    <c:forEach items="${rtype}" var="type">
	                		<option value="${type.typecode}">${type.name}</option>
	                	</c:forEach> 
	                </select>
	            </td>
	            <tr></tr>
	            <td><h3>숙박가능인원</h3></td>
	            <td><input id="rhowmany" type="number" style="font-size: 16px; width: 88px;">명</td>
	            <tr></tr>        
	            <td><h3>1박요금</h3></td>  
	            <td><input id="rhowmuch" type="money" style="font-size: 16px; width: 88px;">원</td>
	        </table>
	        <div id="buttons">
	            <input id="btnjoin" type="button" value="등록" style="background-color: gold;">
	            <input id="btndelete" type="button" value="삭제" style="background-color: rgb(255, 58, 58);">
	            <input id="btnreset" type="button" value="초기화" style="width: 100px; background-color: white;">
	        </div>        
	    </div>
	  </div>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
	//a=$('#roomlist option:selected')
	$(document)
	.ready(function(){
		$.post("http://localhost:8080/getRoomList",{},function(result){			
			console.log(result);
			str2='<option disabled>객실이름 | 객실종류 | 수용인원 | 1박비용 </option>'
			$('#roomList').append(str2);
			$.each(result, function(ndx,value){
				str='<option value="'+value['roomcode']+'">'+value['roomname']+','+value['typename']+','+value['howmany']+','+value['howmuch']+'</option>';
			$('#roomList').append(str);
			});
			
		},'json');
	})
	
	.on('click','#roomList option',function(){
		let b = $(this).text();
		//alert(b);
		c = b.split(',');
		$('#rname').val($.trim(c[0]));
		//$('#rclass').val(0).prop("selected",true);
		console.log('['+c[1]+']');
		$('#rclass option:contains("'+$.trim(c[1])+'")').prop('selected','selected');
		
		/* 
		c = "Suite Room";
		d = "Family Room";
		e = "Double Room";
		f = "Single Room";
		if(b[1] == c){
			$("#rclass option:eq(0)").prop("selected",true);
		} else if(b[1] == d) {
			$("#rclass option:eq(1)").prop("selected",true);
		} else if(b[1] == e) {
			$("#rclass option:eq(2)").prop("selected",true);
		} else if(b[1] == f) {
			$("#rclass option:eq(3)").prop("selected",true);
		} else {
			return false;
		} 
		*/
		$('#rhowmany').val($.trim(c[2]));
		$('#rhowmuch').val($.trim(c[3]));
		
		let d = $(this).val();
		$('#roomcode').val(d);
		return false;
	})
	.on('click','#btnreset',function(){
		$('#rname, #rclass, #rhowmany, #rhowmuch, #roomcode').val('');
		$('#roomList option:selected').prop("selected",false);
		return false;
	})
	.on('click','#btndelete',function(){
		$.post('http://localhost:8080/deleteRoom',{roomcode:$('#roomcode').val()},function(result){
			console.log(result);
			if(result=="ok"){
				$('#btnreset').trigger('click'); // 입력란 초기화, trigger : 호출해주는 효과
				$('#roomList option:selected').remove(); // 객실목록에서도 삭제
				location.reload();
			}
		},'text');
		return false;
	})
	.on('click','#btnjoin',function(){
		let roomname=$('#rname').val();
		let roomtype=$('#rclass').val();
		let howmany=$('#rhowmany').val();
		let howmuch=$('#rhowmuch').val();
		let roomcode=$('#roomcode').val();
		
		//validation(유효성검사)
		if(roomname==''||roomtype==''||howmany==''||howmuch==''){
			alert('값이 누락되었음');
			return false;
		}
		
		if(roomcode==''){ // insert
			$.post('http://localhost:8080/joinRoom',
					{roomname:roomname,roomtype:roomtype,howmany:howmany,howmuch:howmuch},
					function(result){
						if(result=='ok'){
							location.reload();
						}
					},'text');
		} else { // update
			$.post('http://localhost:8080/updateRoom',
					{roomcode:roomcode,roomname:roomname,roomtype:roomtype,howmany:howmany,howmuch:howmuch},		
					function(result){
						if(result=='ok'){
							location.reload();
						}
					},'text');
		}
	})
	.on('click','#logout',function(){
		alert('로그아웃 되었습니다');
	})
</script>
</html>