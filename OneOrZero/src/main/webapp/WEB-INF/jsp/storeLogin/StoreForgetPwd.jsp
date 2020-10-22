<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>找回密碼</title>
</head>
<body>
	<h1 align="center">忘記密碼介面TEST</h1>
	<div align="center">
		<h3>重設密碼</h3>
		<form action="/OneOrZero/StoreForgetPwdController" method="post">
		Email:<input type="email" name="account" autocomplete="off">
		<input type="submit" value="確認送出">
     	<input type="reset"	value="全部清空"><br>
     	${ErrorMsg.AccountEmptyError}${ErrorMsg.LoginError}
		</form>
	</div>
</body>
</html>