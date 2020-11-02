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
	<div align="center">
		<form:form method="POST" modelAttribute="adBean" id="BuyAdForm" enctype="multipart/form-data">
			<div class="">
				<p><fieldset>
					<p><label class="" for='title'>標題: </label></p>
					<form:input id="title" path="title" type='text'
						class='form:input-large' size="30" autocomplete="off" onblur="checkTitle()"/>
					<span id="spanTitle"></span><br> 
						
					<p><label class="" for='description'>描述: </label></p>
					<form:input id="description" path="description" type='text'
						class='form:input-large' size="30" autocomplete="off" onblur="checkDescription()"/>
					<span id="spanDescription"></span><br> 
					
					<p><label class="" for='adStartTime'>廣告開始日期: </label></p>
					<form:input id="adStartTime" path="adStartTime" type='date'
						class='form:input-large' size="10" autocomplete="off" onblur="checkDate()"/>
					<span id="spanStartTime"></span><br>
					
					<p><label class="" for='adImage'>上傳圖片: </label></p>
					<form:input id="adImage" path="adImage" type='file' accept='image/*'
						class='form:input-large' onblur="checkFile()"/>
					<span id="spanAdImage"></span><br>
					<br>
					<div class=''>
						<input id="btnAdd" type="button" class='btn btn-primary' value='送出' onclick="submit()"/>
						<input type="reset" class='btn btn-primary' value="取消重填" class="cancel">
					</div>
					
				</fieldset>
				<span>${ErrorMsg}</span>
			</div>
		</form:form>
		<br>
		<button id='btn' onclick="oneclick()">一鍵輸入</button>
	
	
	</div>
	
	<script type="text/javascript">

		//只可選擇今天開始之日期
		function convertToISO(timebit) {
		  timebit.setHours(0, -timebit.getTimezoneOffset(), 0, 0);
		  var isodate = timebit.toISOString().slice(0,10);	
		  return isodate;
		}
		var adStartTime = document.getElementById("adStartTime");
		var currentDate = new Date();
		adStartTime.min = new Date();
		adStartTime.min = convertToISO(currentDate);
		
		function checkDate() {
			var adStartTime = document.getElementById("adStartTime").value;
			var spanStartTime = document.getElementById("spanStartTime");
			if (adStartTime == "") {
				spanStartTime.innerHTML = "請選擇日期";
				return false;
			} else {
				spanStartTime.innerHTML = "";
				return true;
			}
		}
		
		function checkTitle() {
			var title = document.getElementById("title").value;
			var spanTitle = document.getElementById("spanTitle");
			if (title == "") {
				spanTitle.innerHTML = "請輸入標題";
				return false;
			} else {
				spanTitle.innerHTML = "";
				return true;
			}
		}
		
		function checkFile() {
			var adImage = document.getElementById("adImage").value
			var spanAdImage = document.getElementById("spanAdImage");
			if (adImage == "") {
				spanAdImage.innerHTML = "請上傳圖片";
				return false;
			} else {
				spanAdImage.innerHTML = "";
				return true;
			}
		}
		
		function submit() {
			let checkAll = checkFile() && checkTitle() && checkDate();
			if (checkAll) document.forms["BuyAdForm"].submit();
		}
		
	
	</script>

    <!-- 寫上面 -->
    
    <jsp:include page="/fragment/footer.jsp" />

  </body>
</html>