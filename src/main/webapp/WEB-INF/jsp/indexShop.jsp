<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
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
	<!-- 下列敘述設定變數funcName的值為SHO，topMVC.jsp 會用到此變數 -->
<%-- 	<c:set var="funcName" value="INDST" scope="session"/> --%>
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
                <br>
                 <div class="btn btn-primary">
                    <a style="color:white;" href="<c:url value='/signUp/StoreTerms' />" target="_parent">商家註冊</a>
                 </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
    
    <!-- Banner Ends Here -->

    <section class="blog-posts grid-system">
      <div class="container">
        <div class="row">
          <div class="col-lg-8">
            <div class="all-blog-posts">
              <div class="row">
                <div class="col-lg-6" onclick="location.href='<c:url value='/program/buyProgramAD'	/>'">
                  <div class="blog-post">
                    <div class="blog-thumb">
                      <a href="<c:url value='/program/buyProgramAD'	/>">
                      <img src="<c:url value='/images/program/programAD.png'	/>" alt="">
                      </a>
                    </div>
                    <div class="down-content">
                      <span>方案A</span>
                      <a href="#"><h4>首頁置頂廣告</h4></a>           
                      <p>方案內容</p>
                      <div class="post-options">
                        <div class="row">
                          <div class="col-lg-12">
                            <ul class="post-tags">
                              <li><i class="fa fa-tags"></i></li>
                              <li><a href="#">bbb</a>,</li>
                              <li><a href="#">aaa</a></li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>       
                <div class="col-lg-6" onclick="location.href='<c:url value='/program/buyProgramBT'	/>'">
                  <div class="blog-post">
                    <div class="blog-thumb">
                      <a href="<c:url value='/program/buyProgramBT'	/>">
                      <img src="<c:url value='/images/program/programBT.png'	/>" alt="">
                      </a>
                    </div>
                    <div class="down-content">
                      <span>方案B</span>
                      <a href="#"><h4>訂位系統</h4></a>
                      <!-- <ul class="post-info">
                        <li><a href="#">ntd/days</a></li>
                        <li><a href="#">ntd/days</a></li>
                        <li><a href="#">ntd/days</a></li>
                      </ul> -->
                      <p>方案內容</p>
                      <div class="post-options">
                        <div class="row">
                          <div class="col-lg-12">
                            <ul class="post-tags">
                              <li><i class="fa fa-tags"></i></li>
                              <li><a href="#">bbb</a>,</li>
                              <li><a href="#">aaa</a></li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6" onclick="location.href='<c:url value='/program/buyProgramSM'	/>'">
                  <div class="blog-post">
                    <div class="blog-thumb">
                    <a href="<c:url value='/program/buyProgramSM'	/>">
                      <img src="<c:url value='/images/program/programSM.png'	/>" alt="">
                      </a>
                    </div>
                    <div class="down-content">
                      <span>方案C</span>
                      <a href="#"><h4>購物商城</h4></a>
                      <!-- <ul class="post-info">
                        <li><a href="#">150/15days</a></li>
                      
                      </ul> -->
                      <p>方案內容</p>
                      <div class="post-options">
                        <div class="row">
                          <div class="col-lg-12">
                            <ul class="post-tags">
                              <li><i class="fa fa-tags"></i></li>
                              <li><a href="#">Bbb</a>,</li>
                              <li><a href="#">aaa</a></li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6" onclick="location.href='<c:url value='/program/buyAll'	/>'">
                  <div class="blog-post">
                    <div class="blog-thumb">
                    <a href="<c:url value='program/buyAll'	/>">
                      <img src="<c:url value='/images/program/buyAll.png'	/>" alt="">
                      </a>
                    </div>
                    <div class="down-content">
                      <span>方案D</span>
                      <a href="#"><h4>購買全部方案</h4></a>
                     <!--  <ul class="post-info">
                        <li><a href="#">ntd/days</a></li>
                        <li><a href="#">ntd/days</a></li>
                        <li><a href="#">ntd/days</a></li>
                        <li><a href="#">ntd/days</a></li>
                      </ul> -->
                      <p>方案內容</p>
                      <div class="post-options">
                        <div class="row">
                          <div class="col-lg-12">
                            <ul class="post-tags">
                              <li><i class="fa fa-tags"></i></li>
                              <li><a href="#">aaa</a>,</li>
                              <li><a href="#">bbb</a></li>
                            </ul>
                          </div>
                        </div>
                      </div>
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
                	<div class="col-lg-12">
                  		<img src="<c:url value='/images/storecm.jpg' />" >
                	</div>
                </div>
                <div class="col-lg-12">
                  <div class="sidebar-item recent-posts">
                    <div class="sidebar-heading">
                      <!-- <h2>Recent Posts</h2>
                    </div>
                    <div class="content">
                      <ul>
                        <li><a href="#">
                          <h5>Vestibulum id turpis porttitor sapien facilisis scelerisque</h5>
                          <span>May 31, 2020</span>
                        </a></li>
                        <li><a href="#">
                          <h5>Suspendisse et metus nec libero ultrices varius eget in risus</h5>
                          <span>May 28, 2020</span>
                        </a></li>
                        <li><a href="#">
                          <h5>Swag hella echo park leggings, shaman cornhole ethical coloring</h5>
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
                        <li><a href="#">- Nature</a></li>
                        <li><a href="#">- Awesome Layouts</a></li>
                        <li><a href="#">- Creative Ideas</a></li>
                        <li><a href="#">- Responsive Templates</a></li>
                        <li><a href="#">- HTML5 / CSS3 Templates</a></li>
                        <li><a href="#">- Creative &amp; Unique</a></li> -->
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