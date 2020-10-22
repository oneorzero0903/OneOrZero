function callStoreOrder() {

	var timeStart = document.getElementById('timeStart').value;
	var timeEnd = document.getElementById('timeEnd').value;
	var BoothNum = document.getElementById('BoothNum').value;
	var Booth = document.getElementById('Booth').checked;
	var Phone = document.getElementById('Phone').value;

	var myData = {
		"timeStart": timeStart,
		"timeEnd": timeEnd,
		"BoothNum": BoothNum,
		"Booth": Booth,
		"Phone": Phone
	};
	$.ajax({
		type: 'POST',
		url: '${pageContext.request.contextPath}/StoreOrderController',
		data: { jsonData: JSON.stringify(myData) },
		dataType: 'json',

		success:
			function (data) {
				if (data.isOK == "ok") {
					alert("訂單設定成功");
					window.location.href = "${pageContext.request.contextPath}/jsp/index.jsp";
				} else {
					alert("輸入資料有誤");
					window.location.href = "${pageContext.request.contextPath}/jsp/StoreOrder.jsp";
					//					alert(data.account + "," + data.password);
					//					var elementObj = document.getElementById("test");
					//					elementObj.innerHTML = "<h1>account = " + data.account +"</h1>";
					//					elementObj.innerHTML += "<h1>password = " + data.password +"</h1>";
					//window.location.href="${pageContext.request.contextPath}/jsp/Output.jsp";
				}
			},
		error:
			function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status + "\n" + thrownError);
			}
	});
} 