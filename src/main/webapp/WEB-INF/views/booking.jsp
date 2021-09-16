<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약관리</title>
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
            /*  background-color: yellow;*/
            display: flex;
            align-items: center;
        }
        #link {
        	width:65%;
        }
        #btns {
        	width:35%;
        	text-align: center;
        }
        #header h2 {display: inline;}
        #classify {
            width: 100%;
            height: 70px;
           /* background-color: rgb(177, 228, 96); */
            float: left;
        }
        #reservationOk {
            width: 30%;
            height: 500px;
          /*  background-color: rgb(58, 241, 83);*/
            float: left;
            display: inline;
            justify-content: center;
        }
        #reserDetails {
            width: 40%;
            height: 500px;
            background-color: rgb(255, 239, 185);
            border-radius: 20px;
            float: left;
        }
        #soldOut {
            width: 30%;
            float: left;
           /* background-color: #A49EFD;*/
            height: 500px;
            display: flex;
            justify-content: center;
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
  		<h2><a href='/room'">객실관리</a></h2>
  		&nbsp;&nbsp;&nbsp;
  		<h2><a href="/booking">예약관리</a></h2>
  	</div>
  	<div id="btns">
  		<p>${loginid}님 <input id="logout" type="button" value="로그아웃" onclick="location.href='/logout'"></p>
  	</div>
  </div>
    <div id="classify">
        <table>
            <td>숙박기간</td>
            <td><input id="check1" type="date"> ~ <input id="check2" type="date"></td>
            <tr></tr>
            <td>객실분류</td>
            <td>
                <select style="font-size: 14px; width: 150px;">
                   <!--  <option>Suite Room</option>
                    <option>Family Room</option>
                    <option>Double Room</option>
                    <option>Single Room</option>
                    <option>Domitory</option> -->
                    <option value="all">모두</option>
                     <c:forEach items="${rtype}" var="type">
                		<option value="${type.typecode}">${type.name}</option>
                	</c:forEach> 
                </select>
                &nbsp&nbsp<input id="roomsearch" type="button" value="찾기">
            </td>
        </table>
    </div>
    <div id="reservationOk">
        <table>
            <th style="text-align: center;"><h3>예약가능 객실목록</h3></th>
            <tr></tr>
            <td>
            <select id="roomList" size="10" style="font-size: 16px; background-color: white; width: 305px; height: 430px; overflow:scroll;">
                <!--<option>태조산</option>-->
            	
            </select>
            </td>
        </table>
    </div>
    <div id="reserDetails">
        <table style="padding-left: 10%;">
        	<th style="text-align:center; font-size:18px;"><h3>객실 상세정보</h3></th>
        	<tr></tr>
            <td>객실이름</td>
            <td><input readonly id="rname" type="text" style="font-size: 20px; width: 133px;">
            	<input type="hidden" id="roomcode">	
            </td>
            <tr></tr>
            <td>객실종류</td>
            <td><input readonly id="rclass" type="text" style="font-size: 20px; width: 133px;"></td>
            <tr></tr>                
            <td>숙박기간</td>
            <td>
            	<input style="margin-bottom:4px;" readonly id="date1" type="date"> 부터<br>
            	<input readonly id="date2" type="date"> 까지
            </td>
            <tr></tr>
            <td>예약인원</td>
            <td><input id="reserhowmany" type="number" style="font-size: 18px; width: 133px;"> 명</td>
            <tr></tr>
            <td>수용인원</td>
            <td><input readonly id="rhowmany" type="text" style="font-size: 18px; width: 133px;"> 명</td>
            <tr></tr>         
            <td>1박비용</td>  
            <td><input readonly id="rhowmuch" type="text" style="font-size: 18px; width: 133px;"> 원</td>
            <tr></tr>
            <td>총숙박비</td>  
            <td><input readonly id="allprice" type="money" style="font-size: 18px; width: 133px;"> 원</td>
            <tr></tr>
            <td>예약자명</td>
            <td><input id="resername" type="text" style="font-size: 18px; width: 133px;"></td>
            <tr></tr>      
            <td>예약자 폰번호</td>
            <td><input id="resermobile" type="mobile" style="font-size: 18px; width: 133px;"></td>
        </table>
       
        <div id="buttons">
            <input id="btnjoin" type="button" value="등록" style="background-color: gold;">
            <input id="btndelete" type="button" value="삭제" style="background-color: rgb(255, 58, 58);">
            <input id="btnclear" type="button" value="초기화" style="width: 100px; background-color: aqua;">
        </div>
    </div>     
    <div id="soldOut">
        <table>
            <th style="text-align: center;"><h3>이미 예약된 객실</h3></th>
            <tr></tr>
            <td><select id="reserList" size="10" style="font-size: 16px; background-color: white; width: 300px; height: 430px; overflow:scroll;">
                <!-- <option>태조산</option> -->            
            </select></td>
        </table>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('click','#roomsearch',function(){
	let date1 = $('#check1').val();
	let date2 = $('#check2').val();
	
	$.post("http://localhost:8080/getBookedRoom",{date1:date1, date2:date2},function(result){
		console.log(result);		
		$('#reserList').empty();
		str3 ='<option disabled>객실이름 | 객실타입 | 체크인/체크아웃 | 예약인원/수용인원 | 예약자명 | 예약자연락처</option>'
		$('#reserList').append(str3);
		$.each(result, function(ndx, value){
			str1='<option value="'+value['bookcode']+'">'+value['roomname']+','+value['roomtype']+','+value['checkin']+'/'+value['checkout']+','+value['rperson']+'/'+value['person']+','+value['name']+','+value['mobile']+'</option>';
			$('#reserList').append(str1);			
		})
	},'json');	
	$.post("http://localhost:8080/getRoomSearch",{date1:date1, date2:date2},function(result){
		console.log(result);
				
		$('#roomList').empty();
		str2 = '<option disabled>객실이름 | 객실종류 | 수용인원 | 1박비용 </option>'
		$('#roomList').append(str2);
		$.each(result, function(ndx,value){
			
			str='<option value="'+value['roomcode']+'">'+value['roomname']+','+value['typename']+','+value['howmany']+','+value['howmuch']+'</option>';
			$('#roomList').append(str);
		});
		
	},'json');
	return false;
})

