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
.nav-link,.navbar-brand{
color:#fff
}
.wrap {
    text-align: center;
}
  </style>
  </head>
  <script src="https://code.jquery.com/jquery-3.1.0.js"> </script>
  <script src="<c:url value='/js/StoreSignup.js'	/>"></script>
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
	<c:set var="funcName" value="SIGST" scope="session"/>
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
                <h2>商家註冊</h2>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
    
    <!-- Banner Ends Here -->

	<div class="wrap">
        <h2>商家註冊</h2>
        <form:form method="POST" modelAttribute="storeBean" id="SignUpForm">
            <label for="email">請輸入信箱</label>
            <form:input id="email" path="email" type='email'
						class='form:input-large' size="30" autocomplete="off" placeholder="請輸入信箱" onblur="checkEmail()"/>
            <span id="spanEmail"></span>
            <br>
            
            <label for="password">請輸入密碼</label>
<!--             <input type="password" id="idPwd1" name="password" placeholder="請輸入密碼" onblur="checkPwd();" onkeyup="checkPwd();" /> -->
			<form:input id="password" path="password" type='password'
						class='form:input-large' size="10" autocomplete="off" placeholder="請輸入密碼" onblur="checkPwd();" onkeyup="checkPwd();"/>
            <span id="idspPwd1"></span>
            <br>
            
            <label for="password1">請再次輸入密碼</label>
            <input type="password" id="idPwd2" placeholder="請再次輸入密碼" onblur="checkPwdReapeat();"
                onkeyup="checkPwdReapeat();" />
            <span id="idspPwd2"></span>
            <br>
            
            <label for="text">公司名稱</label>
<!--             <input type="text" name="corporation" id="Store_name" class="corporation" placeholder="請輸入公司名稱"> -->
            <form:input id="store_name" path="store_name" type='store_name'
						class='form:input-large' size="10" autocomplete="off" placeholder="請輸入公司名稱"/>
            <div class="st1">

                <label for="" class="t1">所在縣市</label>
                <form:select path="address_city" id="address_city">
                </form:select>
                <br>
                
                <label for="" class="t1">所在地區</label>
                <form:select path="address_area" id="address_area">
              
                </form:select>
                <br>
                
                <label for="" class="t1">所在地路名</label>
                <form:input id="address_road" path="address_road" type='address_road'
						class='form:input-large' size="10" autocomplete="off" placeholder="請輸入路名"/>
                <br> 
                
                <label for="tel" class="tel">公司電話</label>
                <form:input id="tel" path="tel" type='tel'
						class='form:input-large' size="10" autocomplete="off" placeholder="請輸入公司電話"/>
                <br>
                
                <label for="cellphone" class="cellphone">行動電話</label>
                <form:input id="phone" path="phone" type='phone'
						class='form:input-large' size="10" autocomplete="off" placeholder="請輸入行動電話"/>
                <br>
            </div>
            <div class="st1">
                <label for="" class="t1">營業開始時間</label>
                <form:input id="opentime_start" path="opentime_start" type='time'
						class='form:input-large' size="30" autocomplete="off"/>
            </div>
            <div class="st1">
                <label for="" class="t1" >營業結束時間</label>
                <form:input id="opentime_end" path="opentime_end" type='time'
						class='form:input-large' size="30" autocomplete="off"/>
            </div>
            <div class="st1">
                <label for="">聯絡人</label>
                <form:input id="contact_person" path="contact_person" type='contact_person'
						class='form:input-large' size="20" autocomplete="off" placeholder="請輸入聯絡人姓名" 
						onblur="checkContactPerson()" onkeyup="checkContactPerson()"/>
                <span id="idspName"></span>
                <br>
            </div>
            <!--  <label for="">上傳照片</label>
                <input type="file" name="file0" id="progressbarTWInput" multiple="multiple" /><br>
                <img src="" id="img0">-->
                <br>
                <div id="btn">
                    <input type="button" class='btn btn-primary' value="確認送出" onclick="register()">
                    <input type="reset" class='btn btn-primary' value="取消重填" class="cancel">
                </div>
            </form:form>
            <span>${SignUpError}</span>
            <button id='btn' onclick="oneclick()">一鍵輸入</button>
    </div>
    
    <script>
    function oneclick(){//一鍵輸入
		document.getElementById("email").value = "oneorzerocorp@gmail.com";
		document.getElementById("password").value = "abcd1234!";
		document.getElementById("idPwd2").value = "abcd1234!";
		document.getElementById("store_name").value = "Jacob company";
		$("#address_city").val("台北市").change();
		document.getElementById("address_area").value = "中正區";
		document.getElementById("address_road").value = "中正路";
		document.getElementById("tel").value = "02-1234567";
		document.getElementById("phone").value = "0919123456";
		document.getElementById("opentime_start").value = "08:00";
		document.getElementById("opentime_end").value = "20:00";
		document.getElementById("contact_person").value = "Mark";
	}
    function register() {
        let check = validate();
        if (check) {
        	document.forms["SignUpForm"].submit();
		} else {
			return false;
		}
    }
    </script>

    <!-- 寫上面 -->

	<jsp:include page="/fragment/footer.jsp" />
	
  </body>
</html>