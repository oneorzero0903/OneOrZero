<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="zh-TW">

<head>
<jsp:include page="/fragment/linkCss.jsp" />
<style>
.login-i {
	wight: 500px;
	margin: auto;
	border: 1px solid transparent;
}
</style>
</head>

<body style="background-color: #272727;">

	<!-- ***** Preloader Start ***** -->
	<div id="preloader">
		<div class="jumper">
			<div></div>
			<div></div>
			<div></div>
		</div>
	</div>
	<!-- ***** Preloader End ***** -->
	<!-- 下列敘述設定變數funcName的值為SHO，topMVC.jsp 會用到此變數 -->
	<c:set var="funcName" value="LOG" scope="session" />
	<!-- 引入共同的頁首 -->
	<jsp:include page="/fragment/top.jsp" />

	<!-- Page Content -->
	<!-- Banner Starts Here -->
	<div class="heading-page header-text">
		<section class="page-heading">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="text-content">
							<h4>登入</h4>
							<h2>Login for more coffee</h2>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<!-- Banner Ends Here -->
	<div align="center">

		<form:form method="POST" modelAttribute="memberBean">
			<div class="form-group"
				style="background-color: #d26900; margin: 50px 300px;">
				<div class="login-i">
					<div class="col-lg-10">
						<br>
						
						<h1 style="color:#272727; margin:10px">登入</h1>
					
						<div class="input-group flex-nowrap" style="width: 300px">
							<div class="input-group-prepend">
								<span class="input-group-text" id="addon-wrapping">帳號</span>
							</div>
							<form:input id="email" path="email" type="text"
								class="form-control" placeholder="Username" autocomplete="off"
								aria-label="Username" aria-describedby="addon-wrapping" />
						</div>

						<br>
						<p style="color: white;">${ErrorMsg.AccountEmptyError}</p>
						<br>
					</div>

					<div class="col-lg-10">

						<div class="input-group flex-nowrap" style="width: 300px">
							<div class="input-group-prepend">
								<span class="input-group-text" id="addon-wrapping">密碼</span>
							</div>
							<form:input id="password" path="password" type='password'
								class="form-control" placeholder="password" autocomplete="off"
								aria-label="Password" aria-describedby="addon-wrapping" />
						</div>

						<br>
						<p style="color: white;">${ErrorMsg.PasswordEmptyError}</p>
						<br>
					</div>
					<div class='col-lg-offset-2 col-lg-10'>
						<input id="btnAdd" type='submit' class="btn btn-dark"
							value='送出' />
						<input type="button" class='btn btn-primary' value="Facebook登入" onclick="FBLogin()" />
						<p style="color: white;">${ErrorMsg.VerifyError}${ErrorMsg.LoginError}</p>
						<br>
					</div>
					
					<div align="center">
						<a href="<c:url value='/signUp/Terms'/>">還沒有帳號？</a> <a
							href="<c:url value='/login/UserForgetPwd' />">忘記密碼？</a>
					</div>
					<div id="test"></div>

					<br>
					<div align="center">
						
					</div>

				</div>
			</div>
		</form:form>
		<button class='btn btn-dark' onclick="oneClick()"
						style="margin: 10px">一鍵登入</button>

	</div>



	<!--顯示用戶的姓名、email↓-->
	<div id="content"></div>

	<script>
		function oneClick() {
			document.getElementById("email").value = "oneorzerocorp@gmail.com";
			document.getElementById("password").value = "abcd1234!";
		}
	</script>

	<jsp:include page="/fragment/footer.jsp" />

</body>
</html>