.on('click','#roomList option',function(){
	let a = $(this).text();
	console.log(a);
	b = a.split(',');
	$('#rname').val($.trim(b[0]));
	console.log(b[0]);
	$('#rclass').val($.trim(b[1]));
	console.log(b[1]);
	$('#rhowmany').val($.trim(b[2]));
	console.log($('#rhowmany').val());
	console.log(b[2]);
	$('#rhowmuch').val($.trim(b[3]));
	console.log(b[3]);
	
	let c = $(this).val();
	$('#roomcode').val(c);
	
	x = $('#check1').val();
	y = $('#check2').val();
	
	if(x && y != '') {
		$('#date1').val(x);
		$('#date2').val(y);
		
		$('#date1, #date2').trigger('change');
		
		$('#check1').val('');
		$('#check2').val('');
	}
	
	return false;
})

.on('click','#reserList option',function(){
	
	let bcode = $('#reserList option:selected').val();
	console.log(bcode);
	
	$.post("http://localhost:8080/getBookedDetail",{bcode:bcode},function(result){
		console.log(result);
		console.log(result.roomname);
		$('#rname').val(result.roomname);
		$('#roomcode').val(result.bookcode);
		$('#rclass').val(result.roomtype);
		$('#date1').val(result.checkin);
		$('#date2').val(result.checkout);
		$('#reserhowmany').val(result.rperson);
		$('#rhowmany').val(result.person);
		$('#rhowmuch').val(result.howmuch);
		$('#resername').val(result.rname);
		$('#resermobile').val(result.mobile);
		
		let checkin = $('#date1').val();
		let checkout = $('#date2').val();
		var ar1 = new Date(checkin);
		var ar2 = new Date(checkout);
		let day = ar2 - ar1;
		let days = day / (1000*60*60*24);
		let oneDayPrice = $('#rhowmuch').val();
		
		if(checkin && checkout != ''){
			console.log(days);
			$('#allprice').val(days*oneDayPrice);
			
			return false;
		}
	},'json');
	
	return false;
/* 	let a = $(this).text();
	console.log(a);
	b = a.split(',');
	console.log(b);
	
	c = a.substr(16,21);
	console.log(c);
	d = c.split('/');
	console.log(d);
	
	e = a.substr(38,3);
	console.log(e);
	f = e.split('/');
	console.log(f);
	
	$('#rname').val($.trim(b[0]));
	console.log(b[0]);
	$('#rclass').val($.trim(b[1]));
	console.log(b[1]);
	
	$('#date1').val($.trim(d[0]));
	console.log(d[0]);
	$('#date2').val($.trim(d[1]));
	console.log(d[1]);
	
	$('#reserhowmany').val($.trim(f[0]));
	console.log(f[0]);
	$('#rhowmany').val($.trim(f[1]));	
	console.log(f[1]);
	
	$('#resername').val($.trim(b[4]));
	console.log(b[4]);
	$('#resermobile').val($.trim(b[5]));
	console.log(b[5]); */
})

