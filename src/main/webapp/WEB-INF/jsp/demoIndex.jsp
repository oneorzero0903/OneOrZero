<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="zh-TW">

<head>
<jsp:include page="/fragment/linkCss.jsp" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style type="text/css">
.wrapper {
	position: relative;
	width: 78%;
	overflow: hidden;
	margin: 0 auto;
	height: 300px;
}

li {
	margin: 0;
	padding: 0;
	list-style: none;
}

ul.slides {
	margin: 0;
	padding: 0;
	position: absolute;
	width: 2400px;
	left: 0px;
	transition: all .5s;
}

ul.slides li {
	width: 400px;
	height: 300px;
	overflow: hidden;
	float: left;
}

ul.slides li img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.slide_btn {
	display: flex;
	justify-content: center;
	align-items: center;
	top: 0;
	bottom: 0;
	width: 30px;
	color: #fff;
	position: absolute;
	font-size: 40px;
}

#prevSlide {
	left: 0;
}

#nextSlide {
	right: 0;
}

.slide_btn i {
	color: rgba(255, 8, 64, 1);
	transition: 2s;
}

.slide_btn:hover i {
	color: rgba(255, 255, 255, 1);
}
</style>

<script> 
	window.onload = function() {
		var adID = document.getElementById("adID");
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/ad/adList.json' />", true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var adLists = JSON.parse(xhr.responseText);
				var content = "<ul class='slides'>";
				for (var i=0; i<adLists.length; i++) {  //廣告圖片將連結至店家個人頁面
					content +=  "<li><a href='<c:url value='/show/showOneStoreAjax/"+ adLists[i].store.store_id 
					+ "' />'>"+"<img src='<c:url value='/"
							+ adLists[i].imgPath +"' />'></a></li>"
				}
				if (adLists.length < 6) {  //預設圖片將會連結至廣告方案頁面
					var noAd = 6 - adLists.length;
					for (var i=0; i< noAd; i++) {
						content += "<li ><img src='<c:url value='/images/cafeImg/3.jpg' />'></li>"
					}
				}
				content += "</ul>"
				adID.innerHTML = content;
			}
		}
	}
</script>

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
							<h4>about us</h4>
							<h2>more about us!</h2>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<!-- Banner Ends Here -->
	<div class="wrapper" id="wrapper">
		<div id="adID">
		<ul class="slides">  <!-- 142~148 不放就不會動？？ what??? -->
			<li ></li>
			<li ></li>
			<li ></li>
			<li ></li>
			<li ></li>
		</ul>
		</div>
		<div id="prevSlide" class="slide_btn">
			<i class="fa fa-caret-left"></i>
		</div>
		<div id="nextSlide" class="slide_btn">
			<i class="fa fa-caret-right"></i>
		</div>
	</div>

	<jsp:include page="/fragment/footer.jsp" />

	<script type="text/javascript">
		var slideNum = 0;
		var slideCount = $(".slides li").length; //6
		var lastIndex = slideCount - 1;
		time = "";
		go();

		function go() {

			if (time == "") {
				time = setInterval(function next() {
					slideNum++;
					if (slideNum > lastIndex)
						slideNum = 0;
					show();
					function show() {

						let move = 0 - 400 * slideNum;
						$("ul.slides").css("left", move);
					}

					$("ul.slides").mouseenter(function() {
						clearInterval(time);
						time = "";
					});

					$("div.slide_btn").mouseenter(function() {
						clearInterval(time);
						time = "";
					});

					$("div.slide_btn").mouseleave(function() {
						go();
					})
				}, 2000);
			}
			$("ul.slides").mouseleave(function() {
				go();
			})
		}

		$(function() {

			function show() {
				let move = 0 - 400 * slideNum;
				$("ul.slides").css("left", move);

			}

			$("#prevSlide").click(function() {
				slideNum--;
				if (slideNum < 0)
					slideNum = lastIndex;
				show();
			})

			$("#nextSlide").click(function() {
				slideNum++;

				if (slideNum > lastIndex)
					slideNum = 0;
				show();
			})

		});
	</script>

</body>
</html>