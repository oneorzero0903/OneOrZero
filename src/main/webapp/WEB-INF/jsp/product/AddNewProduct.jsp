<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

<html lang="en">

<head>
<jsp:include page="/fragment/linkCss.jsp" />
 <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
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

.nav-link, .navbar-brand {
	color: #fff
}
</style>
 <script type="text/javascript">
  	window.onload = function() {
  		$.ajax({
		  		type: 'GET',
		  		url: '<c:url value="/isFunctDisabled"/>',
		  		success:
		  			function (list) {
		  				console.log(list.length);
		  				if (list.length > 0) {
		  					alert("您已欠款超過35天,請儘快付款,付款後才可繼續使用本功能.");
		  					location.href = "<c:url value='/indexShop' />";
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
	<c:set var="funcName" value="SHOPCAR" scope="session"/>
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
							<h4>商家頁面</h4>
							<h2>快來成為我們的合作店家</h2>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>


	<!-- Banner Ends Here -->

	<div align="center">

		<form:form method="POST" modelAttribute="productBean" enctype="multipart/form-data">
			<div class="form-group">
				<div class="login-i">
					<div class="col-lg-10">
						<br>
						<h1 style="color: #272727; margin: 10px">商品上架</h1>
						<div class="form-group">
							<label for="name">產品名稱</label>
							<%-- 							<form:input hidden="hidden" type="text" class="form-control" path="store" id="store" value="${store.store_id}" /> --%>

							<form:input type="text" class="form:input-large" path="name"
								id="name" placeholder="請輸入產品名稱" autocomplete="off" />
						</div><p>${ErrorMsg.NameEmptyError}</p>
						<div class="form-group">
							<label for="price">產品價格</label>
							<form:input type="text" class="form:input-large" path="price"
								id="price" placeholder="請輸入產品價格" autocomplete="off" />
						</div><p>${ErrorMsg.PriceEmptyError}</p>
						<div class="form-group">
							<label for="stock">庫存</label>
							<form:input type="text" class="form:input-large" path="stock"
								id="stock" placeholder="請輸入產品庫存" autocomplete="off" />
						</div><p>${ErrorMsg.PriceEmptyError}</p>
						<div class="form-group">
							<label for="description">產品描述</label>
							<form:input type="text" class="form:input-large" maxlength="30" path="description"
								id="description" placeholder="請輸入產品描述" autocomplete="off" />
						</div>
						
						
						
						<div class="form-group">
    						<label class='control-label col-lg-2 col-lg-2' for="productImg">上傳圖片</label>
     						<div class='col-lg-10'>
     					 <form:input id="productImg" path="productImg" type='file' accept='image/*'
     					  class='form:input-large' />
    						 </div>
     					<br>
    					 	<div>
    							 <img style="width: 400px;" id="showImg">  <!-- 預覽圖片用 -->
    					 	</div>
   						 </div>
						
						<br>
						
						<div class='col-lg-offset-2 col-lg-10'>
							<input id="btnAdd" type='submit' class="btn btn-dark" value='送出' />
						</div>
						<div>
						</div>
					</div>

				</div>
			</div>
		</form:form>
		<button id='crystalBtn' class='btn btn-info' style="margin: 10px">一鍵輸入</button>
		

	</div>

	<jsp:include page="/fragment/footer.jsp" />
	
	
	<script type="text/javascript">
	
	//當使用者圖片選擇完畢,在畫面上show出來預覽
	  function readURL(input) {
	   if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function (e) {
	     $("#showImg").attr("src", e.target.result);
	    }
	    reader.readAsDataURL(input.files[0]);
	   }
	  }
	  $("#productImg").change(function() {
	   readURL(this);
	  });
	  
	  
	  var crystalBtn = document.getElementById("crystalBtn");
		crystalBtn.onclick = function() {
			document.getElementById("name").value = "星巴巴保溫瓶";
			document.getElementById("price").value = "2000";
			document.getElementById("stock").value = "100";
			document.getElementById("description").value = "耐熱溫度 : 瓶蓋100度C!請手洗，不適用於微波爐、烤箱、洗(烘)碗機。 請勿盛裝乾冰、碳酸飲料，以避免內壓上升，導致瓶塞無法打開或內容物噴出等危險。請勿盛裝酸性飲料，避免鋼材受損，影響保溫效果。";
		}
		
	</script>
</body>
</html>