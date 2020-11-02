<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="zh-TW">

<head>
<jsp:include page="/fragment/linkCss.jsp" />
<style>
div.float {
	width: 33.33%;
	float: left;
	color: white;
	padding-top: 30px;
	padding-bottom: 30px;
}

img.shopImg:hover {
	opacity: 0.3;
	transition: all 0.6s;
}

img.shopImg {
	border-bottom-left-radius: 50px;
	border-top-right-radius: 50px;
}

div.navDiv {
	padding-top: 100px;
	padding-bottom: 100px;
	margin-bottom: 100pa;
}

button.pageBtn {
	border-radius: 100%;
	background-color: #D2691E;
}
</style>
<script>
	window.onload = function() {
		var mainDiv = document.getElementById("mainDiv");
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/show/pagingStoresData.json' />", true);
		xhr.send();
		xhr.onreadystatechange = function() {

			if (xhr.readyState == 4 && xhr.status == 200) {
				var stores = JSON.parse(xhr.responseText);
				var content = "";

				for (var i = 0; i < stores.length; i++) {
					content += "<div class='float'>"
							+ "<table>"
							+ "<tr><td align='center'>"
							+ "<a href='<c:url value='/show/showOneStoreAjax/"+ stores[i].store_id + "' />'>"
							+ "<img class='shopImg' height='200' width='250' src='<c:url value='/"+ stores[i].imgPath +"' />' />"
							+ "</a></td></tr>" + "<tr><td>"
							+ stores[i].store_name + "</td></tr>" + "<tr><td>"
							+ stores[i].address_area + "</td></tr>"
							+ "<tr><td>" + "營業開始：" + stores[i].opentime_start
							+ "</td></tr>" + "<tr><td>" + "營業結束："
							+ stores[i].opentime_end + "</td></tr>"
							+ "</table></div>";
				}
				mainDiv.innerHTML = content;
			}
		}
		var totalPages = ${totalPages};
		var pageDiv = document.getElementById("pageDiv");
		var pageLink = "";
		for (var i = 1; i <= totalPages; i++) {
			pageLink += "<button class='pageBtn' onclick='showByPage(" + i
					+ ")'>" + i + "</button>   ";
		}
		pageDiv.innerHTML = pageLink;
		var areaBtn = document.getElementById("areaBtn");
		areaBtn.onclick = showByArea;
	}

	function showByPage(no) {
		var mainDiv = document.getElementById("mainDiv");
		var queryString = "?pageNo=" + no;
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/show/pagingStoresData.json' />"
				+ queryString, true);
		xhr.send();
		xhr.onreadystatechange = function() {

			if (xhr.readyState == 4 && xhr.status == 200) {
				var stores = JSON.parse(xhr.responseText);
				var content = "";

				for (var i = 0; i < stores.length; i++) {
					content += "<div class='float'>"
							+ "<table>"
							+ "<tr><td align='center'>"
							+ "<a href='<c:url value='/show/showOneStoreAjax/"+ stores[i].store_id + "' />'>"
							+ "<img class='shopImg' height='200' width='250' src='<c:url value='/"+ stores[i].imgPath +"' />' />"
							+ "</a></td></tr>" + "<tr><td>"
							+ stores[i].store_name + "</td></tr>" + "<tr><td>"
							+ stores[i].address_area + "</td></tr>"
							+ "<tr><td>" + "營業開始：" + stores[i].opentime_start
							+ "</td></tr>" + "<tr><td>" + "營業結束："
							+ stores[i].opentime_end + "</td></tr>"
							+ "</table></div>";
				}
				mainDiv.innerHTML = content;
				
			}
		}
	}
	
	function showByArea() {
		var area = document.getElementById("areaId").value;
		var mainDiv = document.getElementById("mainDiv");
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/show/pagingStoresData.json/"+ area +"' />", true);
		xhr.send();
		xhr.onreadystatechange = function() {

			if (xhr.readyState == 4 && xhr.status == 200) {
				var stores = JSON.parse(xhr.responseText);
				var content = "";

				for (var i = 0; i < stores.length; i++) {
					content += "<div class='float'>"
							+ "<table>"
							+ "<tr><td align='center'>"
							+ "<a href='<c:url value='/show/showOneStoreAjax/"+ stores[i].store_id + "' />'>"
							+ "<img class='shopImg' height='200' width='250' src='<c:url value='/"+ stores[i].imgPath +"' />' />"
							+ "</a></td></tr>" + "<tr><td>"
							+ stores[i].store_name + "</td></tr>" + "<tr><td>"
							+ stores[i].address_area + "</td></tr>"
							+ "<tr><td>" + "營業開始：" + stores[i].opentime_start
							+ "</td></tr>" + "<tr><td>" + "營業結束："
							+ stores[i].opentime_end + "</td></tr>"
							+ "</table></div>";
				}
				if (stores.length == 0) mainDiv.innerHTML = "<p style='color: white;'>查無資料 請更改搜尋條件</p>";
				else mainDiv.innerHTML = content;
			}
		}
		var pageDiv = document.getElementById("pageDiv");
		if (area.length != 3) {
			var pageLink = "";
			for (var i = 1; i <= 4; i++) {
				pageLink += "<button class='pageBtn' onclick='showByPage(" + i
						+ ")'>" + i + "</button>   ";
			}
			pageDiv.innerHTML = pageLink;
		} else {
			pageDiv.innerHTML = "";
		}
	}
	
