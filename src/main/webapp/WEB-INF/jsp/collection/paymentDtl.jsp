<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>帳務訊息</title>
</head>
<body>
	<table style="border:3px #cccccc solid;" cellpadding="10" border='1'>
		<tr><td>商家名稱<td colspan="3">${ paymentDtl.store_name }
		<tr><td>商家編號<td>${ paymentDtl.store_id }<td>商家Email<td>${ paymentDtl.email }
		<tr><td>商家所在地<td>${ paymentDtl.address_area }<td>聯絡人<td>${ paymentDtl.contact_person }
		<tr><td>公司電話<td>${ paymentDtl.tel }<td>行動電話<td>${ paymentDtl.phone }
		<tr><td>帳務月份<td colspan="3">${ paymentDtl.month }
		<tr><td>應收帳款<td>${ paymentDtl.receivable }<td>實收帳款<td>${ paymentDtl.actual }
		<tr><td>帳務起訖日<td colspan="3">${ paymentDtl.paymentStart } ~ ${ paymentDtl.paymentEnd }
		<tr><td>欠款等級<td>${ paymentDtl.dueDay }<td>欠款金額<td>${ paymentDtl.balance_due }
		<tr><td>欠款天數<td colspan="3">${ paymentDtl.dueDayCount }
		<tr><td>備註<td>${ paymentDtl.remark }<td>更新日期<td>${ paymentDtl.update_dt }
	</table>
</body>
</html>