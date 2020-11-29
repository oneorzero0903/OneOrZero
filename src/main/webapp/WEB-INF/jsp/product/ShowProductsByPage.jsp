<<<<<<< HEAD
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

#cartImg {
	padding-left:10px;
	width:120px;
	border-radius:50px;
}
#checkImg{
	width:250px;
}
.asideList{
overflow:right;
color:#fff;
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
				showProduct(products);
				
				var totalProductPages = ${totalProductPages};
				var pageDiv = document.getElementById("pageDiv");
				var pageLink = "<div class='btn-group' role='group' aria-label='Basic example'>";
				for (var i = 1; i <= totalProductPages; i++) {
					pageLink += "<button class='btn btn-secondary' onclick='showByPage(" + i
							+ ")'>" + i + "</button>";
				}
				pageDiv.innerHTML = pageLink + "</div>";
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
				showProduct(products);
			}
		}
	}
	
	function showProduct(products) {
		var context = "";
		for (var i = 0; i < products.length; i++) {
			context += "<div class='float'>"
					+ "<table>"
					+ "<tr><td align='center'>"
 					+ "<a href='<c:url value='/product/ShowOneProduct/"+ products[i].id +"'/>'>";
 					if (products[i].imgPath != null) {
 						context += "<img class='shopImg' height='200' width='250' src='<c:url value='/"+ products[i].imgPath +"' />' /></a>";
					} else {
						context += "<img class='shopImg' height='200' width='250' src='<c:url value='/getProductImg/" +  products[i].id+"' />'></a>" ;
					}
		 				context += "</td></tr>" 
								+ "<tr><td>" + products[i].name + "</td></tr>"  
								+ "<tr><td>" + "\$" + products[i].price + "</td></tr>"
								+ "<tr><td align='right'><select class='selectpicker' id='quantity"+products[i].id+"' ><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option></select>"
								+ "<a onclick='addToCart("+ products[i].id +")'><img id='cartImg' src='<c:url value='/images/addToCart.png' />' /></a></td></tr>"
								+ "</table></div>";
 					}
		mainDiv.innerHTML = context;
	}
	
	//將購買商品之資訊&數量加入購物車
	function addToCart(product_id) {
		var id = "quantity"+ product_id;
		var quantity = document.getElementById(id).value;
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
							<h4>購物商城</h4>
							<div class="row flex-nowrap align-items-center">
							  <h2 class="col-lg-8">現在就放入購物車吧!</h2>
							  <input id="searchId" type="text" class="form-control mr-3" placeholder="輸入您想搜尋的產品名稱">
							  <button class="btn btn-primary" onclick="searchClick()">搜尋</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
<!-- 	<div class = "cart"> -->
<!--     <div id = "asideList" class = "asideList"></div> -->
<!--     <div id = "carList" class="container" ></div> -->
<!--     <div class="hightbox"></div> -->
<!--     </div> -->
	<!-- Banner Ends Here -->

	<div align="center" id="mainDiv"></div>
	<div style="width: 10px;">&nbsp;</div>
	<div style="color: white;" align="center" id="pageDiv"></div>

	<jsp:include page="/fragment/footer.jsp" />
	<script type="text/javascript">
		function searchClick() {
			var searchStr = $("#searchId").val();
			var jsonData = {"searchStr":searchStr};
			$.ajax({
		  		type: 'POST',  
		  		url: '<c:url value="/ambiguousSearch.do" />', 
		  		data: JSON.stringify(jsonData), 
		  		contentType:"application/json;charset=UTF-8",
		  		dataType: 'json',

		  		success:
		  			function (products) { 
		  				if (products.length == 0) {
		  					document.getElementById("mainDiv").innerHTML = "<br><p style='color:white;font-size:16px;'>查無相關資訊，請更改搜尋條件</p>";
		  				} else {
		  					showProduct(products);
		  				}
		  				
		  				document.getElementById("pageDiv").innerHTML = "";
		  			},
		  		error:
		  			function (xhr, ajaxOptions, thrownError) {  //裡面放 api 回來失敗後要做的事情
		  			}
		  	});
		}
	</script>
</body>
</html>
=======
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

#cartImg {
	padding-left:10px;
	width:120px;
	border-radius:50px;
}
#checkImg{
	width:250px;
}
.asideList{
overflow:right;
color:#fff;
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
				showProduct(products);
				
				var totalProductPages = ${totalProductPages};
				var pageDiv = document.getElementById("pageDiv");
				var pageLink = "<div class='btn-group' role='group' aria-label='Basic example'>";
				for (var i = 1; i <= totalProductPages; i++) {
					pageLink += "<button class='btn btn-secondary' onclick='showByPage(" + i
							+ ")'>" + i + "</button>";
				}
				pageDiv.innerHTML = pageLink + "</div>";
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
				showProduct(products);
			}
		}
	}
	
	function showProduct(products) {
		var context = "";
		for (var i = 0; i < products.length; i++) {
			context += "<div class='float'>"
					+ "<table>"
					+ "<tr><td align='center'>"
 					+ "<a href='<c:url value='/product/ShowOneProduct/"+ products[i].id +"'/>'>";
 					if (products[i].imgPath != null) {
 						context += "<img class='shopImg' height='200' width='250' src='<c:url value='/"+ products[i].imgPath +"' />' /></a>";
					} else {
						context += "<img class='shopImg' height='200' width='250' src='<c:url value='/getProductImg/" +  products[i].id+"' />'></a>" ;
					}
		 				context += "</td></tr>" 
								+ "<tr><td>" + products[i].name + "</td></tr>"  
								+ "<tr><td>" + "\$" + products[i].price + "</td></tr>"
								+ "<tr><td align='right'><select class='selectpicker' id='quantity"+products[i].id+"' ><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option></select>"
								+ "<a onclick='addToCart("+ products[i].id +")'><img id='cartImg' src='<c:url value='/images/addToCart.png' />' /></a></td></tr>"
								+ "</table></div>";
 					}
		mainDiv.innerHTML = context;
	}
	
	//將購買商品之資訊&數量加入購物車
	function addToCart(product_id) {
		var id = "quantity"+ product_id;
		var quantity = document.getElementById(id).value;
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
	  				}
	  			},
	  		error:
	  			function (xhr, ajaxOptions, thrownError) {  //裡面放 api 回來失敗後要做的事情

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
							<h4>購物商城</h4>
									<h2>現在就放入購物車吧!</h2>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
<!-- 	<div class = "cart"> -->
<!--     <div id = "asideList" class = "asideList"></div> -->
<!--     <div id = "carList" class="container" ></div> -->
<!--     <div class="hightbox"></div> -->
<!--     </div> -->
	<!-- Banner Ends Here -->

	<div align="center" id="mainDiv"></div>
	<div style="width: 10px;">&nbsp;</div>
	<div style="color: white;" align="center" id="pageDiv"></div>

	<jsp:include page="/fragment/footer.jsp" />

</body>
</html>
>>>>>>> f1b340708c8dd0adc4ffdf8f55f1fd7540ba6612
