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
.form-control{
width:300px;
}
fieldset{
background-color:#0080ff86;
width:600px;
margin:20px;
}
  </style>
  <script src="https://code.jquery.com/jquery-3.1.0.js"></script> 
  <script type="text/javascript">
  	window.onload = function() {
  		$.ajax({
		  		type: 'GET',
		  		url: '<c:url value="/isFunctDisabled"/>',
		  		success:
		  			function (list) {
		  				console.log(list.length);
		  				if (list.length > 0) {
		  					alert("您已欠款超過35天,請儘快付款,付款後才可繼續使用本功能.");
		  					location.href = "<c:url value='/indexShop' />";
		  				}
		  			},
		  		error:
		  			function (xhr, ajaxOptions, thrownError) {
		  				alert(xhr.status + "\n" + thrownError);
		  			}
		  	});		
	}
  </script>
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
	<!-- 下列敘述設定變數funcName的值為XXX，topMVC.jsp 會用到此變數 -->
	<%-- <c:set var="funcName" value="XXX" scope="session"/> --%>
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
                <h2>首頁廣告輪播設定</h2>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
    
    <!-- Banner Ends Here -->
	<div align="center">
	
		
		<form:form method='POST' modelAttribute="advertisingBean" class='form-horizontal' 
				enctype="multipart/form-data">
			<fieldset>
			<h1 style="color: #272727; margin: 10px">廣告上架</h1>
				<div class="form-group">
				
					<label class="control-label col-lg-2 col-lg-2 font-weight-bold" style="margin:20px" for='title'>標題</label>
					<div class="col-lg-10">
						 <form:input id="title" path="title" type='text' class='form-control' autocomplete="off"/>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2 font-weight-bold"  for='description'>描述</label>
					<div class="col-lg-10">
						<form:input id="description" path="description" type='text' class='form-control' />
					</div>
				</div>

				<div class="form-group">
				
					<label for="category">廣告開始日期</label>
					<div class='col-lg-10'>
						<input id="adTimeStr"  type='date' onblur="checkDate()" class='form-control' />
						<form:input hidden="hidden" id="adStartTime" path="adStartTime" type='text'
						class='form:input-large' />
					</div>
				</div>
				
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2 font-weight-bold' for="adImage">上傳圖片</label>
					<div class='col-lg-10'>
						<form:input id="adImage" path="adImage" type='file' accept='image/*'
							class='btn btn-dark' />
					</div>
					<br>
					<div>
					<img style="width: 400px;" id="showImg">  <!-- 預覽圖片用 -->
					</div>
				</div>
				<div>
					
				<p>${ErrorMsg}</p>
				</div>
				
				<div class="form-group">
					<div class='col-lg-offset-2 col-lg-10'>
						<input id="btnAdd" type='submit' class='btn btn-primary'
							value='送出' />
					</div>
				</div>
			</fieldset>
		</form:form>
		
		<br>
		<button id='btn' class="btn btn-dark"onclick="oneclick()">一鍵輸入</button>
	</div>
	   
		
	
	
	<script type="text/javascript">
		//當使用者圖片選擇完畢,在畫面上show出來預覽
		
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$("#showImg").attr("src", e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#adImage").change(function() {
			readURL(this);
		});

		//只可選擇今天開始之日期
		function convertToISO(timebit) {
		  timebit.setHours(0, -timebit.getTimezoneOffset(), 0, 0);
		  var isodate = timebit.toISOString().slice(0,10);	
		  return isodate;
		}
		var adTimeStr = document.getElementById("adTimeStr");
		var currentDate = new Date();
		adTimeStr.min = new Date();
		adTimeStr.min = convertToISO(currentDate);
		
		function checkDate() {
			var adTimeStr = document.getElementById("adTimeStr").value;
			if (adTimeStr == "") {
				return false;
			} else {
				document.getElementById("adStartTime").value = new Date(adTimeStr).getTime();
				return true;
			}
		}
		
		function checkTitle() {
			var title = document.getElementById("title").value;
			if (title == "") {
				return false;
			} else {
				return true;
			}
		}
		
		function checkFile() {
			var adImage = document.getElementById("adImage").value
			if (adImage == "") {
				return false;
			} else {
				return true;
			}
		}
		
		function submit() {
			let checkAll = checkFile() && checkTitle() && checkDate();
			if (checkAll) document.forms["BuyAdForm"].submit();
		}
		
		function oneclick() {
			document.getElementById("title").value = "全品項買一送十";
			document.getElementById("description").value = "全品項買一送十";

		}
	
	</script>
    
    <jsp:include page="/fragment/footer.jsp" />

  </body>
</html>