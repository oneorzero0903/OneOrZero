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

.nav-link, .navbar-brand {
	color: #fff
}
.form-control{
width:300px
}
.formw{
width:600px;
background-color:#0080ff86;
margin:40px;
}

</style>
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
							<h2>廣告方案選擇</h2>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<!-- Banner Ends Here -->
	<div align="center">
<div class=formw>

	<img src="<c:url value='/images/adpic.gif'/>">
		<form:form method="POST" modelAttribute="programBean" >
		
			<div class="form-group">
					<div class="col-lg-10">
					<br>
						<h1 style="color: #272727; margin: 10px">廣告輪播 ($399/月)</h1>
						<form:input hidden="hidden" id="name" path="name" type="text"
							class="form-control" value="programAD" />
						<br>
					</div>
					<div class="form-group">
					<label for="startTimeStr">選擇方案生效日期 </label>
					<p>方案維持一年</p>
					<div class='col-lg-10'>
						<input id="startTimeStr"  type='date' onblur="changeLong()" class='form-control' />
						<form:input hidden="hidden" id="startTime" path="startTime" type='text'
						class='form-control' />
					</div>
					<p>${DateEmptyError}</p>
				</div>
					
					<div class='col-lg-offset-2 col-lg-10'>
						<input id="btnAdd" type='submit' class="btn btn-primary" value='送出' />
						<br>
					</div>
					<br>
					<p>${ErrorMsg}</p>
					<br>
			</div>
		</form:form>
</div>
	</div>


	<!-- 寫上面 -->

	<jsp:include page="/fragment/footer.jsp" />
	<script type="text/javascript">
		function changeLong() {
			var startTimeStr = document.getElementById("startTimeStr").value;
			if (startTimeStr == "") {
				return false;
			} else {
				document.getElementById("startTime").value = new Date(startTimeStr).getTime();
				return true;
			}
		}
		
		//只可選擇今天開始之日期
		function convertToISO(timebit) {
		  timebit.setHours(0, -timebit.getTimezoneOffset(), 0, 0);
		  var isodate = timebit.toISOString().slice(0,10);	
		  return isodate;
		}
		var startTimeStr = document.getElementById("startTimeStr");
		var currentDate = new Date();
		startTimeStr.min = new Date();
		startTimeStr.min = convertToISO(currentDate);
	</script>
</body>
</html>