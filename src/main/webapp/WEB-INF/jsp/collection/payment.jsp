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
.form span {
      display: none;
}
  </style>
 <link rel="stylesheet" href="<c:url value='/css/adminmenu.css'	/>">
 <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  
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
   	<div align="center">
   		<div class="card" style="width: 300px;">
  <h5 class="card-header">帳務資料查詢</h5>
  <div class="card-body">
    <h5 class="card-title">請輸入店家Email</h5>
    <input class="form-group" id="account" type="text"><br>
    <button id="paymentDtl" class="btn btn-warning" onclick="getPaymentDtl($('#account'));">查詢</button> 
    <button id="demo" class="btn btn-success" onclick="demo();">demo</button> 
  </div>
</div>
   	</div>
   	<div class="wrap" align="center"></div>
   
   	<script>
   	function demo(){
   		var demo = document.getElementById("demo");
   		demo.onclick = function() {
			document.getElementById("account").value = "uni.cafe.studio2@gmail.com";
		}
   	}
   	
   	function getPaymentDtl(account){
   		if (account.val() == ""){
   			alert("請輸入查詢帳號、Email");
   		}else{
   			var accountVal = account.val();
   			var xhr = new XMLHttpRequest();
   			let search = {
   				searchVal : accountVal
   			}
   			$.ajax({
   			  		type: 'POST',
   			  		url: '<c:url value="/collection/getPaymentDtl"	/>',
   			  		data: JSON.stringify(search),
   			  		contentType:"application/json;charset=UTF-8",
   			  		dataType: 'json',
   			  		success:
   			  			function (data) {
   			  				if (data.paymentDtlList != null) {
   			  					$('.wrap').empty();
   			  					let template = "<div class='menuList'><table style='border:3px #FFAC55 solid;padding:5px;color:orange;' rules='all' cellpadding='5';>";
   			  				    template += "<tr><th>店家名稱<th>繳款區間<th>欠款資訊";
   			  				    for(var i = 0; i < data.paymentDtlList.length; i++){
   			  				   		template += "<tr><td>" + data.paymentDtlList[i].store_name; 
   			  				   		template += "<td>" + data.paymentDtlList[i].paymentStart + "~" + data.paymentDtlList[i].paymentEnd; 
   			  				   		template += "<td><button onclick=\"paymentDtl("+ i +");\" >Detail</button>";
   			  				    }
   			  					template += "</table></div>";
   			  					
   			  					$('.wrap').append(template)
   			  				} else {
   			  					alert("該帳號查無欠款");
   			  					window.location.href = "<c:url value='/collection/payment'	/>";
   			  				}
   			  			},
   			  		error:
   			  			function (xhr, ajaxOptions, thrownError) {
   			  				alert(xhr.status + "\n" + thrownError);
   			  			}
   			  	});
   		}
   	}
   	function paymentDtl(i){
   		$.ajax({
		  		type: 'POST',
		  		url: '<c:url value="/collection/paymentDtl/'+ i +'"	/>',
		  		contentType:"application/json;charset=UTF-8",
		  		dataType: 'json',
		  		success:
		  			function (data) {
		  				if (data.isOk == "ok") {
		  					window.open('<c:url value="/collection/paymentDtl" />','PaymentDtl',config='height=450,width=690,left=500px,top=100px,resizable=no,location=no,menubar=no,status=no');
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