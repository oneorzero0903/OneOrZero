<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap" rel="stylesheet">

    <title>search("咖啡");</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value='/css/vendor/bootstrap/css/bootstrap.min.css'	/>" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="<c:url value='/css/fontawesome.css'	/>">
    <link rel="stylesheet" href="<c:url value='/css/templatemo-stand-blog.css'	/>">
    <link rel="stylesheet" href="<c:url value='/css/owl.css'	/>">
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

    <!-- Header -->
    <header class="">
      <nav class="navbar navbar-expand-lg">
        <div class="container">
          <a class="navbar-brand" href="<c:url value='/'	/>"><h2>search("咖啡");<em></em></h2></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item">
                <a class="nav-link" href="<c:url value='/'	/>">首頁
                  <span class="sr-only">(current)</span>
                </a>
              </li> 
              <li class="nav-item">
                <a class="nav-link" href="<c:url value='/login/StoreLogin'	/>">登入</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="<c:url value='/signup/StoreTerms'	/>">註冊</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="<c:url value='/backEnd/storeOrder/StoreOrder'	/>">訂單管理</a>
                </a>
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
                <h4>商家頁面</h4>
                <h2>快來成為我們的合作店家</h2>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
    
    <!-- Banner Ends Here -->

	<div class="wrap">
        <h2>商家註冊</h2>
        <form action="form.html">
            <label for="email">請輸入信箱</label>
            <input type="email" name="email" id="email" class="email" placeholder="請輸入信箱">
            <br>
            <label for="password">請輸入密碼</label>
            <input type="password" id="idPwd1" name="password" placeholder="請輸入密碼" onblur="checkPwd();" onkeyup="checkPwd();" />
            <span id="idspPwd1"></span>
            <br>
            <label for="password1">請再次輸入密碼</label>
            <input type="password" id="idPwd2" placeholder="請再次輸入密碼" onblur="checkPwdReapeat();"
                onkeyup="checkPwdReapeat();" />
            <span id="idspPwd2"></span>
            <br>
            <label for="text">公司名稱</label>
            <input type="text" name="corporation" id="Store_name" class="corporation" placeholder="請輸入公司名稱">
            <div class="st1">

                <label for="" class="t1">所在縣市</label>
                <select name="country" id="country">
                    <option value="">==============</option>
                    <option value="Taipei City">Taipei City</option>
                    <option value="New Taipei City">New Taipei City</option>
                </select>
                <br>
                <label for="" class="t1">所在地區</label>
                <select name="area" id="area">
                    <option value="Zhong Zheng">中正區</option>
                </select>
                <br>
                <br>
                <label for="" class="t1">所在地路名</label>
                <input type="text" name="road" id="Address_road" placeholder="請輸入路名">
                <br> <label for="tel" class="tel">公司電話</label>
                <input type="tel" name="tel" id="Tel" placeholder="請輸入公司電話">
                <br>
                <label for="cellphone" class="cellphone">行動電話</label>
                <input type="tel" name="cellphone" id="Phone" placeholder="請輸入行動電話">
                <br>
            </div>
            <div class="st1">
                <label for="" class="t1">營業開始時間</label>
                <input type="time" name="opentime" id="Opentime_start" size="30">
            </div>
            <div class="st1">
                <label for="" class="t1" >營業結束時間</label>
                <input type="time" name="endtime" id="Opentime_end" size="30">
            </div>
            <div class="st1">
                <label for="">聯絡人</label>
                <input type="text" name="idName" id="idName" placeholder="請輸入姓名" onblur="checkContactPerson()"
                    onkeyup="checkContactPerson()">
                <span id="idspName"></span>
                <br>
                <span class="st1">(1.不可空白，2.至少2個字以上，3.必須全部為中文字)</span>
            </div>
            <!--  <label for="">上傳照片</label>
                <input type="file" name="file0" id="progressbarTWInput" multiple="multiple" /><br>
                <img src="" id="img0">-->
                <br>
                <div id="btn">
                    <input type="button" value="確認送出" class="sure" onclick="register()">
                    <input type="reset" value="取消重填" class="cancel">
                </div>
            </form>
    </div>
    
    <script>
    function register() {
        let check = validate();
        if (check) {
            var email = document.getElementById('email').value;
            var idPwd1 = document.getElementById('idPwd1').value; //Password
            var Store_name = document.getElementById('Store_name').value;
            var country = document.getElementById('country').value; //Address_county
            var area = document.getElementById('area').value; //Address_area
            var Address_road = document.getElementById('Address_road').value;
            var Tel = document.getElementById('Tel').value;
            var Phone = document.getElementById('Phone').value;
            var Opentime_start = document.getElementById('Opentime_start').value;
            var Opentime_end = document.getElementById('Opentime_end').value;
            var idName = document.getElementById('idName').value; //contact_person
            //var progressbarTWInput = document.getElementById('progressbarTWInput').value;

            var myData = {
                "email": email,
                "idPwd1": idPwd1,
                "Store_name": Store_name,
                "country": country,
                "area": area,
                "Address_road": Address_road,
                "Tel": Tel,
                "Phone": Phone,
                "Opentime_start": Opentime_start,
                "Opentime_end": Opentime_end,
                "idName": idName,
            };
            $.ajax({
                type: 'POST',
                url: '<c:url value="/signUp/StoreSignUp"	/>',
                data: { jsonData: JSON.stringify(myData) },
                dataType: 'json',

                success:
                    function (data) {
                        if (data.isOK == "ok") {
                            alert("註冊成功");
                            window.location.href = "${pageContext.request.contextPath}/jsp/SignUpOK.jsp<c:url value="/jsp/SignUpOK.jsp"	/>";
                        } else {
                            alert("輸入資料有誤");
                            window.location.href = "${pageContext.request.contextPath}/jsp/StoreSignUp.jsp";					
                        }
                    },
                error:
                    function (xhr, ajaxOptions, thrownError) {
                        alert(xhr.status + "\n" + thrownError);
                    }
            });
        }

    }
    </script>

    <!-- 寫上面 -->
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