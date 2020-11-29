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
               <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="<c:url value='/adminpage'/>" role="button" aria-haspopup="true" aria-expanded="false">管理員</a>
    <div class="dropdown-menu">
    <a class="dropdown-item" href="<c:url value='/adminpage'/>">管理員首頁</a>
      <a class="dropdown-item" href="<c:url value='/report/report'/>">報表系統</a>
      <a class="dropdown-item" href="<c:url value='/collection/collection' />">催收系統</a>
      
    
    </div>
  </li>
             </ul>
          </div>
        </div>
      </nav>
    </header>