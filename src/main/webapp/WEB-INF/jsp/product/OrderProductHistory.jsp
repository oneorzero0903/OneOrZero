<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="zh-TW">

<head>
<jsp:include page="/fragment/linkCss.jsp" />
<style type="text/css">
 
	#getOrderProductHistory{
	  color: #ffff;
      font-size: 12px;
      text-transform: uppercase;
      font-weight: 900;
      letter-spacing: 0.5px;
      margin-bottom: 15px;
	}
	.box{
	  display:none;
	}
	h5:hover{
	  cursor: pointer;
	}
	.historyBox{
         display: flex;
         align-items: center;
     }
     .historyBox > div{
         flex:1;
         margin-bottom:10px;
     }
    

</style>

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
							<h4>search("咖啡");</h4>
							<h2>購物清單</h2>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<!-- Banner Ends Here -->
	<div id='getOrderProductHistory' class="container"></div>

	<script type="text/javascript">
//       function getOrderProductHistory (products){
//     	  var show = document.getElementById("getOrderProductHistory");
//     	  if (products.length == 0) {
// 				show.innerHTML = "<h3><br>目前沒有任何購物紀錄";
//     	  } else {
//     		  var content = "<table>";
//     		  for (let i = 0 ; i < products.length; i++) {
//     			  if (i>0 && products[i].bookingNo != products[i-1].bookingNo) {
//     	   			 content += "<tr><td>&nbsp;</td></tr><tr><td>&nbsp;</td></tr><tr><td style='text-align:left;padding-right: 20px;'>訂單編號: " + products[i].bookingNo + " </td></tr>";
//     			  } else {
//     				  if (i==0) {
//     					  content += "<tr><td style='text-align:left;padding-right: 20px;'>訂單編號: " + products[i].bookingNo + " </td></tr>";
//     				  } 
//     			  }
//    				 content += "<tr><td><img class='shopImg' height='200' width='250' src='<c:url value='/"+ products[i].product.imgPath +"' />' /></td>"
//    				 		 +  "<td style='text-align:left;padding-right: 20px;'> " + products[i].product.name + " </td>"
//    				 		 +  "<td>" + products[i].quantity + "個</td>"
//    				 		 +  "<td style='text-align:left;padding-left:20px'>" + products[i].totalAmount + " 元</td></tr>";
// 			  }
//    				show.innerHTML = content + "</table>";
//     		  }
//       }
      
      function getOrderProductHistory (products){
    	  var show = document.getElementById("getOrderProductHistory");
    	  if (products.length == 0) {
				show.innerHTML = "<h4 class='text-center'>目前沒有任何購物紀錄</h4>";
  	      } else {
    		  var content = "";
    		  for (let i = 0 ; i < products.length; i++) {
    			  if (i>0 && products[i].bookingNo != products[i-1].bookingNo) {
    	   			 content += "<h5 onclick='clickHandler(this)' class='mb-2'>訂單編號: " + products[i].bookingNo + " </h5><div class='box'>";
    			  } else {
    				  if (i==0) {
    					  content += "<h5 onclick='clickHandler(this)' class='mb-2'>訂單編號: " + products[i].bookingNo + " </h5><div class='box'>";
    				  } 
    			  }
    			  content +=
    				  "<div class='historyBox'>" +
    		   	     	"<div>" +
			   	           "<img width='200' height='150' src='<c:url value='/"+ products[i].product.imgPath +"' />' />" +
			   	   	     "</div>" +
			   	   	     "<div>" + products[i].product.name + "</div>" +
			   	         "<div>" + products[i].quantity + " 個</div>" +
			   	         "<div>" + products[i].totalAmount + " 元</div>" +
			   	 	   "</div>"
	   	 	      if (i < products.length-1) {
	   	 	    	  if(products[i].bookingNo != products[i+1].bookingNo){
	   	 	    		content += "</div>";
	   	 	    	  }
    	   			 
    			  } else {
    				  if (i === products.length -1) {
    					  content += "</div>";
    				  } 
    			  }
			  }
   				show.innerHTML = content;
   		  }
    	 
      }
      
      function clickHandler (vm) {
    	  vm.nextSibling.style.display = "block"
    	  
      }
    	  
  	window.onload = function() {
  		$.ajax({
	  		type: 'GET', 
	  		url: '<c:url value="/getOrderProductHistory.do/" />', 

	  		success:
	  			function (products) {  
	  			getOrderProductHistory(products)
	  			},
	  		error:
	  			function (xhr, ajaxOptions, thrownError) { 
	  			}
	  	});
	}
  
  </script>


	<jsp:include page="/fragment/footer.jsp" />

</body>
</html>