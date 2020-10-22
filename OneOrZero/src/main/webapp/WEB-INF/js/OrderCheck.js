function callOrder() {

	var order_Date = document.getElementById('order_Date').value;
	var orderTime = document.getElementById('orderTime').value;
    var hasBooth = document.getElementById('hasBooth').value;
    var Booth = null;
    if (hasBooth == 1){
        boothNum = document.getElementById('boothNum').value;
    }
    var phone = document.getElementById('phone').value;
    var remark = document.getElementById('remark').value;
	var store_id = document.getElementById('store_id').value;

	var myData = {
		"order_Date": order_Date,
		"orderTime": orderTime,
        "boothNum": boothNum,
        "phone": phone,
        "remark": remark,
		"store_id": store_id
	};
	$.ajax({
		type: 'POST',
		url: '/OneOrZero/OrderController',
		data: { jsonData: JSON.stringify(myData) },
		dataType: 'json',

		success:
			function (data) {
				if (data.isOK == "ok") {
					alert("預定成功");
					window.location.href = "/OneOrZero/index.html";
				} else {
					alert("輸入資料有誤");
					window.location.href = "/OneOrZero/jsp/Orders_Test.jsp";					
				}
			},
		error:
			function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status + "\n" + thrownError);
			}
	});
} 

function convertToISO(timebit) {
    // remove GMT offset
    timebit.setHours(0, -timebit.getTimezoneOffset(), 0, 0);
    // format convert and take first 10 characters of result
    var isodate = timebit.toISOString().slice(0, 10);
    return isodate;
}

function getOrderDate(){
    var bookdate = document.getElementById('order_Date');
    var currentdate = new Date();
    bookdate.min = convertToISO(currentdate);
    bookdate.placeholder = bookdate.min;
    var futuredate = new Date();
    // go forward 7 days into the future
    futuredate.setDate(futuredate.getDate() + 7);
    bookdate.max = convertToISO(futuredate);
}

