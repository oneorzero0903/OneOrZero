<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>訂位</title>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script src="/OneOrZero/js/OrderCheck.js"></script>
</head>
<body>
	<form action="/OneOrZero/OrderController" method="post">
		營業時間 :${checks.timeStart} ~ ${checks.timeEnd} 
		<br>
		<br>
		訂位日期 : <input type="date" name="order_Date" id="order_Date" onclick="getOrderDate()">	
		<br>
		<br>
		訂位時間 : <input type="time"	name="orderTime" id="orderTime">
		<br>	
		<br>
		<c:choose>
			<c:when test="${checks.isBooth == 'true'}">
				<input type="hidden" name="hasBooth" id="hasBooth" value="1">
				<br> 包廂 : 
				<select name="boothNum" id="boothNum">
					<option value="" selected>請選擇</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
				</select><br>
			</c:when>
			<c:otherwise>
				<input type="hidden" name="hasBooth" id="hasBooth" value="0">				
			</c:otherwise>
		</c:choose>
		
		<br> 電話 : <input type="text" name="phone" id="phone"><br>
		<br> 備註 : <input type="text" name="remark" id="remark"><br>
		<br>
		<input type="hidden" name="store_id" id="store_id" value="${checks.store_id}">
		<br>
		<input type="button" onclick="callOrder()" value="確認送出">
     	<input type="reset"	value="全部清空" />
	</form>
</body>
</html>