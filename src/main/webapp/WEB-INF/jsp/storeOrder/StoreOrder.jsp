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
                <h4>訂單管理</h4>
                <h2>設定專屬於您的訂單</h2>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
    <!-- Banner Ends Here -->
    
	<br><br>
	<div align="left">
		<div class="container1">
			<label for="" class="t1">電話 :</label> 
			<input class="phone" id="phone" type='text' size="11" onblur="checkPhone($(this));" maxlength="11" oninput="value=value.replace(/[^\d]/g,'')"/>
    		<span></span><br><br>
    		<label for="" class="t1">地址 :</label> 
			<input class="address" id="address" type='text' size="30" onblur="checkAddress($(this));" />
    		<span></span><br><br>
    		<button class="add_form_field" onclick="add()">設定包廂 &nbsp; 
      			<span style="font-size:16px; font-weight:bold;">+ </span>
    		</button>
    		<div class="wrap">
  			</div>
		<script>
		let template = `<div class="menuList">
				<label class="t1" for="">&nbsp; 可預約日期 : &nbsp;</label>
				<select id="dateStart" onblur="checkDate( $(this), $(this).next() )">
				   	<option value="0" selected>請選擇</option> 
					<option value="1">週一</option>
					<option value="2">週二</option>
					<option value="3">週三</option>
					<option value="4">週四</option>
					<option value="5">週五</option>
					<option value="6">週六</option>
					<option value="7">週日</option>
				</select>~
				<select id="dateEnd" onblur="checkDate( $(this).prev(), $(this) )">
			   		<option value="0" selected>請選擇</option> 
					<option value="1">週一</option>
					<option value="2">週二</option>
					<option value="3">週三</option>
					<option value="4">週四</option>
					<option value="5">週五</option>
					<option value="6">週六</option>
					<option value="7">週日</option>
				</select>
				<span></span>
				<br>
				<label class="t1" for="">&nbsp; 可容納人數 : &nbsp;</label>
				<input class="person" type="text" size="5" id="person" onkeyup="return ValidateNumber($(this),value)" onblur="checkPerson( $(this) );"/>
				<span></span><br>
				<label class="t1" for="">&nbsp; 可預約起迄時間 : &nbsp;</label>
				<select id="timeStart" onfocus='this.size=5;' onblur='this.size=1; checkTime( $(this), $(this).next());' onchange='this.size=1; this.blur();'>
					<option value="-1" selected>請選擇</option> 
					<option value="0.0">00:00</option>
					<option value="0.5">00:30</option>
					<option value="1.0">01:00</option>
					<option value="1.5">01:30</option>
					<option value="2.0">02:00</option>
					<option value="2.5">02:30</option>
					<option value="3.0">03:00</option>
					<option value="3.5">03:30</option>
					<option value="4.0">04:00</option>
					<option value="4.5">04:30</option>
					<option value="5.0">05:00</option>
					<option value="5.5">05:30</option>
					<option value="6.0">06:00</option>
					<option value="6.5">06:30</option>
					<option value="7.0">07:00</option>
					<option value="7.5">07:30</option>
					<option value="8.0">08:00</option>
					<option value="8.5">08:30</option>
					<option value="9.0">09:00</option>
					<option value="9.5">09:30</option>
					<option value="10.0">10:00</option>
					<option value="10.5">10:30</option>
					<option value="11.0">11:00</option>
					<option value="11.5">11:30</option>
					<option value="12.0">12:00</option>
					<option value="12.5">12:30</option>
					<option value="13.0">13:00</option>
					<option value="13.5">13:30</option>
					<option value="14.0">14:00</option>
					<option value="14.5">14:30</option>
					<option value="15.0">15:00</option>
					<option value="15.5">15:30</option>
					<option value="16.0">16:00</option>
					<option value="16.5">16:30</option>
					<option value="17.0">17:00</option>
					<option value="17.5">17:30</option>
					<option value="18.0">18:00</option>
					<option value="18.5">18:30</option>
					<option value="19.0">19:00</option>
					<option value="19.5">19:30</option>
					<option value="20.0">20:00</option>
					<option value="20.5">20:30</option>
					<option value="21.0">21:00</option>
					<option value="21.5">21:30</option>
					<option value="22.0">22:00</option>
					<option value="22.5">22:30</option>
					<option value="23.0">23:00</option>
					<option value="23.5">23:30</option>
				</select>~
				<select id="timeEnd" onfocus='this.size=5;' onblur='this.size=1; checkTime( $(this).prev(), $(this));' onchange='this.size=1; this.blur();'>
					<option value="-1" selected>請選擇</option> 
					<option value="0.0">00:00</option>
					<option value="0.5">00:30</option>
					<option value="1.0">01:00</option>
					<option value="1.5">01:30</option>
					<option value="2.0">02:00</option>
					<option value="2.5">02:30</option>
					<option value="3.0">03:00</option>
					<option value="3.5">03:30</option>
					<option value="4.0">04:00</option>
					<option value="4.5">04:30</option>
					<option value="5.0">05:00</option>
					<option value="5.5">05:30</option>
					<option value="6.0">06:00</option>
					<option value="6.5">06:30</option>
					<option value="7.0">07:00</option>
					<option value="7.5">07:30</option>
					<option value="8.0">08:00</option>
					<option value="8.5">08:30</option>
					<option value="9.0">09:00</option>
					<option value="9.5">09:30</option>
					<option value="10.0">10:00</option>
					<option value="10.5">10:30</option>
					<option value="11.0">11:00</option>
					<option value="11.5">11:30</option>
					<option value="12.0">12:00</option>
					<option value="12.5">12:30</option>
					<option value="13.0">13:00</option>
					<option value="13.5">13:30</option>
					<option value="14.0">14:00</option>
					<option value="14.5">14:30</option>
					<option value="15.0">15:00</option>
					<option value="15.5">15:30</option>
					<option value="16.0">16:00</option>
					<option value="16.5">16:30</option>
					<option value="17.0">17:00</option>
					<option value="17.5">17:30</option>
					<option value="18.0">18:00</option>
					<option value="18.5">18:30</option>
					<option value="19.0">19:00</option>
					<option value="19.5">19:30</option>
					<option value="20.0">20:00</option>
					<option value="20.5">20:30</option>
					<option value="21.0">21:00</option>
					<option value="21.5">21:30</option>
					<option value="22.0">22:00</option>
					<option value="22.5">22:30</option>
					<option value="23.0">23:00</option>
					<option value="23.5">23:30</option>
				</select>
				<span></span>&nbsp;
				<br><label class="t1" for="">&nbsp; 預約間格 : &nbsp;</label>
				<select id="space" onblur="checkSpace( $(this) )">
			   		<option value="0" selected>請選擇</option> 
					<option value="1">1小時</option>
					<option value="2">2小時</option>
					<option value="3">3小時</option>
					<option value="4">4小時</option>
				</select>
				<span></span>&nbsp;
				<br><label class="t1" for="">&nbsp; 包廂數量 : &nbsp;</label>
				<input class="boothNum" type="text" size="5" id="boothNum" onblur="checkBoothNum($(this));" />
				<span></span>
				<br><button onclick="del(this)">Delete</button><br><br>
		  </div>`
		  
		    function submit () {
			  if (checkPhoneSubmit && checkAddressSubmit && checkDateSubmit &&
					  checkTimeSubmit && checkPersonSubmit && checkBoothNumSubmit) {
				  let storeOrderArray = []
			      $('.menuList').each((index, el) => {
			        let data = {
			          phone:$( ".phone" ).val(),
			          address:$( ".address" ).val(),
			          dateStart: $(el).find('select[id="dateStart"]').val(),
			          dateEnd: $(el).find('select[id="dateEnd"]').val(),
			          person: $(el).find('input[id="person"]').val(),
			          timeStart: $(el).find('select[id="timeStart"]').val(),
			          timeEnd: $(el).find('select[id="timeEnd"]').val(),
			          space: $(el).find('select[id="space"]').val(),
			          boothNum: $(el).find('input[id="boothNum"]').val()
			        }
			        storeOrderArray.push(data)
			      })
			      let arrays = {
					  storeOrder: storeOrderArray
				  }
			      $.ajax({
			  		type: 'PUT',
			  		url: '<c:url value="/storeOrder/StoreOrder"	/>',
			  		data: JSON.stringify(arrays),
			  		contentType:"application/json;charset=UTF-8",
			  		dataType: 'json',

			  		success:
			  			function (data) {
			  				if (data.isOk == "ok") {
			  					alert("訂單設定成功");
			  					window.location.href = "<c:url value='/storeOrder/StoreOrder'	/>";
			  				} else {
			  					alert("輸入資料有誤");
			  					window.location.href = "<c:url value='/storeOrder/StoreOrder'	/>";
			  				}
			  			},
			  		error:
			  			function (xhr, ajaxOptions, thrownError) {
			  				alert(xhr.status + "\n" + thrownError);
			  			}
			  	});
			  } 
		    }
		function oneclick(){//一鍵輸入
	 		document.getElementById("timeStart").value = "08:00";
	 		document.getElementById("timeEnd").value = "20:00";
	 		document.getElementById("boothNum").value = 10;
	 		document.getElementById("phone").value = "0919123456";
	 	}
		</script>	
     	</div><br><br>
     	
	 		<div id="btn">
				<input type="button" onclick="submit()" value="確認送出">
     			<input type="reset"	value="全部清空" />
     		</div>
<!--      			<button id='btn' onclick="oneclick()">一鍵輸入</button> -->
	</div>
    <!-- 寫上面 -->
    <jsp:include page="/fragment/footer.jsp" />
  </body>
</html>