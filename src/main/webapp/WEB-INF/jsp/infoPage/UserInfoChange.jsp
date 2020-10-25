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

	<script src="https://code.jquery.com/jquery-3.1.0.js"> </script>
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
                <h4>about us</h4>
                <h2>more about us!</h2>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>

<div align="center">
	<table style="background-color: white;">
 	<tr><td>信箱</td><td><input type="text" id="email" name="account" value="${member.email}" disabled placeholder="未填寫" size="30"></td></tr>
 	<tr><td>名稱</td><td><input type="text" id="name" name="name" value="${member.name}" placeholder="未填寫" size="30"></td></tr>
 	<tr><td>生日</td><td><input type="date" id="birthday" value="${member.birthday}" placeholder="未填寫" size="30"></td></tr>
	<tr><td>性別</td><td>
                <input type="radio" id="gender" name="gender" value="M">男
                <input type="radio" id="gender" name="gender" value="F">女
                <input type="radio" id="gender" name="gender" value="N" checked="checked">不方便透漏</td></tr>
 	
 	<tr><td>電話</td><td><input type="text" id="tel" value="${member.tel}" placeholder="未填寫" size="30"></td></tr>
 	<tr><td>創建日期</td><td><input type="text" value="${member.create_dt}" placeholder="未填寫" disabled size="30"></td></tr>
  	<tr><td>更新日期</td><td><input type="text" value="${member.update_dt}" placeholder="未填寫" disabled size="30"></td></tr>
 	<tr><td>等級</td><td><input type="text" value="${member.vip}" placeholder="未填寫" disabled size="30"></td></tr>
	</table>
	<button id="updateBtn">送出</button>	
	<div id="divResult"></div>
</div>
	
	<script>
		 var updateBtn = document.getElementById("updateBtn");
		 var id = ${member.member_id};
		 
		 updateBtn.onclick = function () {
			var name = document.getElementById('name').value;
			var birthday = document.getElementById('birthday').value;
			var gender = document.querySelector('input[name="gender"]:checked').value;
			console.log(gender);
			var tel = document.getElementById('tel').value;
			var email = document.getElementById('email').value;
			console.log();
			var xhr = new XMLHttpRequest();
			xhr.open("PUT", "<c:url value='/infoPage/UserInfoChange/' />" +id, true);
			var jsonMember = {
					"birthday": birthday,
					"gender": gender,
					"name": name,
					"tel": tel,
					"member_id": id,
			}
			xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	   		xhr.send(JSON.stringify(jsonMember));
			xhr.onreadystatechange = function () {
				console.log(xhr.status);
				if (xhr.readyState == 4 && ( xhr.status == 200 || xhr.status == 201 )) {
					result = JSON.parse(xhr.responseText);
					if (result.success) {
						document.getElementById("divResult").innerHTML = 
							"<font color='GREEN'>"+result.success+"</font>";
					} else if (result.fail) {
						document.getElementById("divResult").innerHTML = 
							"<font color='RED'>"+result.fail+"</font>";
					}
				}
			}
		}
	</script>
	
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