<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="/fragment/linkCss.jsp" />
<style>
.page-heading .text-content h4 {
	color: #0080ff;
	font-size: 18px;
	text-transform: uppercase;
	font-weight: 900;
	letter-spacing: 0.5px;
	margin-bottom: 15px;
}

.page-heading .text-content h2 {
	color: #fff;
	font-size: 36px;
	font-weight: 700;
	text-transform: uppercase;
	letter-spacing: 0.5px;
}

.call-to-action .main-content span {
	color: #0080ff;
	font-size: 18px;
	font-weight: 900;
	letter-spacing: 0.5px;
}

.call-to-action .main-content h4 {
	margin-bottom: 0px;
	margin-top: 12px;
	color: #fff;
	font-size: 26px;
	font-weight: 900;
	letter-spacing: 0.25px;
}

.main-button a {
	display: inline-block;
	background-color: #0080ff;
	color: #fff;
	font-size: 13px;
	font-weight: 500;
	padding: 12px 20px;
	text-transform: uppercase;
	transition: all .3s;
}

header {
	position: absolute;
	z-index: 99999;
	width: 100%;
	height: 100px;
	background-color: #0080ff;
	-webkit-transition: all 0.3s ease-in-out 0s;
	-moz-transition: all 0.3s ease-in-out 0s;
	-o-transition: all 0.3s ease-in-out 0s;
	transition: all 0.3s ease-in-out 0s;
}

.nav-link, .navbar-brand {
	color: #fff
}
</style>
</head>

<body style="background-color: #ffffee;">

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
	<c:set var="funcName" value="LOGST" scope="session" />
	<!-- 引入共同的頁首 -->
	<jsp:include page="/fragment/topStore.jsp" />

	<!-- Page Content -->
	<!-- Banner Starts Here -->
	<div class="heading-page header-text">
		<section class="page-heading">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="text-content">
							<h4>商家頁面</h4>
							<h2>快來成為我們的合作店家</h2>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<div align="center">

		<form:form method="POST" modelAttribute="storeBean">
			<div class="form-group"
				style="background-color: #0080ff; margin: 50px 300px;">

				<div class="col-lg-10">
					<br>

					<h1 style="color: #ffffee; margin: 10px">登入</h1>

					<div class="input-group flex-nowrap" style="width: 300px">
						<div class="input-group-prepend">
							<span class="input-group-text" id="addon-wrapping">帳號</span>
						</div>
						<form:input id="email" path="email" type="text"
							class="form-control" placeholder="Username" autocomplete="off"
							aria-label="Username" aria-describedby="addon-wrapping" />
					</div>
					<br>${ErrorMsg.AccountEmptyError}<br>
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
					<div class='col-lg-offset-2 col-lg-10'>
						<br> <input id="btnAdd" type='submit' class='btn btn-light' value='送出' />
					</div>
					<br>${ErrorMsg.VerifyError}${ErrorMsg.LoginError}
				</div>
				<div align="center" >
					<a href="<c:url value='/signUp/StoreTerms' />" style="color:#0080ee">還沒有帳號？</a> 
					<a href="<c:url value='/login/StoreForgetPwd' />"style="color:#0080ee">忘記密碼？</a>
				</div>
				<br>
			</div>
		</form:form>
		<button class='btn btn-primary' onclick="oneClick()" style="margin: 10px">方案Demo</button>
		<button id='yvetteBtn' class='btn btn-info' style="margin: 10px">報表Demo</button>
		<button id='jacobBtn' class='btn btn-warning' style="margin: 10px">催帳Demo</button>
	</div>
	<br>

	<script>
	
		function oneClick() {
			document.getElementById("email").value = "oneorzerocorp@gmail.com";
			document.getElementById("password").value = "abcd1234!";
		}
		
		var yvetteBtn = document.getElementById("yvetteBtn");
		yvetteBtn.onclick = function() {
			document.getElementById("email").value = "yvette123@gmail.com";
			document.getElementById("password").value = "abcd1234!";
		}
		
		var jacobBtn = document.getElementById("jacobBtn");
		jacobBtn.onclick = function() {
			document.getElementById("email").value = "www.facebook.com/januarycoupletw";
			document.getElementById("password").value = "abcd1234!";
		}
		
	</script>

	<jsp:include page="/fragment/footer.jsp" />

</body>
</html>
