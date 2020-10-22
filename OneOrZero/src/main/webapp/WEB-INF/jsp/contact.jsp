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
    <meta name="author" content="">
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
                <h4>聯絡我們</h4>
                <h2>let’s stay in touch!</h2>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
    
    <!-- Banner Ends Here -->


    <section class="contact-us">
      <div class="container">
        <div class="row">
        
          <div class="col-lg-12">
            <div class="down-contact">
              <div class="row">
                <div class="col-lg-8">
                  <div class="sidebar-item contact-form">
                    <div class="sidebar-heading">
                      <h2>有任何疑問？</h2>
                    </div>
                    <div class="content">
                      <form id="contact" action="" method="post">
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
                              <textarea name="message" rows="6" id="message" placeholder="Your Message" required=""></textarea>
                            </fieldset>
                          </div>
                          <div class="col-lg-12">
                            <fieldset>
                              <button type="submit" id="form-submit" class="main-button">Send Message</button> 
                            </fieldset>
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
               
                <div class="col-lg-4">
                  <div class="sidebar-item contact-information">
                    <div class="sidebar-heading">
                      <h2>contact information</h2>
                    </div>
                    <div class="content">
                      <ul>
                        <li>
                          <h5  style="color: azure;">090-484-123-989</h5>
                          <span>PHONE NUMBER</span>
                        </li>
                        <li>
                          <h5  style="color: azure;">oneorzerocorp@gmail.com</h5>
                          <span>EMAIL ADDRESS</span>
                        </li>
                        <li>
                          <h5 style="color: azure;">10658台北市大安區信義路三段153號10F 
                          	<br>最後一排</h5>
                          <span  style="color: azure;">STREET ADDRESS</span>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <BR>
          <div class="col-lg-12">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14461.666103586535!2d121.54840684810776!3d25.019934875694346!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442abd4825ecdf1%3A0xa9479a36fc6b99d0!2sDigital%20Education%20Institute%2C%20III!5e0!3m2!1szh-TW!2stw!4v1601359263561!5m2!1szh-TW!2stw" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>            </div>
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
      cleared[0] = cleared[1] = cleared[2] = 0; 
      function clearField(t){                  
      if(! cleared[t.id]){                     
          cleared[t.id] = 1;  
          t.value='';        
          t.style.color='#fff';
          }
      }
    </script>

  </body>
</html>