.on('focusout','#reserhowmany',function(){
	var rperson = parseInt($(this).val());
	var mperson = parseInt($('#rhowmany').val());
	if(rperson > mperson) {
		alert('예약인원은 총 수용인원보다 클수 없습니다');
		$(this).val('');
		return false;
	}
})
//.on('mousemove','#allprice',function(){
.on('change','#date1, #date2',function(){
	let checkin = $('#date1').val();
	console.log(checkin);
	let checkout = $('#date2').val();
	console.log(checkout);
	
	if(checkin != '' && checkout != '' && checkin > checkout) {
		alert('체크인 날짜가 체크아웃 날짜보다 뒤일수 없습니다');
		
		$('#date1').val('');
		$('#date2').val('');
		
		return false;
	}
	var ar1 = new Date(checkin);
	var ar2 = new Date(checkout);
	
	/* var dar1 = new Date(ar1[0], ar1[1], ar1[2]);
	var dar2 = new Date(ar2[0], ar2[1], ar2[2]); */
	
	let day = ar2 - ar1;
	let days = day / (1000*60*60*24);
	let oneDayPrice = $('#rhowmuch').val();
	
	if(checkin && checkout != ''){
		console.log(days);
		$('#allprice').val(days*oneDayPrice);
		
		return false;
	}
/* 	var ar1 = checkin.split('-');
	var ar2 = checkout.split('-');
	
	var dar1 = new Date(ar1[0], ar1[1], ar1[2]);
	var dar2 = new Date(ar2[0], ar2[1], ar2[2]);
	
	var day = dar2 - dar1;
	var checkDay = 24 * 60 * 60 * 1000;
	var checkMonth = checkDay * 30;
	var checkYear = checkMonth * 12;
	
	if(checkin && checkout != ''){
		console.log(day/checkYear);
		console.log(day/checkMonth);
		console.log(day/checkDay);
	} */
})
.on('click','#btnjoin',function(){
	let roomname=$('#rname').val();
	let roomcode=$('#roomcode').val();
	let roomtype=$('#rclass').val();
	let date1=$('#date1').val();
	let date2=$('#date2').val();
	let reserhowmany=$('#reserhowmany').val();
	let howmany=$('#rhowmany').val();
	let howmuch=$('#rhowmuch').val();	
	let allprice = $('#allprice').val();
	let resername = $('#resername').val();
	let resermobile = $('#resermobile').val();
	
	if(roomname==''||roomtype==''||date1==''||date2==''||reserhowmany==''||howmany==''||howmuch==''||allprice==''||resername==''||resermobile==''){
		alert('값이 누락되었음');
		return false;
	}
	
	if(roomcode <= 100){ // insert		
		$.post('http://localhost:8080/reservationRoom',
			{roomname:roomname,roomcode:roomcode,roomtype:roomtype,date1:date1,date2:date2,reserhowmany:reserhowmany,howmany:howmany,howmuch:howmuch,allprice:allprice,resername:resername,resermobile:resermobile},
			function(result){
				console.log(result);
				if(result=='ok'){
					$('#reserList').append('<option value="'+roomcode+'">'+roomname+','+roomtype+','+date1+'/'+date2+','+reserhowmany+'/'+howmany+','+howmuch+','+allprice+','+resername+','+resermobile+'</option>');
					$('#rname, #resermobile, #resername, #allprice, #rclass, #date1, #date2, #reserhowmany, #rhowmany, #rhowmuch, #roomcode').val('');
				}
			},'text');
		return false;
	}
	else { // update
		$.post('http://localhost:8080/updateReservationRoom',
				{roomname:roomname,roomcode:roomcode,roomtype:roomtype,date1:date1,date2:date2,reserhowmany:reserhowmany,howmany:howmany,howmuch:howmuch,allprice:allprice,resername:resername,resermobile:resermobile},
				function(result){
					if(result=='ok'){
						location.reload();
					}
				},'text');
		return false;
	}
	
	
})
.on('click','#btnclear',function(){
	$('#rname, #resermobile, #resername, #allprice, #rclass, #date1, #date2, #reserhowmany, #rhowmany, #rhowmuch, #roomcode').val('');
	$('#roomList option:selected').prop("selected",false);
	$('#reserList option:selected').prop("selected",false);
	return false;
})
.on('click','#btndelete',function(){
	$.post('http://localhost:8080/deleteBook',{bookcode:$('#roomcode').val()},function(result){
		console.log(result);
		if(result=="ok"){
			$('#btnclear').trigger('click'); // 입력란 초기화, trigger : 호출해주는 효과
			$('#reserList option:selected').remove(); // 객실목록에서도 삭제
		}
	},'text');
	return false;	
})
.on('click','#logout',function(){
		alert('로그아웃 되었습니다');
	})
</script>
</html>



<%-- <%
	String loginid=(String)session.getAttribute("loginid");
	if(!loginid.equals("seoje")){
		response.sendRedirect("/");
	}
%> --%>