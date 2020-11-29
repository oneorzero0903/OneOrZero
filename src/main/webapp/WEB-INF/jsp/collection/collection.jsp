<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<!DOCTYPE html>
<html lang="en">

  <head>
	<jsp:include page="/fragment/linkCss.jsp" />
    <style>
    .page-heading .text-content h4 {
      color:	#9370DB;
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
	color: 	#9370DB;
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
	background-color:	#9370DB;
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
	background-color: 	#9370DB;
	-webkit-transition: all 0.3s ease-in-out 0s;
    -moz-transition: all 0.3s ease-in-out 0s;
    -o-transition: all 0.3s ease-in-out 0s;
    transition: all 0.3s ease-in-out 0s;
}
.nav-link,.navbar-brand{
color:#fff
}
  </style>
 <link rel="stylesheet" href="<c:url value='/css/adminmenu.css'	/>">
  </head>

  <body >

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
<%-- 	<c:set var="funcName" value="INDST" scope="session"/> --%>
	<!-- 引入共同的頁首 -->
	<jsp:include page="/fragment/topadmin.jsp" />

    <!-- Page Content -->
    <!-- Banner Starts Here -->
    
  <h1>.</h1>
   	<div align="center" >
   	<div class="card" style="width: 300px;">
  <img src="<c:url value='/images/money.jpg' />" class="card-img-top" >
  <div class="card-body">
    <h5 class="card-title">催收系統</h5>
   </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item"><a href="<c:url value='/collection/payment' />">帳務資料查詢</a></li>
    <li class="list-group-item"><a href="<c:url value='/collection/emailList' />">郵寄通知功能</a></li>
    <li class="list-group-item"><a href="<c:url value='/collection/autodilerList' />">電催名單備註</a></li>
  </ul>
  <div class="card-body">
    <button class="btn btn-warning" onclick="calculation();">欠款計算</button>
   	<button class="btn btn-warning" onclick="demo();">製作資料</button>
  </div>
</div>
</div>
   	<script>
   	function calculation() {
   		$.ajax({
	  		type: 'GET',
	  		url: '<c:url value="/collection/calculation"	/>',
	  		success:
	  			function (data) {
	  				if (data.isOk == "ok") {
	  					alert("欠款計算成功");
	  				} else {
	  					alert("系統有誤，請洽資訊人員");
	  					window.location.href = "<c:url value='/collection/payment'	/>";
	  				}
	  			},
	  		error:
	  			function (xhr, ajaxOptions, thrownError) {
	  				alert(xhr.status + "\n" + thrownError);
	  			}
	  	});
	}
   	function demo() {
   		$.ajax({
	  		type: 'GET',
	  		url: '<c:url value="/collection/demo"	/>',
	  		success:
	  			function (data) {
	  				if (data.isOk == "ok") {
	  					alert("demo資料匯入成功");
	  				} else {
	  					alert("系統有誤，請洽資訊人員");
	  					window.location.href = "<c:url value='/collection/payment'	/>";
	  				}
	  			},
	  		error:
	  			function (xhr, ajaxOptions, thrownError) {
	  				alert(xhr.status + "\n" + thrownError);
	  			}
	  	});
	}
   	</script>

	<jsp:include page="/fragment/footer.jsp" />

  </body>
</html>	