<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실관리</title>
</head>
<style>
        #header {
            margin: auto;
            height: 100px;
            background-color: yellow;
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
            background-color: rgb(177, 228, 96);
            float: left;
        }
        #roomdetails {
            width: 60%;
            height: 500px;
            background-color: gray;
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
    		<h2><a href="/room">객실관리</a></h2>
    		&nbsp;&nbsp;&nbsp;
    		<h2><a href="/booking">예약관리</a></h2>
    	</div>
    	<div id="btns">
  		<p>${loginid}님 환영합니다</p>
  		<input type="button" value="로그아웃" onclick="location.href='/logout'">
  	</div>
    </div>
    
    <div id="roomlist">
        <table style="padding-left: 15px;">
            <th style="text-align: left;"><h3>객실목록</h3></th>
            <tr></tr>
            <td><select size="10" style="font-size: 16px; background-color: white; width: 200px; height: 350px;">
                <option>태조산</option>
              
            </select></td>
        </table>
    </div>
    <div id="roomdetails">
        <table style="padding-left: 15px;">
            <td><h3>객실이름</h3></td>
            <td><input type="text" style="font-size: 20px; width: 100px;"></td>
            <tr></tr>                
            <td><h3>객실분류</h3></td>
            <td>
                <select size="5" style="font-size: 14px; width: 110px;">
                    <option>Suite Room</option>
                    <option>Family Room</option>
                    <option>Double Room</option>
                    <option>Single Room</option>
                    <option>Domitory</option>
                </select>
            </td>
            <tr></tr>
            <td><h3>숙박가능인원</h3></td>
            <td><input type="number" style="font-size: 16px; width: 88px;">명</td>
            <tr></tr>        
            <td><h3>1박요금</h3></td>  
            <td><input type="money" style="font-size: 16px; width: 88px;">원</td>
        </table>
        <div id="buttons">
            <input type="button" value="등록" style="background-color: gold;">
            <input type="button" value="취소" style="background-color: rgb(255, 58, 58);">
            <input type="button" value="초기화" style="width: 100px; background-color: aqua;">
        </div>        
    </div>
</body>
</html>