</script>

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
							<h4>about us</h4>
							<h2>more about us!</h2>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<!-- Banner Ends Here -->
	<div>
		<select id="areaId" onfocus="changeSize()" onblur="changeBack()">
			<option disabled="disabled" selected="selected"></option>
			<option value="不限">不限</option>
			<option value="中正區">中正區</option>
			<option value="大同區">大同區</option>
			<option value="中山區">中山區</option>
			<option value="松山區">松山區</option>
			<option value="大安區">大安區</option>
			<option value="萬華區">萬華區</option>
			<option value="信義區">信義區</option>
			<option value="士林區">士林區</option>
			<option value="北投區">北投區</option>
			<option value="內湖區">內湖區</option>
			<option value="南港區">南港區</option>
			<option value="文山區">文山區</option>
			<option value="萬里區">萬里區</option>
			<option value="金山區">金山區</option>
			<option value="板橋區">板橋區</option>
			<option value="汐止區">汐止區</option>
			<option value="深坑區">深坑區</option>
			<option value="石碇區">石碇區</option>
			<option value="瑞芳區">瑞芳區</option>
			<option value="平溪區">平溪區</option>
			<option value="雙溪區">雙溪區</option>
			<option value="貢寮區">貢寮區</option>
			<option value="新店區">新店區</option>
			<option value="坪林區">坪林區</option>
			<option value="烏來區">烏來區</option>
			<option value="永和區">永和區</option>
			<option value="中和區">中和區</option>
			<option value="土城區">土城區</option>
			<option value="三峽區">三峽區</option>
			<option value="樹林區">樹林區</option>
			<option value="鶯歌區">鶯歌區</option>
			<option value="三重區">三重區</option>
			<option value="新莊區">新莊區</option>
			<option value="泰山區">泰山區</option>
			<option value="林口區">林口區</option>
			<option value="蘆洲區">蘆洲區</option>
			<option value="五股區">五股區</option>
			<option value="八里區">八里區</option>
			<option value="淡水區">淡水區</option>
			<option value="三芝區">三芝區</option>
			<option value="石門區">石門區</option>
		</select>	
		<button id="areaBtn">送出</button>
	</div>
	<div align="center" id="mainDiv"></div>
	<div style="width: 10px;">&nbsp;</div>
	<div style="color: white;" align="center" id="pageDiv"></div>

	<jsp:include page="/fragment/footer.jsp" />
	<script type="text/javascript">
		function changeSize() {
			document.getElementById("areaId").size = '6';
		}
		function changeBack() {
			document.getElementById("areaId").size = '1';
		}
	</script>
</body>
</html>
