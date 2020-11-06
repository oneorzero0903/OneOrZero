<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html lang="en">

  <head>
	<jsp:include page="/fragment/linkCss.jsp" />
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style type="text/css">
.wrapper {
	position: relative;
	width: 99%;
	overflow: hidden;
/* 	margin: 0 auto; */
	height: 450px;
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
	width: 3000px;
	left: 0px;
	transition: all .5s;
}

ul.slides li {
	width: 500px;
	height: 450px;
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
					content +=  "<li><a href='<c:url value='/show/showOneStoreAjax/"+ adLists[i].store.store_id+ "' />'>";
					if (adLists[i].imgPath != null) {
						content += "<img src='<c:url value='/"
								   + adLists[i].imgPath +"' />'></a></li>";
					} else {
						content += "<img src='<c:url value='/getAdImg/"
							+ adLists[i].ad_id +"' />'></a></li>";
					}
				}
				if (adLists.length < 6) {  //預設圖片將會連結至廣告方案頁面
					var noAd = 6 - adLists.length;
					for (var i=0; i< noAd; i++) {
						content += "<li ><figure><img src='<c:url value='/images/ADdemo.png' />'><figcation style='background-color: white;'>愛麗絲是我的</figcation></figure></li>";
					}
				}
				content += "</ul>";
				adID.innerHTML += content;
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
	<!-- 下列敘述設定變數funcName的值為SHO，topMVC.jsp 會用到此變數 -->
	<c:set var="funcName" value="IND" scope="session"/>
	<!-- 引入共同的頁首 -->
	<jsp:include page="/fragment/top.jsp" />

    <!-- Page Content -->
    <!-- Banner Starts Here -->
    <br><br><br><br><div style="padding-top: 5px;"></div>
    <div class="wrapper" id="wrapper">
		<div id="adID" class="slidesAd">
		</div>
		<div id="prevSlide" class="slide_btn">
			<i class="fa fa-caret-left"></i>
		</div>
		<div id="nextSlide" class="slide_btn">
			<i class="fa fa-caret-right"></i>
		</div>
	</div>
    
    
    
   <div class="heading-page header-text" style="padding-top: 10px">
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
	

	<script type="text/javascript">
		var slideNum = 0;
		var slideCount = 4;
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

						let move = 0 - 500 * slideNum;
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
				}, 1500);
			}
			$("ul.slides").mouseleave(function() {
				go();
			})
		}

		$(function() {

			function show() {
				let move = 0 - 500 * slideNum;
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
             
    <!-- Banner Ends Here -->

    <section class="call-to-action">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="main-content">
              <div class="row">
                <div class="col-lg-8">
                  <span>加入會員了嗎？</span>
                  <h4>快按右邊加入會員！</h4>
                </div>
                <div class="col-lg-4">
                  <div class="main-button">
                    <a rel="nofollow" href="<c:url value='/signUp/Terms'/>" target="_parent">加入會員</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>


    <section class="blog-posts">
      <div class="container">
        <div class="row">
          <div class="col-lg-8">
            <div class="all-blog-posts">
              <div class="row">
                <div class="col-lg-12">
                  <div class="blog-post">
                    <div class="blog-thumb">
                      <img src="<c:url value='/images/cafeImg/7.jpg'	/>" alt="">
                    </div>
                    <div class="down-content">
                      <span>夏綠地Charlotte Cafe</span>
                      
                      <ul class="post-info">
                        
                        <li><a href="#">11:00-20:00</a></li>
                        <li><a href="#">中正區。台北市</a></li>
                      </ul>
                      <p>坐在樹下喝咖啡，感覺不錯喔♥</p>
                      <div class="post-options">
                        <div class="row">
                          <div class="col-6">
                            <ul class="post-tags">
                              <li><i class="fa fa-tags"></i></li>
                              <li><a href="#">環境優美</a>,</li>
                              <li><a href="#">自然木作</a></li>
                            </ul>
                          </div>
                          <div class="col-6">
                            <ul class="post-share">
                              <li><i class="fa fa-share-alt"></i></li>
                              <li><a href="#">Facebook</a>,</li>
                              <li><a href="#"> Twitter</a></li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-12">
                  <div class="blog-post">
                    <div class="blog-thumb">
                      <img src="<c:url value='/images/cafeImg/8.jpg'	/>" alt="">
                    </div>
                    <div class="down-content">
                      <span>貝克宅 Beckhome Roasting House</span>
                     
                      <ul class="post-info">
                        
                           <li><a href="#">11:00-20:00</a></li>
                        <li><a href="#">松山區。台北市</a></li>
                      </ul>
                      <p>彷彿回家的舒適感</p>
                      <div class="post-options">
                        <div class="row">
                          <div class="col-6">
                            <ul class="post-tags">
                              <li><i class="fa fa-tags"></i></li>
                              <li><a href="#">景觀優美</a>,</li>
                              <li><a href="#">網美拍照</a></li>
                            </ul>
                          </div>
                          <div class="col-6">
                            <ul class="post-share">
                              <li><i class="fa fa-share-alt"></i></li>
                              <li><a href="#">Facebook</a>,</li>
                              <li><a href="#">Twitter</a></li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-12">
                  <div class="blog-post">
                    <div class="blog-thumb">
                      <img src="<c:url value='/images/cafeImg/9.jpg'	/>" alt="">
                    </div>
                    <div class="down-content">
                      <span>成真咖啡 台北永康店</span>
                      
                      <ul class="post-info">
                        
                         <li><a href="#">10:00-18:00</a></li>
                        <li><a href="#">中正區。台北市</a></li>
                      </ul>
                      <p>甜甜的，如同你的笑容一樣</p>
                      <div class="post-options">
                        <div class="row">
                          <div class="col-6">
                            <ul class="post-tags">
                              <li><i class="fa fa-tags"></i></li>
                              <li><a href="#">交通方便</a>,</li>
                              <li><a href="#">忙碌生活</a></li>
                            </ul>
                          </div>
                          <div class="col-6">
                            <ul class="post-share">
                              <li><i class="fa fa-share-alt"></i></li>
                              <li><a href="#">Facebook</a>,</li>
                              <li><a href="#">Twitter</a></li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-12">
                  <div class="main-button">
                    <a href="<c:url value='/show/ShowStoresByPage'	/>">按我更多♥</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="sidebar">
              <div class="row">
                <div class="col-lg-12">
                  <div class="sidebar-item search">
                    <form id="search_form" name="gs" method="GET" action="#">
                      <input type="text" name="q" class="searchText" placeholder="type to search..." autocomplete="on">
                    </form>
                  </div>
                </div>
                <div class="col-lg-12">
                  <div class="sidebar-item recent-posts">
                    <div class="sidebar-heading">
                      <h2>Recent Shops</h2>
                    </div>
                    <div class="content">
                      <ul>
                        <li><a href="#">
                          <h5>樓上的嬉皮與笑臉男</h5>
                          <span>台北市。松山區</span>
                        </a></li>
                        <li><a href="#">
                          <h5> 呆待咖啡 DD coffee</h5>
                          <span>台北市。萬華區</span>
                        </a></li>
                        <li><a href="#">
                          <h5>DOTEL Coffice Ximen 西門町手沖咖啡館</h5>
                          <span>台北市。 文山區</span>
                        </a></li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="col-lg-12">
                  <div class="sidebar-item categories">
                    <div class="sidebar-heading">
                      <h2>Categories</h2>
                    </div>
                    <div class="content">
                      <ul>
                        <li><a href="#">- 中正區</a></li>
                        <li><a href="#">- 大安區</a></li>
                        <li><a href="#">- 信義區</a></li>
                        <li><a href="#">- 板橋區</a></li>
                        <li><a href="#">- 永和區</a></li>
                        <li><a href="#">- 三重區</a></li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="col-lg-12">
                  <div class="sidebar-item tags">
                    <div class="sidebar-heading">
                      <h2>熱門標籤</h2>
                    </div>
                    <div class="content">
                      <ul>
                        <li><a href="#">免費插座</a></li>
                        <li><a href="#">免費WIFI</a></li>
                        <li><a href="#">空間寬擴</a></li>
                        <li><a href="#">食物美味</a></li>
                        <li><a href="#">網美首選</a></li>
                        <li><a href="#">不限時間</a></li>
                        <li><a href="#">交通方便</a></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <jsp:include page="/fragment/footer.jsp" />
  </body>
</html>