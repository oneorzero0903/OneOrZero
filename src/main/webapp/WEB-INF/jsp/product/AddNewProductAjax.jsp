<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

  <head>
	<jsp:include page="/fragment/linkCss.jsp" />
    <style>
    
  </style>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.1.0.js"></script>  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="<c:url value='/js/StoreOrder.js'	/>"></script>
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
	<c:set var="funcName" value="ORDST" scope="session"/>
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
                <h4>商品管理</h4>
                <h2>上架您的商品</h2>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
    <!-- Banner Ends Here -->
    <div class="container ">
	    <form>
		  <div class="form-group">
		    <label for="productName">產品名稱</label>
		    <input type="text" class="form-control" id="productName"  placeholder="請輸入產品名稱">
		  </div>
		  <div class="form-group">
		    <label for="productprice">產品價格</label>
		    <input type="text" class="form-control" id="productprice" placeholder="請輸入產品價格">
		  </div>
		  <div class="form-group">
		    <label for="productquantity">庫存</label>
		    <input type="text" class="form-control" id="productquantity" placeholder="請輸入產品庫存">
		  </div>
		  <div class="form-group">
		    <label for="productdescription">產品描述</label>
		    <input type="text" class="form-control" id="productdescription" placeholder="請輸入產品描述">
		  </div>
<!-- 		  <div class="form-group"> -->
<!-- 		    <label for="productimgPath">產品圖片</label> -->
<!-- 		    <input type="text" class="form-control" id="productimgPath" placeholder="請上傳產品圖片"> -->
<!-- 		  </div> -->
<!-- 		  <div class="form-group form-check"> -->
<!-- 		    <input type="checkbox" class="form-check-input" id="exampleCheck1"> -->
<!-- 		    <label class="form-check-label" for="exampleCheck1">Check me out</label> -->
<!-- 		  </div> -->
		  <button type="submit" class="btn btn-outline-primary" onclick="submit()">Submit</button>
		</form>
    </div>
    
    <!-- 寫上面 -->
    <jsp:include page="/fragment/footer.jsp" />
    <script>
    	function submit() {
    		console.log('in')
    		
    		let data = {
    				name: 'ijijo',
    				price: 123,
    				quantity: 20,
    				description: 'nm,kh'
    		}
    		
    		
    		$.ajax({
		  		type: 'POST',
		  		url: '<c:url value="/product/AddNewProduct"	/>',
		  		data: JSON.stringify(data),
		  		contentType:"application/json;charset=UTF-8",
		  		dataType: 'json',

		  		success:
		  			function (data) {
// 		  				if (data.isOk == "ok") {
// 		  					alert("訂單設定成功");
// 		  					window.location.href = "<c:url value='/storeOrder/StoreOrder'	/>";
// 		  				} else {
// 		  					alert("輸入資料有誤");
// 		  					window.location.href = "<c:url value='/storeOrder/StoreOrder'	/>";
// 		  				}
		  			},
		  		error:
		  			function (xhr, ajaxOptions, thrownError) {
// 		  				alert(xhr.status + "\n" + thrownError);
		  			}
		  	});
		}
    </script>
  </body>
</html>