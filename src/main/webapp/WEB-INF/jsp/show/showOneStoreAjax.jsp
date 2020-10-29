<%@ page language="java" contentType="text/html; charset=UTF-8"
 	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 <!DOCTYPE html>
 <html lang="zh-TW">
 <style>
 	div.mainDiv {
 	color: white;
 	}
 </style>
 <head>
 <jsp:include page="/fragment/linkCss.jsp" />
 <script>
 	window.onload = function() {
 		
 		var mainDiv = document.getElementById("mainDiv");
 		var xhr = new XMLHttpRequest();
 		xhr.open("GET", "<c:url value='/show/showOneStore/"+ ${sid} +"' />",true);
 		xhr.send();
 		xhr.onreadystatechange = function() {
 			if (xhr.readyState == 4 && xhr.status == 200) {
 				var store = JSON.parse(xhr.responseText);
 				var content = "";
 					content += "<div>"+
 					"<table>" +
 					"<tr><td align='center'>"+ 
 					"<img class='shopImg' height='500' width='625' src='<c:url value='/" +store.imgPath + "' />' />"+"</td></tr>" +
 					"<tr><td>" + store.store_name +"</td></tr>" +
 					"<tr><td>" + store.address_area +"</td></tr>" +
 					"<tr><td>" +"營業開始："+ store.opentime_start +"</td></tr>" +
 					"<tr><td>" +"營業結束："+ store.opentime_end +"</td></tr>" +
 					"<tr><td>" +"地址："+ store.address_city+ store.address_area + store.address_road +"</td></tr>" +
 					"</table></div>";
 				
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

 	<div align="center" id="mainDiv" class="mainDiv"></div>

 	<jsp:include page="/fragment/footer.jsp" />

 </body>
 </html> 