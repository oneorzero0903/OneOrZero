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
                <h4>取消訂位</h4>
                <h2>真的要取消嗎......</h2>
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
					<tr><td>訂位咖啡廳:</td><td>${decodeString[1]}</td></tr>
 					<tr><td>訂位日期:</td><td>${decodeString[2]}</td></tr>
 					<tr><td>訂位包廂:</td><td>${decodeString[4]}號包廂</td></tr>
 					<tr><td>訂位時間:</td><td>${decodeString[5]}</td></tr>
				</table>
				<button id="orderDelete" class="btn btn-primary" onclick="orderDelete();">確認取消訂位</button>
			</div>
		</div>
	</div>
    
    <script>
    function orderDelete(){
    	document.getElementById("orderDelete").disabled = true;
    	$.ajax({
      		type: 'POST',
      		url: '<c:url value="/orders/orderDelete"	/>',
      		contentType:"application/json;charset=UTF-8",
      		dataType: 'json',

      		success:
      			function (data) {
      				if (data.isOk == "ok") {
      					alert("取消成功，請至您的email收取取消訂位成功信件");
      					window.location.href = "<c:url value='/'	/>";
      				} else {
      					alert("輸入資料有誤");
      					document.getElementById("orderDelete").disabled = true;
      				}
      			},
      		error:
      			function (xhr, ajaxOptions, thrownError) {
      				alert(xhr.status + "\n" + thrownError);
      			}
      	});
    }
    </script>
    <jsp:include page="/fragment/footer.jsp" />

  </body>
</html>