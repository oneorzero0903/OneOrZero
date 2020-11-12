<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <!-- Header -->
    <header class="">
      <nav class="navbar navbar-expand-lg">
        <div class="container">
          <a  href="<c:url value='/'	/>"><img src="<c:url value='/images/logo10.png'	/>"></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item">
                	<a class="nav-link" href="<c:url value='/'	/>">客戶首頁
                  	
                	</a>
              </li> 
            
             
               <li class="nav-item">
                <a class="nav-link" href="<c:url value='/indexShop'	/>">商家首頁</a>
              </li>
             
          </div>
        </div>
      </nav>
    </header>