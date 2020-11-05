<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html lang="en">

  <head>
	<jsp:include page="/fragment/linkCss.jsp" />
	<style>
	.adimg{
	width:520px;
	height:450px;
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
	<!-- 下列敘述設定變數funcName的值為SHO，topMVC.jsp 會用到此變數 -->
	<c:set var="funcName" value="IND" scope="session"/>
	<!-- 引入共同的頁首 -->
	<jsp:include page="/fragment/top.jsp" />

    <!-- Page Content -->
    <!-- Banner Starts Here -->
    
   <div class="main-banner header-text">
      <div class="container-fluid">
        <div class="owl-banner owl-carousel">
          <div class="item">
<<<<<<< HEAD
            <div id="adDiv1"><img src="<c:url value='/images/ADdemo.png'	/>" alt="">
=======
            <div id="adDiv1" class="adimg"><img src="<c:url value='/images/ADdemo.png'	/>" alt="">
>>>>>>> 6c9a238a7b07c3fd05b84fb5d194541cea0e1194
            </div>
            <div class="item-content">
              <div class="main-content">
                <div class="meta-category">
               	</div>
                  <div style="background-color:#27272786;">
                
                <div id="AdName1"><h4 style="color:#d26900;">買起來!</h4></div>
                
                
              </div>
              </div>
            </div>
          </div>
          <div class="item">
<<<<<<< HEAD
            <div id="adDiv2"><img src="<c:url value='/images/cafeImg/2.jpg'	/>" ></div>
=======
            <div id="adDiv2"  class="adimg"><img src="<c:url value='/images/cafeImg/2.jpg'	/>" ></div>
>>>>>>> 6c9a238a7b07c3fd05b84fb5d194541cea0e1194
            <div class="item-content">
              <div class="main-content">
                <div class="meta-category">
                 
                </div>
               <div style="background-color:#27272786">
                <div id="AdName2" ><h4 style="color:#d26900">黑洞珈琲店</div>
                
</div>
              </div>
            </div>
          </div>
          <div class="item" >
<<<<<<< HEAD
           <div id="adDiv3"> <img src="<c:url value='/images/cafeImg/3.jpg'	/>"></div>
=======
           <div id="adDiv3"  class="adimg"> <img src="<c:url value='/images/cafeImg/3.jpg'	/>"></div>
>>>>>>> 6c9a238a7b07c3fd05b84fb5d194541cea0e1194
            <div class="item-content">
              <div class="main-content">
                <div class="meta-category">
                   
                </div>
                <div style="background-color:#27272786">
                <div id="AdName3" ><h4 style="color:#d26900">樓梯好陡steepstairs</h4></div>
                
              </div>
              </div>
            </div>
          </div>
          <div class="item">
<<<<<<< HEAD
            <div id="adDiv4"><img src="<c:url value='/images/cafeImg/4.jpg'	/>" ></div>
=======
            <div id="adDiv4"  class="adimg"><img src="<c:url value='/images/cafeImg/4.jpg'	/>" ></div>
>>>>>>> 6c9a238a7b07c3fd05b84fb5d194541cea0e1194
            <div class="item-content">
              <div class="main-content">
                <div class="meta-category">
                  
                </div>
                <div style="background-color:#27272786">
                 <div id="AdName4" ><h4 style="color:#d26900">朔望咖啡 SYZYGY COFFEE</h4></div>
               
              </div>
              </div>
            </div>
          </div>
          
          <div class="item" >
<<<<<<< HEAD
            <div id="adDiv5"><img src="<c:url value='/images/cafeImg/5.jpg'	/>" ></div>
=======
            <div id="adDiv5"  class="adimg"><img src="<c:url value='/images/cafeImg/5.jpg'	/>" ></div>
>>>>>>> 6c9a238a7b07c3fd05b84fb5d194541cea0e1194
            <div class="item-content">
              <div class="main-content">
                <div class="meta-category">
                  
                </div>
                 <div style="background-color:#27272786">
                 <div id="AdName5" ><h4 style="color:#d26900">TOUCHEART_觸及真心咖啡廳</h4></div>
                
                </div>
              </div>
            </div>
          </div>
          <div class="item">
            <img src="<c:url value='/images/cafeImg/6.jpg'	/>" alt="">
            <div class="item-content">
              <div class="main-content">
                <div class="meta-category">
                  
                </div>
                <div style="background-color:#27272786">
<<<<<<< HEAD
                 <div id="AdName6" ><h4 style="color:#d26900">January Couple</h4></div>
=======
                 <div id="AdName6"  class="adimg"><h4 style="color:#d26900">January Couple</h4></div>
>>>>>>> 6c9a238a7b07c3fd05b84fb5d194541cea0e1194
               
              </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
             
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
	<script>
	$('.owl-carousel').owlCarousel({
		responsiveClass:true,
		loop:true,
		autoplay:true,  /* 自動輪播 */
		autoplayTimeout:2000,  /* 輪播速度 */
		autoplayHoverPause:true
		});
	
	
	</script>
  </body>
</html>