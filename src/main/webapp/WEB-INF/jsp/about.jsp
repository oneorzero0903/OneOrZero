<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>   
<!DOCTYPE html>
<html lang="zh-TW">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="LILY">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap" rel="stylesheet">

    <title>search("咖啡");</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value='/css/vendor/bootstrap/css/bootstrap.min.css'	/>" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="<c:url value='/css/fontawesome.css'	/>">
    <link rel="stylesheet" href="<c:url value='/css/templatemo-stand-blog.css'	/>">
    <link rel="stylesheet" href="<c:url value='/css/owl.css'	/>">


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

    <!-- Header -->
    <header class="">
      <nav class="navbar navbar-expand-lg">
        <div class="container">
          <a class="navbar-brand" href="<c:url value='/'	/>"><h2>search("咖啡");<em>.</em></h2></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item active">
                <a class="nav-link" href="<c:url value='/'	/>">首頁
                  <span class="sr-only">(current)</span>
                </a>
              </li> 
              <li class="nav-item">
                <a class="nav-link" href="<c:url value='/login/UserLogin'	/>">登入</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="<c:url value='/signUp/Terms'	/>">註冊</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="<c:url value='/backEnd/storeOrder/StoreOrderList'	/>">訂位</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="<c:url value='/indexShop'	/>">商家頁面</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="<c:url value='/contact'	/>">聯絡我們</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>

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


    <section class="about-us">
      <div class="container">
      	
        <div class="row">
          <div class="col-lg-12">
            <img src="<c:url value='/images/0915_Lily_aboutus_group.png'	/>" alt="">
            
            <p>在成為工程師之前，為了生活，我們在人生的路上跌跌撞撞。<br>

            無意間在最好的年紀相遇到彼此，我們熱血積極的利用起手邊的資源，互相給彼此建立信心，揮別過往的陰霾，開始了我們的第二人生。
              
            第一個一起努力的程式語言是JAVA。眾所皆知它的名稱是由爪哇咖啡而來，工程師們好像都少不了咖啡XD，我們開會除了會議室，靈感的發想也是來源咖啡廳，為了提神大量攝取周遭環境裡的咖啡因，哪裡有咖啡？Grab and GO！<BR>
              
            跟大眾一樣，我們團隊中大家的喜好皆有所不同，有人喜歡好喝的會去比較專門的店買。有人喜歡方面購買的連鎖店，有人便利商店的就可以了。有人短短午休時間還硬要跑去找女朋友一起喝咖啡，而有人懶得出去辦公室的即溶咖啡就滿足了，還有人根本不喜歡買咖啡喝飲料。<BR>
              
            但是這麼不同的我們，卻也是幾億人中才相遇到的一個命中注定的團隊，我們可是互相扶持的愛的戰隊，革命情感可不是鬧著玩的！所以為了找咖啡廳這種事吵架，我們是絕對不允許，而且我也不想要任何同伴妥協。<BR>
              
            所以我們建立了這個網站，不論有沒有前輩做過，我們希望的是從使用者的角度出發，因為我們自己也是最大的使用者。希望可以帶給一般咖啡眾、網美、工程師、業務或是咖啡廳業者，一個方便好用的大。平。台，讓雙方都互惠，讓台灣可以達到一個充滿咖啡香氣的大和諧。</p>
              
            愛，勇氣，與希望的力量戰勝一切。 </p>
              
              
              
            <p> 曉負責人-Jacob        &emsp;       時空控管者-Crystal</p>
              
              
            <p>風華絕代總監-Lily      &emsp;         前端女王-Terry</p>
              
              
            <p> 星爆技術長-Daniel     &emsp;        版本龍騎士-Allen</p>
              
          </div>
        </div>
        
        
        
        <div class="row">
          <div class="col-lg-12">
            <ul class="social-icons">
              <li><a href="#"><i class="fa fa-facebook"></i></a></li>
              <li><a href="#"><i class="fa fa-twitter"></i></a></li>
              <li><a href="#"><i class="fa fa-behance"></i></a></li>
              <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
            </ul>
          </div>
        </div>
        
        
      </div>
    </section>

    
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <ul class="social-icons">
              <li><a href="#">Facebook</a></li>
              <li><a href="#">Twitter</a></li>
              <li><a href="https://www.instagram.com/oneorzero_searchcoffee/">Instagram</a></li>
              <li><a href="#">Linkedin</a></li>
              <li><a href="https://github.com/oneorzero0903">Github</a></li>
            </ul>
          </div>
          <div class="col-lg-12">
            <div class="copyright-text">
              <p>Copyright 2020 One||Zero corp. Ltd. </p>
             
            </div>
          </div>
        </div>
      </div>
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="<c:url value='/css/vendor/jquery/jquery.min.js'	/>" ></script>
    <script src="<c:url value='/css/vendor/bootstrap/js/bootstrap.bundle.min.js'	/>" ></script>

    <!-- Additional Scripts -->
    <script src="<c:url value='/js/custom.js'	/>"></script>
    <script src="<c:url value='/js/owl.js'	/>"></script>
    <script src="<c:url value='/js/slick.js'	/>"></script>
    <script src="<c:url value='/js/isotope.js'	/>"></script>
    <script src="<c:url value='/js/accordions.js'	/>"></script>

    <script language = "text/Javascript"> 
      cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
      function clearField(t){                   //declaring the array outside of the
      if(! cleared[t.id]){                      // function makes it static and global
          cleared[t.id] = 1;  // you could use true and false, but that's more typing
          t.value='';         // with more chance of typos
          t.style.color='#fff';
          }
      }
    </script>

  </body>
</html>