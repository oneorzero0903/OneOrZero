<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="zh-TW">

<head>
<jsp:include page="/fragment/linkCss.jsp" />
<style>
.page-heading .text-content h4 {
	color: #9370DB;
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
	color: #9370DB;
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
	background-color: #9370DB;
	color: #fff;
	font-size: 13px;
	font-weight: 500;
	padding: 12px 20px;
	text-transform: uppercase;
	transition: all .3s;
}

header {
	position: inherit;
	z-index: 99999;
	width: 100%;
	height: 100px;
	background-color: #9370DB;
	-webkit-transition: all 0.3s ease-in-out 0s;
	-moz-transition: all 0.3s ease-in-out 0s;
	-o-transition: all 0.3s ease-in-out 0s;
	transition: all 0.3s ease-in-out 0s;
}

.nav-link, .navbar-brand {
	color: #fff
}

.warp {
	text-align: center;
}
/*  .side_by_side{  */
/*  float: left;  */
/*  }  */
</style>
<link rel="stylesheet" href="<c:url value='/css/adminmenu.css'	/>">
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="<c:url value='/js/report.js'	/>"></script>
<script src="<c:url value='/js/country.js'	/>"></script>
</head>

<body>

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
	<!-- 各區域的咖啡店總數 -->


	<div class="wrap">
		<select id="area1">
			<option>台北市</option>
			<option>新北市</option>
		</select>

		<div id="coffeeShopTotal"></div>
		<br>
		<!-- 各區域顧客訂位狀況 -->
		<select id="address_city1"></select> <select id="address_area1"></select>
		<div class="row">
			<div id="TimeOrders" class="side_by_side col"></div>
			<div id="DayOrders" class="side_by_side col""></div>
		</div>
		<br>
		<!-- 每月應收帳款及實收帳款總收入 -->
		<select id="area1">
			<option>台北市</option>
			<option>新北市</option>
		</select>
		<div id="payment"></div>
		<br>
		<!-- 商品各個項目銷售 -->
		<select id="coffeeproduct">
			<option value="bean">咖啡豆熱銷TOP 5</option>
			<option value="food">咖啡食品熱銷TOP 10</option>
			<option value="tool">咖啡用品熱銷TOP 10</option>
		</select>
		<div id="products"></div>
	</div>
	<jsp:include page="/fragment/footer.jsp" />

</body>
</html>