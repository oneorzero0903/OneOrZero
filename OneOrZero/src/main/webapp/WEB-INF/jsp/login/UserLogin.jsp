<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登入介面</title>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script src="<c:url value='/js/FBLogin.js'	/>"></script>
</head>
<body>

	<div align="center">

		<form:form method="POST" modelAttribute="memberBean">
			<div class="form-group">
				<label class="control-label col-lg-2 col-lg-2" for='email'>
					帳號: </label>
				<div class="col-lg-10">
					<form:input id="email" path="email" type='email'
						class='form:input-large' autocomplete="off" />
					<span>${ErrorMsg.AccountEmptyError}</span><br>
				</div>
				<label class="control-label col-lg-2 col-lg-2" for='password'>
					密碼: </label>
				<div class="col-lg-10">
					<form:input id="password" path="password" type='password'
						class='form:input-large' />
					<span>${ErrorMsg.PasswordEmptyError}</span><br>
				</div>
				<div class='col-lg-offset-2 col-lg-10'>
					<input id="btnAdd" type='submit' class='btn btn-primary' value='送出' />
				</div>
				<br>${ErrorMsg.VerifyError}${ErrorMsg.LoginError}<br>
			</div>
		</form:form>
	</div>

	<div align="center">
		<a href="<c:url value='/signUp/Terms' />">還沒有帳號？</a>
		<a href="<c:url value='/login/UserForgetPwd' />">忘記密碼？</a>
	</div>
	<div id="test"></div>

	<br>
	<div align="center">
		<input type="button" value="Facebook登入" onclick="FBLogin()" />
	</div>
	<!--顯示用戶的姓名、email↓-->
	<div id="content"></div>

</body>
</html>