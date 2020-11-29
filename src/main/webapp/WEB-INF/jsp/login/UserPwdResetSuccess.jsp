<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="zh-TW">

  <head>
	<jsp:include page="/fragment/linkCss.jsp" />
	
	<style>
	
	.formw{
width:600px;
background-color:#d26900;
margin:40px;
padding:40px
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
<%-- 	<c:set var="funcName" value="IND" scope="session"/> --%>
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
                <h4>忘記密碼</h4>
                <h2>重設成功</h2>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
	<div align="center">
	<div class="formw">
	<h5>${EmailOK}${LoginSuccess}</h5>
	<h5>記得使用新密碼登入喔！</h5>
	<a href="<c:url value='/'/>">返回首頁 </a>
	</div>
	</div>

	<jsp:include page="/fragment/footer.jsp" />

  </body>
</html>