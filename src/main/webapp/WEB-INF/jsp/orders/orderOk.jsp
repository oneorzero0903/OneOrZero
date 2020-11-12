<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>   
<!DOCTYPE html>
<html lang="zh-TW">

  <head>
	<jsp:include page="/fragment/linkCss.jsp" />
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
                <h4>訂位訊息</h4>
                <h2>請確認您的訂位訊息</h2>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
    
    <!-- Banner Ends Here -->
    
    <div class="form-group"
		style="background-color: #d26900; margin: 50px 300px;">
		<div class="login-i">
			<div align="center">
				<table style="background-color: white;">
					<tr><td>訂位咖啡廳:</td><td>${oneStore.store_name}</td></tr>
 					<tr><td>訂位日期:</td><td>${booking.day}</td></tr>
 					<tr><td>訂位包廂:</td><td>${booking.setting_id}號包廂</td></tr>
 					<tr><td>訂位時間:</td><td>${booking.times}</td></tr>
				</table>
				<button id="submit" class="btn btn-primary" onclick="orderInsert();">確認訂位</button>
				<button id="back" class="btn btn-primary" onclick="location.href='<c:url value="/orders/Orders"	/>'">回上一頁</button>
			</div>
		</div>
	</div>
    
    <script>
    function orderInsert(){
    	document.getElementById("submit").disabled = true;
    	document.getElementById("back").disabled = true;
    	$.ajax({
      		type: 'GET',
      		url: '<c:url value="/orders/orderInsert"	/>',
      		contentType:"application/json;charset=UTF-8",
      		dataType: 'json',

      		success:
      			function (data) {
      				if (data.isOk == "ok") {
      					alert("訂位成功，請至您的email收取訂位成功信件");
      					window.location.href = "<c:url value='/show/ShowStoresByPage'	/>";
      				} else {
      					alert("輸入資料有誤");
      					document.getElementById("submit").disabled = false;
      					document.getElementById("back").disabled = false;
      				}
      			},
      		error:
      			function (xhr, ajaxOptions, thrownError) {
      				alert(xhr.status + "\n" + thrownError);
      				document.getElementById("submit").disabled = false;
  					document.getElementById("back").disabled = false;
      			}
      	});
    }
    </script>
    <jsp:include page="/fragment/footer.jsp" />

  </body>
</html>