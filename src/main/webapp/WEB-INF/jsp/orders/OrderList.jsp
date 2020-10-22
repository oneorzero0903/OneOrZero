<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OrderList</title>
</head>
<body>
	<c:forEach var="orderLists" items="${orderList}">
		<a href='http://localhost:8080/OneOrZero/CheckController?store_id=${orderLists.store_id}'>${orderLists.store_name}</a><br>
	</c:forEach>
</body>
</html>