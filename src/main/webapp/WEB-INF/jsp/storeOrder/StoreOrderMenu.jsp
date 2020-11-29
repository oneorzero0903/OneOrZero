<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<!DOCTYPE html>
<html lang="en">

  <head>
	<jsp:include page="/fragment/linkCss.jsp" />
	<link rel="stylesheet"
	href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
	<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
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
width:300px
}
.formw{
width:600px;
background-color:#0080ff86;
margin:40px;
padding:40px;
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
	<c:set var="funcName" value="ORDST" scope="session"/>
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
                <h4>訂單查詢頁面</h4>
                <h2>看看有誰訂位囉</h2>
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
							onSelect : function(dateText, inst) {
								var xhr = new XMLHttpRequest();
								var selectElement = document.getElementById('person');
								$("#person").empty();
								datas = {
									date : dateText
								}
								dayChoose = dateText;
								xhr.open("POST", "<c:url value='/storeOrders/dayBooking' />", true);
								xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
								xhr.send(JSON.stringify(datas));
								xhr.onreadystatechange = function() {
									if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 201)) {
										result = JSON.parse(xhr.responseText);
										
											for (var i = 0; i < result.settingList.length; i++) {
												if (result.settingList[i] != null){
													console.log(result.settingList[i])
													var option = new Option(result.settingList[i]);
													selectElement.options[selectElement.options.length] = option;
													times();
												} else {continue;}
											}
									}
								}
							}
						});
	});
	$("#person").change(function(){//撈出可訂位時間(time)
		times();
	})
	function times(){
		var xhr3 = new XMLHttpRequest();
		var selectElement = document.getElementById('person');
		var setting_IdVal = selectElement.options[ selectElement.selectedIndex ].value;
		xhr3.open("POST", "<c:url value='/storeOrders/orders/"+ setting_IdVal +"' />", true);
		xhr3.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
		xhr3.send();
		xhr3.onreadystatechange = function() {
			if (xhr3.readyState == 4 && xhr3.status == 200) {
				if (JSON.parse(xhr3.responseText != null)) {
					result = JSON.parse(xhr3.responseText);
					display(result, setting_IdVal);
				}else{
					alert("fail");
				}
				
			}
		}
	}
	function display(result, setting_IdVal){//顯示訂位紀錄
		//訂位姓名，包廂，時間，訂位時段，訂位狀況(成功/已取消)
		var content = "<table border='1'  bgcolor='#fbdb98'>";
		content += "<tr><th>訂位姓名<th>包廂號碼<th>時間<th>訂位時段<th>訂位狀態";
		for (var i = 0 ;i < result.ordersList.length; i++){
			content += "<tr><td>" + result.ordersList[i].name;
			content += "<td>" + result.ordersList[i].box;
			content += "<td>" + result.ordersList[i].day;
			content += "<td>" + result.ordersList[i].time;
			content += "<td>" + result.ordersList[i].status;
		}
		content += "</table>";
		timeArea.innerHTML = content;
	}	
	</script>
		<div align="center">
	<div class="formw">
	<div id="datepicker" align="center" style="margin: 50px"></div>
	
			<br>
		
			
				<h5>可訂位包廂:</h5>
				<select id="person" class="form-control">
				</select><span></span>
			</div>
			<div id='timeArea' align="center" style='height: 150px;'
				class='center form-control'></div>
    <!-- 寫上面 -->
    </div>
    <jsp:include page="/fragment/footer.jsp" />

  </body>
</html>