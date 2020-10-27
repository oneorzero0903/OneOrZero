function checkTimeEnd() {
	var t1 = new Date();
    var timeStart = document.getElementById("timeStart").value;
    var timeEnd = document.getElementById("timeEnd").value;
    var parts = timeStart.split(":");
    t1.setHours(parts[0],parts[1],0,0);
    var t2 = new Date();
    parts = timeEnd.split(":");
    t2.setHours(parts[0],parts[1],0,0);
	if (timeStart == "" || timeEnd == "") {
		spanTime.innerHTML = "請輸入您的營業時間";
		return false;
	}
	
	if (t2.getTime() <= t1.getTime()) {
		spanTime.innerHTML = "結束時間不能大於或等於開始營業時間";
		return false;
	} 
	
	if ((t2.getTime() - t1.getTime()) < 7200000) {
		spanTime.innerHTML = "開放可訂位時間要大於2小時";
		return false;
	} else {
		spanTime.innerHTML = "";
		return true;
	}
	
}

function checkBoothNum() {
    var boothNum = document.getElementById("boothNum").value;
	if (boothNum == "") {
		spanBoothNum.innerHTML = "請輸入您的包廂數量";
		return false;
	}
}

function checkPhone() {
    var phone = document.getElementById("phone").value;
	if (phone == "") {
		spanPhone.innerHTML = "請輸入您的連絡電話";
		return false;
	}
}

