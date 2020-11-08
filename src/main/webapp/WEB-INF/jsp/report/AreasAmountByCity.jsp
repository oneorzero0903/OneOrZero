<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>   
<!DOCTYPE html>
<html lang="zh-TW">

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
  <script src="https://code.highcharts.com/highcharts.js"></script>
	<script>
	window.onload = function() {
 		var mainDiv = document.getElementById("mainDiv");
 		var xhr = new XMLHttpRequest();
 		xhr.open("GET", "<c:url value='/report/computedAreaAmountByCity?city=台北市' />", true);
 		xhr.send();
 		xhr.onreadystatechange = function() {
 			if (xhr.readyState == 4 && xhr.status == 200) {
 				console.log(xhr.responseText);
 			}
		}
		Highcharts.chart('container', {
			title: {
		        text: '台北市各區咖啡廳數量'
		    },
			  chart: {
			    type: 'column'
			  },
			  xAxis: {
			    categories: ['中正區', '大同區', '中山區', '松山區', '大安區', '萬華區', '信義區', '士林區', '北投區', '內湖區', '南港區', '文山區']
			  },
			  yAxis: {
			        title: {
			            text: '數量'
			        }
			    },
	
			  series: [{
				showInLegend: false,
			    data: [1, 2, 5, 3, 4, 1, 2, 3, 2, 1, 4, 5]
			  }]
			});
	}
	</script>
	<script>
 	//window.onload = function() {
// 		var mainDiv = document.getElementById("mainDiv");
// 		var xhr = new XMLHttpRequest();
// 		xhr.open("GET", "<c:url value='/report/computedAreaAmountByCity?city=台北市' />", false);
// 		xhr.send();
// 		xhr.onreadystatechange = function() {
// 			if (xhr.readyState == 4 && xhr.status == 200) {
// 				console.log(xhr.responseText);
// 			}
// 		}
// 		Highcharts.chart('container', {
// 		    title: {
// 		          text: '新北市各區咖啡廳數量'
// 		      },
// 		      chart: {
// 		        type: 'column'
// 		      },
// 		      xAxis: {
// 		        categories: ['萬里區', '金山區', '板橋區', '汐止區', '深坑區', '石碇區', '瑞芳區', '平溪區',
// 		            '雙溪區', '貢寮區', '新店區', '坪林區', '烏來區', '永和區', '中和區', '土城區',
// 		            '三峽區', '樹林區', '鶯歌區', '三重區', '新莊區', '泰山區', '林口區', '蘆洲區',
// 		            '五股區', '八里區', '淡水區', '三芝區', '石門區']
// 		      },
// 		      yAxis: {
// 		            title: {
// 		                text: '數量'
// 		            }
// 		        },

// 		      series: [{
//         		showInLegend: false,
// 		        data: [2, 3, 4, 1, 3, 2, 4, 5, 2, 3, 2, 1, 3, 4, 2, 4, 5, 1, 2, 3, 2, 3, 5, 4, 2, 1, 1, 2, 4]
// 		      }]
// 		    });
		
// 	}
	</script>
	
</head>
  
  <body style="background-color: #ffffee">

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

	<div id="container" style="height: 300px"></div>

    <!-- 寫上面 -->
    
    <jsp:include page="/fragment/footer.jsp" />

  </body>

</html>