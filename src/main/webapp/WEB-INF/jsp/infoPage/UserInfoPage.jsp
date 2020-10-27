<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="zh-TW">

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
                <h4>about us</h4>
                <h2>more about us!</h2>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
    <div align="center">
 	<table style="background-color: white;">
 	<tr><td>信箱</td><td><input type="text" value="${member.email}" placeholder="未填寫" disabled size="30"></td></tr>
 	<tr><td>名稱</td><td><input type="text" value="${member.name}" placeholder="未填寫" disabled size="30"></td></tr>
 	<tr><td>生日</td><td><input type="text" value="${member.birthday}" placeholder="未填寫" disabled size="30"></td></tr>
	<tr><td>性別</td><td><input type="text" value="${member.gender}" placeholder="未填寫" disabled size="30"></td></tr>
 	<tr><td>電話</td><td><input type="text" value="${member.tel}" placeholder="未填寫" disabled size="30"></td></tr>
 	<tr><td>創建日期</td><td><input type="text" value="${member.create_dt}" placeholder="未填寫" disabled size="30"></td></tr>
  	<tr><td>更新日期</td><td><input type="text" value="${member.update_dt}" placeholder="未填寫" disabled size="30"></td></tr>
 	<tr><td>等級</td><td><input type="text" value="${member.vip}" placeholder="未填寫" disabled size="30"></td></tr>
	</table>
		<a href="<c:url value='/out'/>">登出</a> 
		<a href="<c:url value='/infoPage/UserInfoChange'/>">會員資料修改</a> 
	</div>

	<jsp:include page="/fragment/footer.jsp" />

  </body>
</html>