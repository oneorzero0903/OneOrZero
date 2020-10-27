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
  <script src="https://code.jquery.com/jquery-3.1.0.js"></script>  
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
                <h4>訂單管理</h4>
                <h2>設定專屬於您的訂單</h2>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
    
    <!-- Banner Ends Here -->

<%-- 	<form method="POST" action="/OneOrZero/StoreOrderController" > --%>
	<br><br>
	<div align="center">
	<form:form method="POST" modelAttribute="store_OrderSettingBean" id="Store_OrderSettingForm">
		<p>  
            <label class="t1" for="">可訂位時間 :</label>
            <form:input id="timeStart" path="timeStart" type='time'
						class='form:input-large' size="30" autocomplete="off"/> ~
			<form:input id="timeEnd" path="timeEnd" type='time'
						class='form:input-large' size="30" autocomplete="off" onblur="checkTimeEnd();"/>
        <span id="spanTime"></span>
        </p>
        <br><br>
		
        <label for="" class="t1">包廂數 :</label>
        <form:input id="boothNum" path="boothNum" type='text' onblur="checkBoothNum();"
						class='form:input-large' size="10" autocomplete="off" oninput="value=value.replace(/[^\d]/g,'')"/>
        <span id="spanBoothNum"></span>
        <br><br>    
        
        <label for="" class="t1">電話 :</label> 
        <form:input id="phone" path="phone" type='tel' onblur="checkPhone();"
						class='form:input-large' size="11" autocomplete="off" maxlength="11" oninput="value=value.replace(/[^\d]/g,'')"/>
		<span id="spanPhone"></span>
		<br><br>
		
		<div id="btn">
			<input type="button" onclick="register()" value="確認送出">
     		<input type="reset"	value="全部清空" />
     	</div>
     </form:form>
     	<button id='btn' onclick="oneclick()">一鍵輸入</button>
     </div>
     <script>
     function oneclick(){//一鍵輸入
 		document.getElementById("timeStart").value = "08:00";
 		document.getElementById("timeEnd").value = "20:00";
 		document.getElementById("boothNum").value = 10;
 		document.getElementById("phone").value = "0919123456";
 		console.log(document.getElementById("phone").value);
 	}
     function register() {
         if (checkTimeEnd() && checkBoothNum() && checkBoothNum()) {
         	document.forms["Store_OrderSettingForm"].submit();
 		} else {
 			return false;
 		}
     }
//      function callStoreOrder() {

//     		var timeStart = document.getElementById('timeStart').value;
//     		var timeEnd = document.getElementById('timeEnd').value;
//     		var BoothNum = document.getElementById('BoothNum').value;
//     		var Booth = document.getElementById('Booth').checked;
//     		var Phone = document.getElementById('Phone').value;

//     		var myData = {
//     			"timeStart": timeStart,
//     			"timeEnd": timeEnd,
//     			"boothNum": boothNum,
//     			"phone": phone
//     		};
//     		$.ajax({
//     			type: 'POST',
//     			url: '${pageContext.request.contextPath}/StoreOrderController',
//     			data: { jsonData: JSON.stringify(myData) },
//     			dataType: 'json',

//     			success:
//     				function (data) {
//     					if (data.isOK == "ok") {
//     						alert("訂單設定成功");
//     						window.location.href = "${pageContext.request.contextPath}/jsp/index.jsp";
//     					} else {
//     						alert("輸入資料有誤");
//     						window.location.href = "${pageContext.request.contextPath}/jsp/StoreOrder.jsp";
//     						//					alert(data.account + "," + data.password);
//     						//					var elementObj = document.getElementById("test");
//     						//					elementObj.innerHTML = "<h1>account = " + data.account +"</h1>";
//     						//					elementObj.innerHTML += "<h1>password = " + data.password +"</h1>";
//     						//window.location.href="${pageContext.request.contextPath}/jsp/Output.jsp";
//     					}
//     				},
//     			error:
//     				function (xhr, ajaxOptions, thrownError) {
//     					alert(xhr.status + "\n" + thrownError);
//     				}
//     		});
//     	} 
     </script>

    <!-- 寫上面 -->
    
    <jsp:include page="/fragment/footer.jsp" />

  </body>
</html>