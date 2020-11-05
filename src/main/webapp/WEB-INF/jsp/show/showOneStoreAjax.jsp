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
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script>
 	
 	window.onload = function() {
 		var mainDiv = document.getElementById("mainDiv");
 		var xhr = new XMLHttpRequest();
 		xhr.open("GET", "<c:url value='/show/showOneStore/"+ ${sid} +"' />",true);
 		xhr.send();
 		xhr.onreadystatechange = function() {
 			if (xhr.readyState == 4 && xhr.status == 200) {
 				var store = JSON.parse(xhr.responseText);
 				var orders = searchOrder(store.store_id); 				
 				var orderButton = "";
 				if (orders){
					orderButton = "<tr><td><button class='btn btn-primary' onclick='order("+ store.store_id +");'>點我定位</button></td></tr>";
				}
 				
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
 					orderButton +
 					"</table></div>";
 					
 					mainDiv.innerHTML = content;
 				
 			}
 		}
 		function searchOrder(store_id_in){
 	 		datas = {
 	 			store_id: store_id_in
 	 		}
 	 		var rtn;
 	 		 $.ajax({
 			  		type: 'PUT',
 			  		async:false,//因為在ajax中，須設定為同步後，將變數return出去ajax後才return出去searchOrder
 			  		url: '<c:url value="/show/searchOrder"	/>',
 			  		data: JSON.stringify(datas),
 			  		contentType:"application/json;charset=UTF-8",
 			  		dataType: 'json',

 			  		success:
 			  			function (data) {
 			  				if (data.isOk == "ok") {
 			  					rtn = true;
 			  				} else {
 			  					rtn = false;
 			  				}
 			  			},
 			  		error:
 			  			function (xhr, ajaxOptions, thrownError) {
 			  				alert(xhr.status + "\n" + thrownError);
 			  			}
 			  	});
 	 		 return rtn
 	 	}
 	}
 	function order(store_id_in){//連到UserOrderController，取出store_id訂單
	 		obj = {
	 			store_id: store_id_in
	 		};
	 		$.ajax({
		  		type: 'POST',
		  		url: '<c:url value="/show/storeOrder"	/>',
		  		data: JSON.stringify(obj),
		  		contentType:"application/json;charset=UTF-8",
		  		dataType: 'json',

		  		success:
		  			function (data) {
		  				if (data.isOk == "ok") {
		  					window.location.href = "<c:url value='/orders/Orders'	/>";
		  				} else {
		  					window.location.href = "<c:url value='/orders/Orders'	/>";
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