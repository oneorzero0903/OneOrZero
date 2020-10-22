<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>訂位設定</title>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>  
<script src="<c:url value='/js/StoreOrder.js'	/>"></script>
</head>
<body>
	<form method="POST" action="/OneOrZero/StoreOrderController" >
		<p>  
            <label class="t1" for="">可訂位時間 :</label>
            
            <input type="time" name="timeStart_" id="timeStart"> ~ 
            <input type="time" name="timeEnd_" id="timeEnd">
        </p>
        <br><br>
		
        <label for="" class="t1">包廂 :</label>
        <label>
            <input type="checkbox" name="Booth_" id="Booth">
                       數量：<select name="BoothNum_" id="BoothNum">
				<option value="" selected>請選擇</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
			</select>
        </label><br><br>    
        <label for="" class="t1">電話 :</label> 
            <input type="text" name="Phone_" id="Phone">
		<input type="button" onclick="callStoreOrder()" value="確認送出">
     	<input type="reset"	value="全部清空" />
	</form>
</body>
</html>