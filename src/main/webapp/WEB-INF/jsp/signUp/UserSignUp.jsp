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
.form-control {
	width: 250px;
}

label {
	color: white;
}

.form-group {
	width: 700px;
}
.SignUpForm{
	border:1px solid #d26900;
	width: 800px;
	margin-top:20px;
	padding:20px;
}
span {
color:#d26900;
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
	<c:set var="funcName" value="SIG" scope="session" />
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
							<h4>SignUp</h4>
							<h2>用戶註冊</h2>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<!-- Banner Ends Here -->

 <h2 style="color:#d26900;text-align:center;margin-top:20px">請填註冊基本資料</h2>
	<div align="center">

		<form:form method="POST" modelAttribute="memberBean" id="SignUpForm" class="SignUpForm">
			<div class="form-group" >



				<div class="form-group">
					<div class="row">
						<div class="col">
							<label>帳號</label>
							<form:input id="email" path="email" type="email"
								class="form-control" aria-describedby="emailHelp" />
							<small id="emailHelp" class="form-text text-muted">1.請輸入信箱,
								2.不可空白</small>
						</div>
						<div class="col">
							<label>姓名</label>
							<form:input id="name" path="name" type='name'
								class="form-control" size="10" autocomplete="off"
								onblur="checkName()" />
							<span id="spanName"></span>
						</div>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<div class="row">
						<div class="col">
							<label>密碼</label>
							<form:input id="password" path="password" type="password"
								class="form-control" />
							<span style="color: gray; font-size: x-small">1.不可空白,
								2.長度至少6個字, 3.包含英文字母＆數字＆特殊字元</span>
						</div>
						<div class="col">
							<label>確認密碼</label> <input class='form-control' name="chkPwd"
								type="password" id="secondPwd" size="10" onblur="checkAgain()">
							<span style="color: gray; font-size: x-small">請再次輸入密碼</span> <span
								id="spanPwdAgain"></span>
						</div>
					</div>
				</div>

				<hr>

				<div class="row">
					<div class="col">
						<div class="form-check form-check-inline">
							<form:radiobutton class="form-check-input" autocomplete="off"
								path="gender" id="gender" value="M" />
							<label class="form-check-label">男</label>
						</div>
						<div class="form-check form-check-inline">
							<form:radiobutton class="form-check-input" autocomplete="off"
								path="gender" id="gender" value="F" />
							<label class="form-check-label" for="inlineRadio2">女</label>
						</div>
						<div class="form-check form-check-inline">
							<form:radiobutton id="gender" path="gender"
								class="form-check-input" autocomplete="off" value="N"
								checked="checked" />
							<label class="form-check-label" for="inlineRadio3">不方便透漏</label>
						</div>
					</div>
					<div class="col">
						<label for='birthday'>生日: </label>
						<form:input id="birthday" path="birthday" type='date'
							class='form-control' size="10" autocomplete="off"
							onblur="checkDate()" />
						<span id="spanDate"></span>

					</div>
				</div>
				
				


				<hr>
				<br>
				<br>

				<div class='col-lg-offset-2 col-lg-10'>

					<input id="btnAdd" type="button" class='btn btn-light' value='送出'
						onclick="submit()" /> <input type="reset" class='btn btn-dark'
						value="取消重填" class="cancel">
				</div>


				<span>${SignUpError}</span>
			</div>
		</form:form>
		<br>
		<button id='btn' class='btn btn-dark' onclick="oneclick()">一鍵輸入</button>

		<script>
			function oneclick() {
				document.getElementById("email").value = "oneorzerocorp@gmail.com";
				document.getElementById("name").value = "Mark";
				document.getElementById("birthday").value = "2020-01-01";
				document.getElementById("password").value = "abcd1234!";
				document.getElementById("secondPwd").value = "abcd1234!";
			}
			//let submitBtn = document.querySelector("input[type='button']");
			function submit() {
				let checkAll = checkEmail() && checkName() && checkAgain()
						&& checkDate();
				// let form =  document.querySelector("SignUpForm");
				if (checkAll) {
					///submitBtn.disabled = false;
					document.forms["SignUpForm"].submit();
				} else {
					return false;
				}
			}
			function checkEmail() {
				let emailVal = document.getElementById("email").value;
				let spanEmail = document.getElementById("spanEmail");
				if (emailVal == "") {
					spanEmail.innerHTML = "Not empty!";
					//submitBtn.disabled = true;
					return false
				} else if (!/@/.test(emailVal) || !/./.test(emailVal)) {
					spanEmail.innerHTML = "帳號要有@";
					return false
				} else {
					spanEmail.innerHTML = "";
					return true
					<!--submitBtn.disabled = false;
					-->
				}
			}
			function checkName() {
				let nameVal = document.getElementById("name").value;
				let spanName = document.getElementById("spanName");
				if (nameVal == "") {
					spanName.innerHTML = "Not empty!";
					//submitBtn.disabled = true;
					return false
				} else {
					spanName.innerHTML = "Correct";
					return true
				}
			}
			function checkDate() {
				let date = document.getElementById("birthday").value;
				if (date == "") {
					spanDate.innerHTML = "Not empty!";
					//submitBtn.disabled = true;
					return false
				} else {
					spanDate.innerHTML = "";
					return true
				}
			}
			function checkAgain() {
				let firstPwd = document.getElementById("password").value;
				let secondPwd = document.getElementById("passwordRechk").value;
				if (firstPwd != secondPwd) {
					spanPwd.innerHTML = "兩次輸入密碼不一致";
					spanPwdAgain.innerHTML = "兩次輸入密碼不一致";
					//submitBtn.disabled = true;
					return false
				} else {
					if (checkPwd()) {
						spanPwd.innerHTML = "Correct!";
						spanPwdAgain.innerHTML = "Correct";
						return true
					}
				}
			}
			function checkPwd() { //這段是在寫三小 WTF
				let pwdVal = document.getElementById("password").value;
				let spanPwd = document.getElementById("spanPwd");
				if (pwdVal == "")
					spanPwd.innerHTML = "Not empty!";
				else if (pwdVal.length < 6)
					spanPwd.innerHTML = "Enter aleast 6 words!";
				else {
					let count = 0;
					for (let i = 0; i < pwdVal.length; i++) { // special character is included?
						if ((pwdVal.charCodeAt(i) >= 0x21 && pwdVal
								.charCodeAt(i) <= 0x2F)
								|| (pwdVal.charCodeAt(i) >= 0x3A && pwdVal
										.charCodeAt(i) <= 0x40)
								|| (pwdVal.charCodeAt(i) >= 0x5E && pwdVal
										.charCodeAt(i) <= 0x60)
								|| (pwdVal.charCodeAt(i) >= 0x7B && pwdVal
										.charCodeAt(i) <= 0x7E)) {
							count++;
							break;
						}
					}
					if (count > 0) {
						for (let i = 0; i < pwdVal.length; i++) { // number is included?
							if ((pwdVal.charCodeAt(i) >= 0x30 && pwdVal
									.charCodeAt(i) <= 0x39)) {
								count++;
								break;
							}
						}
					}
					if (count > 1) {
						for (let i = 0; i < pwdVal.length; i++) { // english character is included?
							if ((pwdVal.charCodeAt(i) >= 0x41 && pwdVal
									.charCodeAt(i) <= 0x5A)
									|| (pwdVal.charCodeAt(i) >= 0x61 && pwdVal
											.charCodeAt(i) <= 0x7A)) {
								count++;
								break;
							}
						}
					}
					if (count > 2) {
						spanPwd.innerHTML = "Correct!";
						return true;
					} else {
						spanPwd.innerHTML = "Wrong!";
					}
				}
			}
		</script>

	</div>

	<jsp:include page="/fragment/footer.jsp" />

</body>
</html>