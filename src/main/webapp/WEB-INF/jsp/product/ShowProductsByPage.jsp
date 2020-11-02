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
		xhr.open("GET", "<c:url value='/product/pagingProductsData.json' />", true);
		xhr.send();
		xhr.onreadystatechange = function() {

			if (xhr.readyState == 4 && xhr.status == 200) {
				var products = JSON.parse(xhr.responseText);
				var content = "";
				for (var i = 0; i < products.length; i++) {
					content += "<div class='float'>"
							+ "<table>"
							+ "<tr><td align='center'>"
							+ "<img class='shopImg' height='200' width='250' src='<c:url value='/"+ products[i].imgPath +"' />' />"
							+ "</td></tr>" 
							+ "<tr><td>" + products[i].name + "</td></tr>"  
							+ "<tr><td>" + "\$" + products[i].price + "</td></tr>"
							+ "</table></div>";
				}
				mainDiv.innerHTML = content;
				
				var totalProductPages = ${totalProductPages};
				var pageDiv = document.getElementById("pageDiv");
				var pageLink = "";
				for(var i = 1 ; i <= totalProductPages ; i++ ){
					pageLink += "<button class='pageButton' onclick='showByPage("+ i +")'>" + i + "</button>"
				}
				pageDiv.innerHTML = pageLink;
			}
		}
	}
	
	function showByPage(no) {
		var mainDiv = document.getElementById("mainDiv");
		var queryString = "?pageNo=" + no;
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/product/pagingProductsData.json' />" +queryString, true);
		xhr.send();
		xhr.onreadystatechange = function() {

			if (xhr.readyState == 4 && xhr.status == 200) {
				var products = JSON.parse(xhr.responseText);
				var content = "";
				for (var i = 0; i < products.length; i++) {
					content += "<div class='float'>"
							+ "<table>"
							+ "<tr><td align='center'>"
							+ "<img class='shopImg' height='200' width='250' src='<c:url value='/"+ products[i].imgPath +"' />' />"
							+ "</td></tr>" 
							+ "<tr><td>" + products[i].name + "</td></tr>"  
							+ "<tr><td>" + "\$" + products[i].price + "</td></tr>"
							+ "</table></div>";
				}
				mainDiv.innerHTML = content;
			}
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

	<div align="center" id="mainDiv"></div>
	<div style="width: 10px;">&nbsp;</div>
	<div style="color: white;" align="center" id="pageDiv"></div>

	<jsp:include page="/fragment/footer.jsp" />

</body>
</html>
