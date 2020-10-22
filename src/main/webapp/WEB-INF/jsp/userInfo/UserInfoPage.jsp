<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員資料</title>
</head>
<body>
 	<table>
 	<tr><td>信箱</td><td><input type="text" value="${member.email}" placeholder="未填寫" disabled size="30"></td></tr>
 	<tr><td>名稱</td><td><input type="text" value="${member.name}" placeholder="未填寫" disabled size="30"></td></tr>
 	<tr><td>生日</td><td><input type="text" value="${member.birthday}" placeholder="未填寫" disabled size="30"></td></tr>
	<tr><td>性別</td><td><input type="text" value="${member.gender}" placeholder="未填寫" disabled size="30"></td></tr>
 	<tr><td>電話</td><td><input type="text" value="${member.tel}" placeholder="未填寫" disabled size="30"></td></tr>
 	<tr><td>創建日期</td><td><input type="text" value="${member.create_dt}" placeholder="未填寫" disabled size="30"></td></tr>
  	<tr><td>更新日期</td><td><input type="text" value="${member.update_dt}" placeholder="未填寫" disabled size="30"></td></tr>
 	<tr><td>等級</td><td><input type="text" value="${member.vip}" placeholder="未填寫" disabled size="30"></td></tr>
	</table>
	
	<div align="center">
		<form action="UserLogout.jsp">
		<input type="submit" value="Logout">
		</form>
		<br>
		<form action="UserInfoChange.jsp">
		<input type="submit" value="會員資料修改">
		</form>
	</div>
</body>
</html>