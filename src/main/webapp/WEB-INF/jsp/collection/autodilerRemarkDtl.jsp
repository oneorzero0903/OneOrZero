<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#textareaId{
	resize:none;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<table style="border:3px #cccccc solid;" cellpadding="10" border='1'>
		<tr><td>商家名稱<td colspan="3">${ autodilerRemarkDtl.store_name }
		<tr><td>商家編號<td>${ autodilerRemarkDtl.store_id }<td>商家Email<td>${ autodilerRemarkDtl.email }
		<tr><td>商家所在地<td>${ autodilerRemarkDtl.address_area }<td>聯絡人<td>${ autodilerRemarkDtl.contact_person }
		<tr><td>公司電話<td>${ autodilerRemarkDtl.tel }<td>行動電話<td>${ autodilerRemarkDtl.phone }
		<tr><td>帳務月份<td colspan="3">${ autodilerRemarkDtl.month }
		<tr><td>應收帳款<td>${ autodilerRemarkDtl.receivable }<td>實收帳款<td>${ autodilerRemarkDtl.actual }
		<tr><td>帳務起訖日<td colspan="3">${ autodilerRemarkDtl.paymentStart } ~ ${ autodilerRemarkDtl.paymentEnd }
		<tr><td>欠款等級<td>${ autodilerRemarkDtl.dueDay }<td>欠款金額<td>${ autodilerRemarkDtl.balance_due }
		<tr><td>欠款天數<td colspan="3">${ autodilerRemarkDtl.dueDayCount }
		<tr><td>備註<td>${ autodilerRemarkDtl.remark }<td>更新日期<td>${ autodilerRemarkDtl.update_dt }
	</table>
	<div class="" align="center" style="width: 500px;">

		<c:if test="${ autodilerRemarkDtl.isAutodiler != 1 }">
			<textarea id="textareaId" rows="5" cols="76" placeholder="電催紀錄" onblur="checkText();"></textarea><br>
			<input type="button" value="確認送出" id="btn" onclick="addComment();" />
		</c:if>
		<input type="button" value="關閉視窗" id="cancel" onclick="window.close();" />
	</div>
	<script>
		function checkText() {
			var textarea = document.getElementById("textareaId").value;
			if( textarea == null || textarea.trim().length == 0) {
				return false;
			} else {
				return true;
			}
		}
		
		function addComment() {
			if (checkText()) {
				var xhr = new XMLHttpRequest();
				var textarea = document.getElementById("textareaId").value;
				var sid = ${ autodilerRemarkDtl.payment_id };
				var remarkUpdateRequest = {
					remark : textarea,
					payment_id : sid
				}
				$.ajax({
			  		type: 'POST',
			  		url: '<c:url value="/collection/autodilerRemarkUpdate"	/>',
			  		data: JSON.stringify(remarkUpdateRequest),
			  		contentType:"application/json;charset=UTF-8",
			  		dataType: 'json',
			  		success:
			  			function (data) {
			  				if (data.isOk == "ok") {
			  					alert("更新電催資料成功");
			  					window.close();
			  				} else {
			  					alert("系統有誤，請洽資訊人員");
			  				}
			  			},
			  		error:
			  			function (xhr, ajaxOptions, thrownError) {
			  				alert(xhr.status + "\n" + thrownError);
			  			}
			  	});
			} else {
				alert("請輸入電催紀錄");
			}
		}
	</script>
</body>
</html>