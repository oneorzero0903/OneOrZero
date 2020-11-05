var checkPhoneSubmit = false;
var checkAddressSubmit = false;
var checkDateSubmit = false;
var checkTimeSubmit = false;
var checkSpaceSubmit = false;
var checkPersonSubmit = false;
var checkBoothNumSubmit = false;

function checkPhone(phoneVal) {
	var phone = phoneVal.val();
	if (phone == "") {
		phoneVal.next().text("請輸入您的連絡電話");
		checkPhoneSubmit = false;
	} else {
		phoneVal.next().text("");
		checkPhoneSubmit = true;
	}
}
function checkAddress(addressVal) {
	var address = addressVal.val();
	if (address == "") {
		addressVal.next().text("請輸入您的店家地址");
		checkAddressSubmit = false;
	} else {
		addressVal.next().text("");
		checkAddressSubmit = true;
	}
}
function checkDate(dateStart, dateEnd) {
	var dateStartVal = dateStart.val();
	var dateEndVal = dateEnd.val();
	if (dateStartVal == 0 || dateEndVal == 0){
		dateEnd.next().text("請選擇日期");
		checkDateSubmit = false;
	} else {
		dateEnd.next().text("");
		checkDateSubmit = true;
	}
}
function checkTime(start, end) {
	var t1 = new Date();
	var timeStart = start.val();
	var timeEnd = end.val();
	console.log(timeStart);
	console.log(timeEnd);
	if (timeStart == -1 || timeEnd == -1) {
		end.next().text("請輸入您的營業時間");
		checkTimeSubmit = false;
	} else if ((timeEnd - timeStart < 2)) {
		end.next().text("至少要大於2小時");
		checkTimeSubmit = false;
	} else {
		end.next().text("");
		checkTimeSubmit = true;
	}
}
function checkSpace(space){
	var spaceVal = space.val();
	if (spaceVal == "0") {
		space.next().text("請輸入您的預約間格");
		checkSpaceSubmit = false;
	} else {
		space.next().text("");
		checkSpaceSubmit = true;
	}
}
function checkPerson(person) {
	var personVal = person.val();
	if (personVal == ""){
		person.next().text("請輸入可容納人數");
		checkPersonSubmit = false;
	} else {
		person.next().text("");
		checkPersonSubmit = true;
	}
}
function checkBoothNum(num) {
	var boothNum = num.val();
	if (boothNum == "") {
		num.next().text("請輸入您的包廂數量");
		checkBoothNumSubmit = false;
	} else {
		num.next().text("");
		checkBoothNumSubmit = true;
	}
}
function ValidateNumber(e, pnumber)
{
    if (!/^\d+$/.test(pnumber)){
        $(e).val(/^\d+/.exec($(e).val()));
    }
    return false;
}

function add() {
	let lessThan = checkLength(3)
	if (!lessThan) return
	$('.wrap').append(template)
}
function del(dom) {
	$(dom).parent().remove()
}
function checkLength(num) {
	let length = $('.menuList').length
	if (length >= num) return false
	return true
}