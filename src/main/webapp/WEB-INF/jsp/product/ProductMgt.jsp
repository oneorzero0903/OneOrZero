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


.nav-link,.navbar-brand,p{
color:#fff
}

.mainDiv {
padding-top: 50px;
margin:auto;

}
h1{
text-align:center
}
.card{
background-color:#0080ff86
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
                <h4>商家頁面</h4>
                <h2>快來成為我們的合作店家</h2>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
    
    <!-- Banner Ends Here -->
    <h1>商城管理</h1>
    <div align=center>
    <div class=mainDiv>
    
    <div class="card w-50">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">商品管理</h5>
        <p class="card-text">管理已上架的商品，請謹慎修改。</p>
       <button class="btn btn-primary" id='productMgtBtn'>商品管理</button>
      </div>
    </div>
  </div>
 <div class="card w-50">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">商品上架</h5>
        <p class="card-text">上架新的產品，讓顧客挑選購買。</p>
       <button class="btn btn-primary" id='addProductBtn'>商品上架</button>
      </div>
    </div>
  </div>
</div>
</div>
    
    

    <!-- 寫上面 -->
    
    <jsp:include page="/fragment/footer.jsp" />
	<script type="text/javascript">
	
		$('#addProductBtn').click(function () {
			location.href = "<c:url value='/product/AddNewProduct' />";
		});	
	
		$('#productMgtBtn').click(function () {
			location.href = "<c:url value='/product/showMyProduct' />";
		});
	
	</script>
  </body>
</html>