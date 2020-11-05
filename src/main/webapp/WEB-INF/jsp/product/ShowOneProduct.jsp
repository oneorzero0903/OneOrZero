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
 		xhr.open("GET", "<c:url value='/product/ShowOneProduct.json/"+ ${pId} +"' />",true);
 		xhr.send();
 		xhr.onreadystatechange = function() {
 			if (xhr.readyState == 4 && xhr.status == 200) {
 				var product = JSON.parse(xhr.responseText);
 				var content = "";
 					content += "<div>"+
 					"<table>" +
 					"<tr><td align='center'>";
 					if (product.imgPath != null) {  //表示此筆資料在DB內有imgPath
 						content += "<img class='shopImg' height='500' width='625' src='<c:url value='/" +product.imgPath + "' />' />"+"</td></tr>";
 					} else { 						//表示此筆資料在DB內imgPath無資料，必須透過controller將BLOB欄位的二進位圖片資料轉換成圖片show出來
 						content += "<img class='shopImg' height='500' width='625' src='<c:url value='/getProductImg/"
	 				        + product.id+"' />'></a>" 
 					}
 					 content += "<tr><td>品名 : " + product.name +"</td></tr>" +
 								"<tr><td>金額 : " + product.price +"</td></tr>" +
 								"<tr><td>庫存 : " + product.stock +"</td></tr>" +
 								"<tr><td>描述 : " + product.description +"</td></tr>" +
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