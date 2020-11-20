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
              <li class="nav-item active">
                <c:if test="${ funcName != 'IND' }">
                	<a class="nav-link" href="<c:url value='/'	/>">首頁
                  	<span class="sr-only">(current)</span>
                	</a>
                </c:if>
              </li> 
              <li class="nav-item">
                <c:if test="${ empty member }">
                	<c:choose>
                		<c:when test="${ funcName == 'LOG' }">
                			<a class="nav-link">登入</a>
                		</c:when>
                		<c:otherwise>
                			<a class="nav-link" href="<c:url value='/login/UserLogin'	/>">登入</a>
                		</c:otherwise>
                	</c:choose>
              	</c:if>
              	<c:if test="${ ! empty member }">
			   		<a class="nav-link" href="<c:url value='/out' />">登出</a>
				</c:if>
              </li>
              <c:if test="${ empty member }">
              	<li class="nav-item">
                	<c:if test="${ funcName != 'SIG' }">
                		<a class="nav-link" href="<c:url value='/signUp/Terms'	/>">註冊</a>
              		</c:if>
              		<c:if test="${ funcName == 'SIG' }"> 
                    	<a class="nav-link">註冊</a>                             
               		</c:if>
              	</li>
              </c:if>
              
              <li class="nav-item">
              	<a class="nav-link" href="<c:url value='/show/ShowStoresByPage'	/>">店家一覽</a>
              </li>
              <li class="nav-item">
              	<a class="nav-link" href="<c:url value='/product/ShowProductsByPage'	/>">商品一覽</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="<c:url value='/indexShop'	/>">商家頁面</a>
              </li>
              <li class="nav-item">
                <c:if test="${ funcName != 'CON' }">
                	<a class="nav-link" href="<c:url value='/contact'	/>">聯絡我們</a>
              	</c:if>
              	<c:if test="${ funcName == 'CON' }"> 
                    <a class="nav-link">聯絡我們</a>         
                </c:if>
                  
              </li>
              <li class="dropdown show">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Hello ${ member.name } </a>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
              <c:if test="${ ! empty member }">
              	
              </c:if>
					<a class="dropdown-item" href="<c:url value='/infoPage/UserInfoChange'/>">修改會員資料</a>
					<a class="dropdown-item" href="<c:url value='/storeOrder/StoreOrder'/>">查詢歷史訂單</a>
				</div>
			  </li>
              
              
              	<li>
					<img src="<c:url value='/images/icon.png' />">
				</li>
				<c:if test="${ ! empty member }">
              	<li class="nav-item">
					<a href="<c:url value='/shoppingCart/checkout' />"><img style="width: 90px; " src="<c:url value='/images/checkout.png'/>"></a>
						<c:choose>
							<c:when test="${empty cartSize}">
								(0)
							</c:when>
							<c:otherwise>
								(${cartSize})
							</c:otherwise>
						</c:choose>
              	</li>
               	</c:if>
            </ul>
          </div>
        </div>
      </nav>
    </header>