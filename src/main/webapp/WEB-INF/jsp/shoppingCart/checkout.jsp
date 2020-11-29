<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="zh-TW">

<head>
<jsp:include page="/fragment/linkCss.jsp" />
<script type="text/javascript">
	window.onload = function() {
		
// 		JS寫法
// 		var xhr = new XMLHttpRequest();
// 		xhr.open("GET", "<c:url value='/getShoppingList.do'/>", true);
// 		xhr.send();
// 		xhr.onreadystatechange = function() {
// 			if (xhr.readyState == 4 && xhr.status == 200) {
// 				var cartItems = JSON.parse(xhr.responseText);
// 				
// 				for (let i = 0; i < cartItems.length; i++) {
// 					content += cartItems[i].product.id +"  ";
// 				}
// 				show.innerHTML += content;
// 			}
// 		}

// 		JQUERY寫法

		$.ajax({
	  		type: 'GET', 
	  		url: '<c:url value="/getShoppingList.do/" />', 

	  		success:
	  			function (list) {  
	  				showShoppingCart(list)
	  			},
	  		error:
	  			function (xhr, ajaxOptions, thrownError) { 
	  			}
	  	});

	}
</script>

<style type="text/css">
	#showCheckoutDiv{
	color: white;
	}
	#subTotalDiv{
	color: white;
	}
	#thanksDiv{
	color: white;
	padding-bottom: 20px;
	}
</style>
</head>

<body style="background-color: #272727;">

	<!-- ***** Preloader Start ***** -->
	<div id="preloader" class="jumper" style="right: -500px">
		<!--         <div class="jumper" style="right: -500px"> -->
		<div></div>
		<div></div>
		<div></div>
	</div>
	</div>
	<div class="cart">
		<div id="asideList" class="asideList" style="right: -500px;"></div>
		<div id="carList" class="container"></div>
		<div class="hightbox"></div>
	</div>

	<!-- ***** Preloader End ***** -->
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
							<h4>結帳一</h4>
							<h2>請確認您的商品</h2>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<!-- Banner Ends Here -->
		<div id="thanksDiv" align="center"><h2>${ThanksForBuying}</h2></div>
		<div id="showCheckoutDiv" align="center"></div>
	<div id="subTotalDiv" align="center"></div>


	<jsp:include page="/fragment/footer.jsp" />
	<script type="text/javascript">
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
		function checkout(subTotal) {
			$.ajax({
		  		type: 'GET',
		  		url: '<c:url value="/shoppingCheckOut"	/>',

		  		success:
		  			function (data) {
		  				location.href = '<c:url value="/shoppingCheckOut"	/>';
		  				localStorage.removeItem('cartQuantity');
		  			},
		  		error:
		  			function (xhr, ajaxOptions, thrownError) {
		  				alert(xhr.status + "\n" + thrownError);
		  			}
		  	});
		}
		
		function dropItem(id) {
			var obj = {"id":id};
			$.ajax({
		  		type: 'delete',
		  		url: '<c:url value="/dropItem.do"/>',
		  		data: JSON.stringify(obj),
		  		contentType:"application/json;charset=UTF-8",
		  		dataType: 'json',

		  		success:
		  			function (list) {
	  					if (list.length == 0) location.href = "<c:url value='/shoppingCart/checkout'/>";
		  				showShoppingCart(list);
		  				getCartQuantity();
		  				
		  			},
		  		error:
		  			function (xhr, ajaxOptions, thrownError) {
		  				alert(xhr.status + "\n" + thrownError);
		  			}
		  	});
		}
		
		function changeQuantity(id) {
			var obj = {
					"id":id,
					"newAmount": document.getElementById("changeAmount"+id).value,
					};
			$.ajax({
		  		type: 'put',
		  		url: '<c:url value="/changeQuantity.do"/>',
		  		data: JSON.stringify(obj),
		  		contentType:"application/json;charset=UTF-8",
		  		dataType: 'json',

		  		success:
		  			function (list) {
		  				showShoppingCart(list)
		  				getCartQuantity()
		  			},
		  		error:
		  			function (xhr, ajaxOptions, thrownError) {
		  				alert(xhr.status + "\n" + thrownError);
		  			}
		  	});
		}
		
		function showShoppingCart(list) {
			var show = document.getElementById("showCheckoutDiv");
			if (list.length == 0) {
				show.innerHTML ="您的購物車內沒有任何商品喔~";
			} else {
				var subTotal = 0;
				var content = "<table><tr><th style='text-align:center;padding-right:20px;'>縮圖</th><th style='text-align:center;'>品名</th><th style='text-align:right; padding-right: 20px;'>數量</th><th style='text-align:right;padding-right: 50px;'>金額</th></tr>";
				for (let i=0; i<list.length; i++) {
					if (list[i].product.imgPath != null) {
						content += "<tr><td><img class='shopImg' height='200' width='250' src='<c:url value='/"+ list[i].product.imgPath +"' />' /></td>";
				} else {
					content += "<tr><td><img class='shopImg' height='200' width='250' src='<c:url value='/getProductImg/" +  list[i].product.id+"' />'></td>" ;
				}		
					var quantity = list[i].quantity;
					
					content += "<td style='text-align:left;padding-right: 20px;'>"+list[i].product.name+"</td><td style='text-align:right; padding-right: 20px;'><button onclick='substract("+list[i].id+")'>-</button><input id='changeAmount"+list[i].id+"' style='text-align:center;' maxlength='2' size='1' type='text' value='"+ quantity +"'/><button onclick='plus("+list[i].id+")'>+</button></td><td style='text-align:right; padding-right: 50px;'>"+list[i].totalAmount
							+  "</td><td><button class='btn btn-light' onclick='changeQuantity("+ list[i].id +")'>修改</button><br><br><button class='btn btn-info' onclick='dropItem("+ list[i].id +")'>刪除</button></td></tr>";
					subTotal += list[i].totalAmount;
				}
				content += "</table><br><br>";
				show.innerHTML = content;
				var totalDiv = document.getElementById("subTotalDiv");
				totalDiv.innerHTML = "<h4>總金額: $" + subTotal + "</h4><br><button class='btn btn-danger' onclick='checkout()'>去買單</button>";
				
			}
		}
		
		function substract(id) {
			var changeAmount = document.getElementById("changeAmount"+id).value;
			if ((changeAmount-1) < 1) {
				document.getElementById("changeAmount"+id).value = 1;
			}else{
				document.getElementById("changeAmount"+id).value = changeAmount-1;
			}
		}
		
		function plus(id) {
			var plus = document.getElementById("changeAmount"+id).value;
			if ( (plus++) >= 10) {
				document.getElementById("changeAmount"+id).value = 10;
			}
			else {
				document.getElementById("changeAmount"+id).value = (plus++);
			}
		}
	</script>
</body>
</html>