<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員資料修正</title>
</head>
<body>
<form action="">
<table>
 	<tr><td>信箱</td><td><input type="text" name="account" value="${member.email}" placeholder="未填寫" size="30"></td></tr>
 	<tr><td>名稱</td><td><input type="text" name="user" value="${member.name}" placeholder="未填寫" size="30"></td></tr>
 	<tr><td>生日</td><td><input type="date" value="${member.birthday}" placeholder="未填寫" size="30"></td></tr>
	<tr><td>性別</td><td>
                <input type="radio" name="gender" value="M">男
                <input type="radio" name="gender" value="F">女
                <input type="radio" name="gender" value="N" checked="checked">不方便透漏</td></tr>
 	<tr><td>電話</td><td><input type="text" value="${member.tel}" placeholder="未填寫" size="30"></td></tr>
 	<tr><td>創建日期</td><td><input type="text" value="${member.create_dt}" placeholder="未填寫" disabled size="30"></td></tr>
  	<tr><td>更新日期</td><td><input type="text" value="${member.update_dt}" placeholder="未填寫" disabled size="30"></td></tr>
 	<tr><td>等級</td><td><input type="text" value="${member.vip}" placeholder="未填寫" disabled size="30"></td></tr>
	</table>
	</form>
	
	<div align="center">
		<form action="UserLogout.jsp">
		<input type="submit" value="Logout">
		</form>
	</div>
</body>
</html>