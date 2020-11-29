<<<<<<< HEAD
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
 	#cartImg {
	padding-left:10px;
	width:120px;
	border-radius:50px;
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
 								"<tr><td align='center'><select class='selectpicker' id='quantityId' ><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option></select>" + 
								"<a onclick='addToCart("+ product.id +")'><img id='cartImg' src='<c:url value='/images/addToCart.png' />' /></a></td></tr>" + 
 								"</table></div>";
 					mainDiv.innerHTML = content;
 				
 			}
 		}
 		
 	}
 	
	//將購買商品之資訊&數量加入購物車
	function addToCart(product_id) {
		var quantity = document.getElementById('quantityId').value;
		var jsonData = {"quantity":quantity};
		
		$.ajax({
	  		type: 'POST',  //api 的傳送方式 GET、POST、DELETE、PUT
	  		url: '<c:url value="/BuyProduct.do/'+ product_id +'" />', //api url => api 要打過去後端controller的位置
	  		data: JSON.stringify(jsonData),   // 要送到後端的資料
	  		contentType:"application/json;charset=UTF-8", // 資料格式 通常用"application/json;charset=UTF-8"
	  		dataType: 'json',  // 資料格式

	  		success:
	  			function (data) {  //裡面放 api 回來成功後要做的事情
	  				if (data.loginFirst) {
						location.href = "<c:url value='/login/UserLogin' />";
	  				} else if(data.success) {
						alert(data.success);
						getCartQuantity()
	  				}
	  			},
	  		error:
	  			function (xhr, ajaxOptions, thrownError) {  //裡面放 api 回來失敗後要做的事情

	  			}
	  	});
	}
	function getCartQuantity () {
		$.ajax({
	  		type: 'POST',  //api 的傳送方式 GET、POST、DELETE、PUT
	  		url: '<c:url value="/getCartQuantity.do" />', //api url => api 要打過去後端controller的位置
	  		contentType:"application/json;charset=UTF-8", // 資料格式 通常用"application/json;charset=UTF-8"
	  		dataType: 'json',  // 資料格式
	  		success:
	  			function (data) {  //裡面放 api 回來成功後要做的事情
		  			let headerCartNum = $('#cartQuantity')
		  			headerCartNum.text('(' + data.success + ')')
		  			localStorage.setItem('cartQuantity', data.success)
	  			}
	  	});
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
=======
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
>>>>>>> f1b340708c8dd0adc4ffdf8f55f1fd7540ba6612
 </html> 