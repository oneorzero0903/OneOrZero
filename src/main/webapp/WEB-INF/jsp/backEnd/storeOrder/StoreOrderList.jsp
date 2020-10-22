<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StoreOrderList</title>
</head>
<body>
	<c:forEach var="storeOrderLists" items="${storeOrderList}">
		<label>訂單編號 :${storeOrderLists.order_Id}</label>，
		<label>姓名 :${storeOrderLists.name}</label>，
		<label>Email:${storeOrderLists.email}</label>，
		<label>預約日期 :${storeOrderLists.order_Date}</label>，
		<label>預約時間 :${storeOrderLists.orderTime}</label>，
		<label>包廂數 :${storeOrderLists.boothNum}</label>，
		<label>連絡電話 :${storeOrderLists.phone}</label>，
		<label>備註 :${storeOrderLists.remark}</label>，
		<label>VIP等級 :${storeOrderLists.vip}</label><br><br>
	</c:forEach>
</body>
</html>