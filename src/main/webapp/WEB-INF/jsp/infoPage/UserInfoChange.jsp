<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="zh-TW">

  <head>
	<jsp:include page="/fragment/linkCss.jsp" />
	<script src="https://code.jquery.com/jquery-3.1.0.js"> </script>
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
 	<tr><td>信箱</td><td><input type="text" id="email" name="account" value="${member.email}" disabled placeholder="未填寫" size="30"></td></tr>
 	<tr><td>名稱</td><td><input type="text" id="name" name="name" value="${member.name}" placeholder="未填寫" size="30"></td></tr>
 	<tr><td>生日</td><td><input type="date" id="birthday" value="${member.birthday}" placeholder="未填寫" size="30"></td></tr>
	<tr><td>性別</td><td>
                <input type="radio" id="gender" name="gender" value="M">男
                <input type="radio" id="gender" name="gender" value="F">女
                <input type="radio" id="gender" name="gender" value="N" checked="checked">不方便透漏</td></tr>
 	
 	<tr><td>電話</td><td><input type="text" id="tel" value="${member.tel}" placeholder="未填寫" size="30"></td></tr>
 	<tr><td>創建日期</td><td><input type="text" value="${member.create_dt}" placeholder="未填寫" disabled size="30"></td></tr>
  	<tr><td>更新日期</td><td><input type="text" value="${member.update_dt}" placeholder="未填寫" disabled size="30"></td></tr>
 	<tr><td>等級</td><td><input type="text" value="${member.vip}" placeholder="未填寫" disabled size="30"></td></tr>
	</table>
	<button id="updateBtn">送出</button>	
	<div id="divResult"></div>
</div>
	
	<script>
		 var updateBtn = document.getElementById("updateBtn");
		 var id = ${member.member_id};
		 
		 updateBtn.onclick = function () {
			var name = document.getElementById('name').value;
			var birthday = document.getElementById('birthday').value;
			var gender = document.querySelector('input[name="gender"]:checked').value;
			console.log(gender);
			var tel = document.getElementById('tel').value;
			var email = document.getElementById('email').value;
			console.log();
			var xhr = new XMLHttpRequest();
			xhr.open("PUT", "<c:url value='/infoPage/UserInfoChange' />", true);
			var jsonMember = {
					"birthday": birthday,
					"gender": gender,
					"name": name,
					"tel": tel,
					"member_id": id,
			}
			xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	   		xhr.send(JSON.stringify(jsonMember));
			xhr.onreadystatechange = function () {
				console.log(xhr.status);
				if (xhr.readyState == 4 && ( xhr.status == 200 || xhr.status == 201 )) {
					result = JSON.parse(xhr.responseText);
					if (result.success) {
						document.getElementById("divResult").innerHTML = 
							"<font color='GREEN'>"+result.success+"</font>";
					} else if (result.fail) {
						document.getElementById("divResult").innerHTML = 
							"<font color='RED'>"+result.fail+"</font>";
					}
				}
			}
		}
	</script>
	
  <jsp:include page="/fragment/footer.jsp" />

  </body>
</html>