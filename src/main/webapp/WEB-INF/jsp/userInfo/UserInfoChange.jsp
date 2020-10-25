<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員資料修正</title>
</head>
<body>
<input type="hidden" name="_method" value="put" />
<table>
 	<tr><td>信箱</td><td><input type="text" name="account" value="${member.email}" disabled placeholder="未填寫" size="30"></td></tr>
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
	
<!-- 	<div align="center"> -->
<%-- 		<form action="UserLogout.jsp"> --%>
<!-- 		<input type="submit" value="Logout"> -->
<%-- 		</form> --%>
<!-- 	</div> -->

	<script>
		 var updateBtn = document.getElementById("updateBtn");
		 var id = ${member.member_id};
		 
// 		 var name = document.getElementById('name').value;
// 		 var birthday = document.getElementById('birthday').value;
// 		 var gender = document.getElementById('gender').value;
// 		 var tel = document.getElementById('tel').value;
		 
// 		 var xhr1 = new XMLHttpRequest();
// 		 xhr1.open("GET", "<c:url value='/userInfo/UserInfoChange/' />" + id, true);
// 		 xhr1.send();	
// 		 xhr1.onreadystatechange = function () {
// 			 if (xhr1.readyState == 4 && xhr1.status == 200) {
// 				 var message = JSON.parse(xhr1.responseText);
// 				 alert(message.email);
// 			 }
// 		}
		 
		 updateBtn.onclick = function () {
			var name = document.getElementById('name').value;
			var birthday = document.getElementById('birthday').value;
			var gender = document.getElementById('gender').value;
			var tel = document.getElementById('tel').value;
			console.log(name+birthday+gender+tel);
			var xhr = new XMLHttpRequest();
			xhr.open("PUT", "<c:url value='/userInfo/UserInfoChange/' />", true);
			var jsonMember = {
					"name": name,
					"birthday": birthday,
					"gender": gender,
					"tel": tel
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
	
</body>
</html>