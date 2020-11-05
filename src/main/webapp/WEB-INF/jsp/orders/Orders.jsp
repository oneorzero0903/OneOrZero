<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="zh-TW">

<head>
<jsp:include page="/fragment/linkCss.jsp" />
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<link rel="stylesheet"
	href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<!-- <link rel="stylesheet" href="jqueryui/style.css"> -->

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
	<!-- 下列敘述設定變數funcName的值為XXX，topMVC.jsp 會用到此變數 -->
	<%-- <c:set var="funcName" value="XXX" scope="session"/> --%>
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
	<!-- Banner Ends Here -->
	<script>
		$(function() {
			$("#datepicker").datepicker({
				dateFormat : "yy/mm/dd-DD",
				minDate : -0,
				onSelect : function(dateText, inst) {
// 					var xmlhttp = new XMLHttpRequest();
// 					  xmlhttp.onreadystatechange = function() {
// 					    if (this.readyState == 4 && this.status == 200) {
// 					      myFunction(this);
// 					    }
// 					  };
// 					  xmlhttp.open("GET", "cd_catalog.xml", true);
// 					  xmlhttp.send();
// 					}
					
					datas = {
						date : dateText
					}
					$.ajax({
						type : 'POST',
						url : '<c:url value="/orders/booking"	/>',
						data : JSON.stringify(datas),
						contentType : "application/json;charset=UTF-8",
						dataType : 'json',
						success : function(data) {
							if (data.isOk == "ok") {
								var selectElement = document.getElementById('area');
								${orderSetting}.forEach(function(order) {
									displayOrderTime(order);
								}
								
// 								for (var i = 0; i < ${fn:length(orderSetting)}; i++) {
// 									displayOrderTime(i, selectElement);
// 								}
// 								window.location.href = "<c:url value='/orders/Orders'	/>"
							} else {
								window.location.href = "<c:url value='/orders/Orders'	/>"
							}
						},
						error : function(xhr, ajaxOptions, thrownError) {
							alert(xhr.status + "\n" + thrownError);
						}
					});
					
				}
			});
		});
		function displayOrderTime(order){
			var content = "<table border='1'  bgcolor='#fbdb98'>";
			content += "<tr><td>包廂最大人數:</td><td>";
			content = content + ${order.person};
			content += "</td></tr>";
			content += "<tr><td>可訂位時間:</td>";
			content += "<td>";
			${orderTime}.forEach(function(time) {
				content = content + ${time.times};
			}
			content += "</td></tr>";
			content += "</table>";
			$('.center').append(content);
		}
	</script>

	<p>
	<div id="datepicker" align="center"></div>
	<br>
	<div id='area' style='height: 150px;' class='center'></div>
	<p>${orderSetting[0].person}</p>

	<c:forEach items="${orderSetting}" var="item">
		<p>包廂最大人數: ${item.person}</p>
		<p>可訂位時間: 
		<c:forEach items="${orderTime}" var="itemt">
			<p><div>
			${itemt.times}
			</div>
		</c:forEach>
<!-- 		<br><br> -->
	</c:forEach>

<%-- <c:forEach items="${orderSetting}" var="temp" varStatus="status"> --%>
<!--       <p><tr> -->
<%--       <td>${temp.person}</td> --%>
<%--       <c:forEach items="${orderTime}" var="temps"> --%>
<%--           <td>${temps.times}</td> --%>
<%--       </c:forEach> --%>
<!--       </tr></p> -->
<%-- </c:forEach> --%>

	<jsp:include page="/fragment/footer.jsp" />

</body>
</html>