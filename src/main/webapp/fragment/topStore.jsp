<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <!-- Header -->
    <header class="">
      <nav class="navbar navbar-expand-lg">
        <div class="container">
          <a class="navbar-brand" href="<c:url value='/'	/>"><h2>search("咖啡");<em></em></h2></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item">
                	<a class="nav-link" href="<c:url value='/'	/>">首頁
                  	<span class="sr-only">(current)</span>
                	</a>
              </li> 
              <li class="nav-item">
              	<c:if test="${ empty store }">
              		<c:choose>
                		<c:when test="${ funcName == 'LOGST' }">
                			<a class="nav-link">登入</a>
                		</c:when>
                		<c:otherwise>
                			<a class="nav-link" href="<c:url value='/login/StoreLogin'	/>">登入</a>
                		</c:otherwise>
                	</c:choose>
              	</c:if>
              	<c:if test="${ ! empty store }">
			   		<a class="nav-link" href="<c:url value='/out/store' />">登出</a>
				</c:if>
              </li>
              <c:if test="${ empty store }">
              	<li class="nav-item">
              		<c:if test="${ funcName != 'SIGST' }">
                		<a class="nav-link" href="<c:url value='/signUp/StoreTerms'	/>">註冊</a>
              		</c:if>
              		<c:if test="${ funcName == 'SIGST' }"> 
                    	<a class="nav-link">註冊</a>
               		</c:if>
               	</li>
               </c:if>
              <li class="nav-item">
              	<c:if test="${ funcName != 'ORDST' }">
                  <a class="nav-link" href="<c:url value='/storeOrder/StoreOrder'	/>">訂單管理</a>
			    </c:if>
			    <c:if test="${ funcName == 'ORDST' }"> 
                  <a class="nav-link">訂單管理</a>
                </c:if>
              </li>
				<li class="nav-item">
                  <c:if test="${ funcName != 'SHOPCAR' }">
                  <a class="nav-link" href="<c:url value='/product/AddNewProduct'    />">商城管理</a>
                </c:if>
                <c:if test="${ funcName == 'SHOPCAR' }"> 
                  <a class="nav-link">商城管理</a>
                </c:if>
              <li class="nav-item">
                  <a class="nav-link" href="<c:url value='/ad/buyAd'/>">廣告管理</a>
              </li>
              
              <li class="nav-item">
              	<c:if test="${ funcName != 'CON' }">
                	<a class="nav-link" href="<c:url value='/contact'	/>">聯絡我們</a>
              	</c:if>
              	<c:if test="${ funcName == 'CON' }"> 
                    <a class="nav-link">聯絡我們</a>
                </c:if>
              </li>
              <c:if test="${ ! empty store }">
              	<li class="nav-item">
                    <a class="nav-link">Hello ${ store.store_name }</a>         
              	</li>
              </c:if>
            </ul>
          </div>
        </div>
      </nav>
    </header>