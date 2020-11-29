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
   	<br><br><br><br><br>
   	<script>
   	var emailAll;
	window.onload = function() {
		$.ajax({
		  		type: 'POST',
		  		url: '<c:url value="/collection/getEmailList"	/>',
		  		contentType:"application/json;charset=UTF-8",
		  		dataType: 'json',
		  		success:
		  			function (data) {
		  				if (data.emailList != null) {
		  					emailAll = data.emailList;
		  					let template = "<div class='menuList'><table style='border:3px #FFAC55 solid;padding:5px;color:orange;' rules='all' cellpadding='5';>";
		  				    template += "<tr><th>商家編號<th>Email<th>商家名稱<th>欠款日期<th>欠款金額";
		  				    for(var i = 0; i < data.emailList.length; i++){
		  				   		template += "<tr><td>" + data.emailList[i].store_id; 
		  				   		template += "<td>" + data.emailList[i].email; 
		  				   		template += "<td>" + data.emailList[i].store_name; 
		  				  		template += "<td>" + data.emailList[i].dueDayCount; 
		  				   		template += "<td>" + data.emailList[i].balance_due;
		  				    }
		  					template += "</table></div>";
		  					
		  					$('.wrap').append(template)
		  				} else {
		  					alert("今日無需寄信商家");
		  					window.location.href = "<c:url value='/collection/collection'	/>";
		  				}
		  			},
		  		error:
		  			function (xhr, ajaxOptions, thrownError) {
		  				alert(xhr.status + "\n" + thrownError);
		  			}
		  	});

	}
</script>
   	
   	
	<div class="wrap" align="center"></div>
	<div align="center">
		<button id="submit" onclick="sendMail();">確認寄出</button>
	</div>
	<script>
	var send = {
		sendMail: emailAll
	}
	function sendMail() {
		document.getElementById("submit").disabled = true;
		$.ajax({
	  		type: 'POST',
	  		url: '<c:url value="/collection/sendmail"	/>',
	  		contentType:"application/json;charset=UTF-8",
	  		dataType: 'json',
	  		success:
	  			function (data) {
	  				if (data.isOk == "ok") {
	  					alert("郵件寄送完成");
	  					window.location.href = "<c:url value='/collection/collection'	/>";
	  				} else {
	  					alert("系統錯誤，請洽資訊人員");
	  					window.location.href = "<c:url value='/collection/emailList'	/>";
	  					document.getElementById("submit").disabled = false;
	  				}
	  			},
	  		error:
	  			function (xhr, ajaxOptions, thrownError) {
	  				alert(xhr.status + "\n" + thrownError);
	  				document.getElementById("submit").disabled = false;
	  			}
	  	});
	}
	</script>
	
	<jsp:include page="/fragment/footer.jsp" />

  </body>
</html>