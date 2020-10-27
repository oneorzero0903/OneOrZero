<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="zh-TW">

  <head>
	<jsp:include page="/fragment/linkCss.jsp" />
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
	<c:set var="funcName" value="LOG" scope="session"/>
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
                <h4>about us</h4>
                <h2>more about us!</h2>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>

    <!-- Banner Ends Here -->
    <div align="center">

		<form:form method="POST" modelAttribute="memberBean">
			<div class="form-group">

				<div class="col-lg-10">
					<label style="color: white;" class="control-label col-lg-2 col-lg-2" for='email'>
						帳號: </label>
					<form:input id="email" path="email" type='email'
						class='form:input-large' autocomplete="off" />
					<br><p style="color: white;">${ErrorMsg.AccountEmptyError}</p><br>
				</div>

				<div class="col-lg-10">
					<label style="color: white;" class="control-label col-lg-2 col-lg-2" for='password'>
						密碼: </label>
					<form:input id="password" path="password" type='password'
						class='form:input-large' />
					<br><p style="color: white;">${ErrorMsg.PasswordEmptyError}</p><br>
				</div>
				<div class='col-lg-offset-2 col-lg-10'>
					<input id="btnAdd" type='submit' class='btn btn-primary' value='送出' />
				</div>
				<br><p style="color: white;">${ErrorMsg.VerifyError}${ErrorMsg.LoginError}</p><br>
			</div>
		</form:form>
		<button onclick="oneClick()">一鍵登入</button>
	</div>
	

	<div align="center">
		<a href="<c:url value='/signUp/Terms'/>">還沒有帳號？</a> 
		<a href="<c:url value='/login/UserForgetPwd' />">忘記密碼？</a>
	</div>
	<div id="test"></div>

	<br>
	<div align="center">
		<input type="button" value="Facebook登入" onclick="FBLogin()" />
	</div>
	<!--顯示用戶的姓名、email↓-->
	<div id="content"></div>

	<jsp:include page="/fragment/footer.jsp" />

  </body>
</html>
