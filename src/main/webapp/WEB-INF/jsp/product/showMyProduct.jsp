<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<!DOCTYPE html>
<html lang="en">

  <head>
	<jsp:include page="/fragment/linkCss.jsp" />
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
  </style>
  
  <script type="text/javascript">
  	window.onload = function() {
  		$.ajax({
	  		type: 'GET', 
	  		url: '<c:url value="/showMyProduct.do/" />', 

	  		success:
	  			function (products) {  
	  				showMyProducts(products)
	  			},
	  		error:
	  			function (xhr, ajaxOptions, thrownError) { 
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
	<%-- <c:set var="funcName" value="XXX" scope="session"/> --%>
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
                <h4>about us</h4>
                <h2>修改產品資訊</h2>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
    
    <div id='showMyProductDiv' align="center"></div>

  <jsp:include page="/fragment/footer.jsp" />
	<script type="text/javascript">
		function showMyProducts(products) {
			var show = document.getElementById("showMyProductDiv");
			if (products.length == 0) {
				show.innerHTML = "<br>目前沒有上架任何商品喔～";
			} else {
				var content = "<table><tr><th style='text-align:center;padding-right:20px;'>產品圖片</th><th style='text-align:center;padding-right:20px;'>產品名稱</th><th style='text-align:right; padding-right: 50px;'>產品價格</th><th style='text-align:right;padding-right: 60px;'>產品庫存</th><th style='text-align:center;'>產品描述</th></tr>";
				var remark;
				for (let i=0; i<products.length; i++) {
					if (products[i].imgPath != null) {
						content += "<tr><td style='padding-right:20px;'><img class='shopImg' height='200' width='250' src='<c:url value='/"+ products[i].imgPath +"' />' /></td>";
					} else {
						content += "<tr><td style='padding-right:20px;'><img class='shopImg' height='200' width='250' src='<c:url value='/getProductImg/" +  products[i].id+"' />'></td>" ;
					}		
					if (products[i].description != null) remark = products[i].description;
					else remark = "";
					content += "<td style='text-align:left;padding-right: 20px;'><input type='text' size='20' value='"+products[i].name+ "' id='nameId"+ products[i].id +"'></td>"
							+  "<td style='padding-right:50px;'><input style='text-align:right;' type='text' size='3' value='"+products[i].price+ "' id='priceId"+ products[i].id +"'></td>"
							+  "<td style='text-align:right;padding-right:60px;'><input style='text-align:right;' type='text' size='3' value='"+ products[i].stock + "' id='stockId"+ products[i].id +"'></td>"
							+  "<td><textarea style='resize:none;' id='descriptionId"+ products[i].id +"'>" + remark + "</textarea></td>"
							+  "<td style='padding-left:30px;'><button class='btn btn-light' onclick='updateProduct("+ products[i].id +")'>修改</button><br><br><button class='btn btn-info' onclick='dropProduct("+ products[i].id +")'>刪除</button></td></tr>";
				}
				content += "</table><br><br>";
				show.innerHTML = content;
			}
		}
	
		function dropProduct(id) {
			var obj = {"id":id};
			$.ajax({
		  		type: 'delete',
		  		url: '<c:url value="/dropProduct.do"/>',
		  		data: JSON.stringify(obj),
		  		contentType:"application/json;charset=UTF-8",
		  		dataType: 'json',

		  		success:
		  			function (products) {
		  				showMyProducts(products);
		  			},
		  		error:
		  			function (xhr, ajaxOptions, thrownError) {
		  				alert(xhr.status + "\n" + thrownError);
		  			}
		  	});
		}
		
		function updateProduct(id) {
			var name = document.getElementById("nameId"+id).value;
			var price = document.getElementById("priceId"+id).value;
			var stock = document.getElementById("stockId"+id).value;
			var description = document.getElementById("descriptionId"+id).value;
			var obj = {
					"id":id,
					"name": name,
					"price": price,
					"stock": stock,
					"description": description
					};
			$.ajax({
		  		type: 'put',
		  		url: '<c:url value="/updateProduct.do"/>',
		  		data: JSON.stringify(obj),
		  		contentType:"application/json;charset=UTF-8",
		  		dataType: 'json',

		  		success:
		  			function (products) {
		  				alert("更新成功!!")
			  			showMyProducts(products);
		  			},
		  		error:
		  			function (xhr, ajaxOptions, thrownError) {
		  				alert("請輸入正確的商品資料");
		  				location.href = "<c:url value='/product/showMyProduct'/>";
		  			}
		  	});
		}
	
	</script>
  </body>
</html>