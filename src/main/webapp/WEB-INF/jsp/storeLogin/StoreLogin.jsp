<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登入介面</title>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>  
<script src="js/FBLogin.js"></script>
</head>
<body>

	<div align="center">
	<form action="/OneOrZero/StoreLoginController" method="POST" name="loginForm">		
		商家帳號:<input type="email" name="account" id="n1" autocomplete="out"><span>${ErrorMsg.AccountEmptyError}</span><br> 
     	商家密碼:<input type="password" name="password" id="n2"><span>${ErrorMsg.PasswordEmptyError}</span><br> 
     	<input type="submit" value="確認送出">
     	<input type="reset"	value="取消登入" /><br>
     	<span>${ErrorMsg.VerifyError}${ErrorMsg.LoginError}</span>
     	
     	
	</form>
	</div>
	<div align="center">
	<a href="/OneOrZero/jsp/corp_signup.jsp">還沒有帳號？</a>
	<a href="/OneOrZero/jsp/StoreForgetPwd.jsp">忘記密碼？</a>
	</div>
	<div id="test"></div>
	
	<br>
	
    <!--顯示用戶的姓名、email↓-->
    <div id="content"></div>
	
</body>
</html>