<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="zh-TW">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="LILY">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap" rel="stylesheet">

    <title>search("咖啡");</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value='/css/vendor/bootstrap/css/bootstrap.min.css'	/>" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="<c:url value='/css/fontawesome.css'	/>">
    <link rel="stylesheet" href="<c:url value='/css/templatemo-stand-blog.css'	/>">
    <link rel="stylesheet" href="<c:url value='/css/owl.css'	/>">


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

    <!-- Header -->
    <header class="">
      <nav class="navbar navbar-expand-lg">
        <div class="container">
          <a class="navbar-brand" href="<c:url value='/'	/>"><h2>search("咖啡");<em>.</em></h2></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item active">
                <a class="nav-link" href="<c:url value='/'	/>">首頁
                  <span class="sr-only">(current)</span>
                </a>
              </li> 
              <li class="nav-item">
                <a class="nav-link" href="<c:url value='/login/UserLogin'	/>">登入</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="<c:url value='/signUp/Terms'	/>">註冊</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="<c:url value='/backEnd/storeOrder/StoreOrderList'	/>">訂位</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="<c:url value='/indexShop'	/>">商家頁面</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="<c:url value='/contact'	/>">聯絡我們</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>

    <!-- Page Content -->
    <!-- Banner Starts Here -->
    <div class="heading-page header-text">
      <section class="page-heading">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <div class="text-content">
                <h4>Login</h4>
                <h2>登入</h2>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
    
    <!-- Banner Ends Here -->


    <div align="center">

		<form:form method="POST" modelAttribute="memberBean" id="SignUpForm">
			<div class="form-group">
				<p><fieldset>
					<p><legend>用戶註冊</legend></p>
					<p><label class="control-label col-lg-2 col-lg-2" for='email'>帳號: </label></p>
					<form:input id="email" path="email" type='email'
						class='form:input-large' size="30" autocomplete="off" onblur="checkEmail()"/>
					<span id="spanEmail"></span><br> 
					<span style="color: gray; font-size: x-small">1.請輸入信箱, 2.不可空白,</span> <br>
						
					<p><label class="control-label col-lg-2 col-lg-2" for='name'>姓名: </label></p>
					<form:input id="name" path="name" type='name'
						class='form:input-large' size="10" autocomplete="off" onblur="checkName()"/>
					<span id="spanName"></span><br> 
					<span style="color: gray; font-size: x-small">1.不可空白, 2.輸入兩字以上,</span> <br>
					
					<p><label class="control-label col-lg-2 col-lg-2" for='gender'>性別: </label></p>
						<p><form:radiobutton id="gender" path="gender"
							class='form:input-large' autocomplete="off" value="M"/>男
						<form:radiobutton id="gender" path="gender"
							class='form:input-large' autocomplete="off" value="F"/>女
						<form:radiobutton id="gender" path="gender"
							class='form:input-large' autocomplete="off" value="N" checked="checked"/>不方便透漏</p>
					<span class="genderTip"></span><br>
					
					<p><label class="control-label col-lg-2 col-lg-2" for='birthday'>生日: </label></p>
					<form:input id="birthday" path="birthday" type='date'
						class='form:input-large' size="10" autocomplete="off" onblur="checkDate()"/>
					<span id="spanDate"></span><br>
					
					<p><label class="control-label col-lg-2 col-lg-2" for='password'>密碼: </label></p>
					<form:input id="password" path="password" type='password'
						class='form:input-large' size="10" autocomplete="off" onblur="checkPwd()"/>
					<br> <span id="spanPwd"></span><br>
					<span style="color: gray; font-size: x-small">1.不可空白, 2.長度至少6個字,
					3.包含英文字母＆數字＆特殊字元</span><br>
					
					<p><label class="control-label col-lg-2 col-lg-2" for='passwordRechk'>確認密碼: </label></p>
					<input name="chkPwd" type="password" id="secondPwd" size="10" onblur="checkAgain()"> 
					<span id="spanPwdAgain"></span><br>
					
					<div class='col-lg-offset-2 col-lg-10'>
						
						<input id="btnAdd" type="button" class='btn btn-primary' value='送出' onclick="submit()"/>
						
					</div>
					
				</fieldset>
				<span>${SignUpError}</span>
			</div>
		</form:form>
		<button id='btn' onclick="oneclick()">一鍵輸入</button>

		<script>
			function oneclick(){
				document.getElementById("email").value = "sakurazaki0428@gmail.com";
				document.getElementById("name").value = "Mark";
				document.getElementById("birthday").value = "2020-01-01";
				document.getElementById("password").value = "abcd1234!";
				document.getElementById("secondPwd").value = "abcd1234!";
			}
			//let submitBtn = document.querySelector("input[type='button']");
			function submit() {
				let checkAll = checkEmail() && checkName() && checkAgain()
						&& checkDate()
				// let form =  document.querySelector("SignUpForm");
				if (checkAll) {
					///submitBtn.disabled = false;
					document.forms["SignUpForm"].submit()
				} else {
					return false
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

    
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <ul class="social-icons">
              <li><a href="#">Facebook</a></li>
              <li><a href="#">Twitter</a></li>
              <li><a href="https://www.instagram.com/oneorzero_searchcoffee/">Instagram</a></li>
              <li><a href="#">Linkedin</a></li>
              <li><a href="https://github.com/oneorzero0903">Github</a></li>
            </ul>
          </div>
          <div class="col-lg-12">
            <div class="copyright-text">
              <p>Copyright 2020 One||Zero corp. Ltd. </p>
             
            </div>
          </div>
        </div>
      </div>
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="<c:url value='/css/vendor/jquery/jquery.min.js'	/>" ></script>
    <script src="<c:url value='/css/vendor/bootstrap/js/bootstrap.bundle.min.js'	/>" ></script>

    <!-- Additional Scripts -->
    <script src="<c:url value='/js/custom.js'	/>"></script>
    <script src="<c:url value='/js/owl.js'	/>"></script>
    <script src="<c:url value='/js/slick.js'	/>"></script>
    <script src="<c:url value='/js/isotope.js'	/>"></script>
    <script src="<c:url value='/js/accordions.js'	/>"></script>

    <script language = "text/Javascript"> 
      cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
      function clearField(t){                   //declaring the array outside of the
      if(! cleared[t.id]){                      // function makes it static and global
          cleared[t.id] = 1;  // you could use true and false, but that's more typing
          t.value='';         // with more chance of typos
          t.style.color='#fff';
          }
      }
    </script>

  </body>
</html>