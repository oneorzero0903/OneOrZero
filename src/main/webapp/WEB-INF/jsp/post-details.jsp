<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<!DOCTYPE html>
<html lang="en">

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
	<!-- 下列敘述設定變數funcName的值為SHO，topMVC.jsp 會用到此變數 -->
	<c:set var="funcName" value="IND" scope="session"/>
	<!-- 引入共同的頁首 -->
	<jsp:include page="/fragment/top.jsp" />

    <!-- Page Content -->
    <!-- Banner Starts Here -->
    <div class="heading-page header-text">
      <section class="page-heading">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <div class="text-content" >
                <h4>cozy & chill place</h4>
                <h2>search("咖啡");</h2>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
    
    <!-- Banner Ends Here -->

    <section class="call-to-action">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="main-content">
              <div class="row">
                <div class="col-lg-8">
                  <span>喜歡喝咖啡？</span>
                  <h4>快加入我們會員!</h4>
                </div>
                <div class="col-lg-4">
                  <div class="main-button">
                    <a rel="nofollow" href="#" target="_parent">加入會員</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>


    <section class="blog-posts grid-system">
      <div class="container">
        <div class="row">
          <div class="col-lg-8">
            <div class="all-blog-posts">
              <div class="row">
                <div class="col-lg-12">
                  <div class="blog-post">
                    <div class="blog-thumb">
                      <img src="<c:url value='/images/restaurant1.jpg'	/>" alt="" >
                    </div>
                    <div class="down-content">
                      <span>search("咖啡");</span>
                      <ul class="post-info">
                        <li><a href="#">url</a></li>
                        <li><a href="#">Sep 30, 2020</a></li>
                        <li><a href="#comm">3 Comments</a></li>
                      </ul>
                      <p>我們是一群愛喝爪哇咖啡,愛寫JAVA程式的咖啡工程師。希望可以創造一個空間結合我們最愛的兩個東西。充滿咖啡香的空間裡與科技的碰撞下，可以擦出什麼樣的火花我們也非常好奇。客人在我們的空間裡可以好好放鬆，也可以好好專心，喝著美味的咖啡，在我們的咖啡廳可以創造一片天空。
                      <br><br></p>
                      <div class="post-options">
                        <div class="row">
                          <div class="col-6">
                            <ul class="post-tags">
                              <li><i class="fa fa-tags"></i></li>
                              <li><a href="#">免費插座</a>,</li>
                              <li><a href="#">免費WIFI</a></li>
                            </ul>
                          </div>
                          <div class="col-6">
                            <ul class="post-share">
                              <li><i class="fa fa-share-alt"></i></li>
                              <li><a href="https://www.facebook.com/oneorzerocorp">Facebook</a>,</li>
                              <li><a href="https://www.instagram.com/oneorzero_searchcoffee/"> Instagram</a></li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-12">
                  <div class="sidebar-item comments">
                    <div class="sidebar-heading">
                      <h2 id="comm">3 comments</h2>
                    </div>
                    <div class="content">
                      <ul>
                        <li>
                          <div class="author-thumb">
                            
                          </div>
                          <div class="right-content">
                            <h4 style="color: azure;">Lily TU<span>May 16, 2020</span></h4>
                            <p>喝了這邊的咖啡，腦袋變的靈光很多，考試都考一百分！</p>
                          </div>
                        </li>
                        <li>
                          <div class="author-thumb">
                            
                          </div>
                          <div class="right-content">
                            <h4 style="color: azure;">Allen MA<span>May 20, 2020</span></h4>
                            <p>工程師的咖啡廳，來這邊寫都不會有BUG</p>
                          </div>
                        </li>
                        <li>
                          <div class="author-thumb">
                           
                          </div>
                          <div class="right-content">
                            <h4 style="color: azure;">Daniel hung<span>May 16, 2020</span></h4>
                            <p>打開</p>
                          </div>
                        </li>
                        
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="col-lg-12">
                  <div class="sidebar-item submit-comment">
                    <div class="sidebar-heading">
                      <h2>Your comment</h2>
                    </div>
                    <div class="content">
                      <form id="comment" action="#" method="post">
                        <div class="row">
                          <div class="col-md-6 col-sm-12">
                            <fieldset>
                              <input name="name" type="text" id="name" placeholder="Your name" required="">
                            </fieldset>
                          </div>
                          <div class="col-md-6 col-sm-12">
                            <fieldset>
                              <input name="email" type="text" id="email" placeholder="Your email" required="">
                            </fieldset>
                          </div>
                          <div class="col-md-12 col-sm-12">
                            <fieldset>
                              <input name="subject" type="text" id="subject" placeholder="Subject">
                            </fieldset>
                          </div>
                          <div class="col-lg-12">
                            <fieldset>
                              <textarea name="message" rows="6" id="message" placeholder="Type your comment" required=""></textarea>
                            </fieldset>
                          </div>
                          <div class="col-lg-12">
                            <fieldset>
                              <button type="submit" id="form-submit" class="main-button">Submit</button>
                            </fieldset>
                          </div>
                        </div>
                      </form>
                    </div>
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
                      <h2>Recent Posts</h2>
                    </div>
                    <div class="content">
                      <ul>
                        <li><a href="<c:url value='/post-details'	/>">
                          <h5>0||1 cafe</h5>
                          <span>May 31, 2020</span>
                        </a></li>
                        <li><a href="<c:url value='/post-details'	/>">
                          <h5>X?1:0 coffee & bar</h5>
                          <span>May 28, 2020</span>
                        </a></li>
                        <li><a href="<c:url value='/post-details'	/>">
                          <h5>1 && 0 plaza</h5>
                          <span>May 14, 2020</span>
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
                      <h2>Tag Clouds</h2>
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
