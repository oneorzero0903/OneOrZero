<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="zh-TW">

<head>
<jsp:include page="/fragment/linkCss.jsp" />
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<link rel="stylesheet"
	href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<!-- <link rel="stylesheet" href="jqueryui/style.css"> -->
<style>
.login-i {
	wight: 500px;
	margin: auto;
	border: 1px solid transparent;
}
</style>
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
	<!-- 下列敘述設定變數funcName的值為XXX，topMVC.jsp 會用到此變數 -->
	<%-- <c:set var="funcName" value="XXX" scope="session"/> --%>
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
							<h4>訂位</h4>
							<h2>訂下你神聖的一位!</h2>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<!-- Banner Ends Here -->
	<script>
	var dayChoose;
		$(function() {
			$("#datepicker")
					.datepicker(
							{
								dateFormat : "yy/mm/dd-DD",
								minDate : -0,
								onSelect : function(dateText, inst) {
									var xhr = new XMLHttpRequest();
									var selectElement = document.getElementById('person');
									$("#person").empty();
									datas = {
										date : dateText
									}
									dayChoose = dateText;
									xhr.open("POST", "<c:url value='/orders/dayBooking' />", true);
									xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
									xhr.send(JSON.stringify(datas));
									xhr.onreadystatechange = function() {
										if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 201)) {
											result = JSON.parse(xhr.responseText);
											
												for (var i = 0; i < result.settingList.length; i++) {//撈出當日有設定訂單的包廂
													if (result.settingList[i] != null){
														console.log(result.settingList[i])
														var option = new Option(result.settingList[i]);
														selectElement.options[selectElement.options.length] = option;
													} else {continue;}
												}
										}
									}
								}
							});
		});
		function checkPersonVal(setting_IdVal) {//撈出可容納人數
	 		var xhr = new XMLHttpRequest();
	 		xhr.open("POST", "<c:url value='/orders/personToBooking/" + setting_IdVal.val() + "' />", true);
			xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 201)) {
					result = JSON.parse(xhr.responseText);
					setting_IdVal.next().text("可容納" + result.personToBookingList + "人");
				}
			}
	 	}
		
	</script>
	<div class="form-group"
		style="background-color: #d26900; margin: 50px 300px;">
		<div class="login-i">

			<div id="datepicker" align="center" style="margin: 50px"></div>
			<br>
			<div align="center">
				<h5>可訂位包廂:</h5>
				<select id="person" onclick="checkPersonVal($(this))">
				</select><span></span>
			</div>
			<div id='timeArea' align="center" style='height: 150px;'
				class='center'></div>
		</div>
	</div>
	<script>
	
	$("#person").change(function(){//撈出可訂位時間(time)
		var xhr3 = new XMLHttpRequest();
		var selectElement = document.getElementById('person');
		var setting_IdVal = selectElement.options[ selectElement.selectedIndex ].value;
		xhr3.open("POST", "<c:url value='/orders/timeToBooking/"+ setting_IdVal +"' />", true);
		xhr3.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
		xhr3.send();
		xhr3.onreadystatechange = function() {
			if (xhr3.readyState == 4 && xhr3.status == 200) {
				if (JSON.parse(xhr3.responseText != null)) {
					result = JSON.parse(xhr3.responseText);
					displayTimes(result, setting_IdVal);
				}else{
					alert("fail");
				}
				
			}
		}
	})
	function displayTimes(result, setting_IdVal){//顯示可訂位時間按鈕
		var content = "<table border='1'  bgcolor='#fbdb98'>";
		content += "<tr><td width='100'>可訂位時間:</td>";
		content += "<td rowspan='4'>";
		for (var i = 0 ;i < result.timeToBookingList.length; i++){
			content += "<button class=\"btn btn-primary\" onclick=\"order('" + dayChoose + "','" + setting_IdVal + "','" + result.timeToBookingList[i] + "'" + ")\">"	+ result.timeToBookingList[i]
					+ "</button>&nbsp;";
		}
		content += "</td></tr>";
		content += "</table>";
		timeArea.innerHTML = content;
	}	
		function order(dayChoose, setting_IdVal, time){//轉到確認訂單頁面
			var xhr4 = new XMLHttpRequest();
			datas = {
				day : dayChoose,
				setting_id :　setting_IdVal,
				times : time
			}
			xhr4.open("POST", "<c:url value='/orders/orderOk' />", true);
			xhr4.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
			xhr4.send(JSON.stringify(datas));
			xhr4.onreadystatechange = function() {
				if (xhr4.readyState == 4 && (xhr4.status == 200 || xhr4.status == 201)) {
					result = JSON.parse(xhr4.responseText);
						if(result.isOk == "ok"){
							window.location.href = "<c:url value='/orders/orderOks' />";
						}else {
							alert("fail");
						}
				}
			}
		}
	</script>

	<jsp:include page="/fragment/footer.jsp" />

</body>
</html>