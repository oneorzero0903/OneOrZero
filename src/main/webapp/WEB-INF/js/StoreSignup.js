window.onload = function() {
	var oneClick = document.getElementById("storeSignUpBtn");
	oneClick.onclick = function() {//一鍵輸入
		document.getElementById("email").value = "oneorzerocorp@gmail.com";
		document.getElementById("password").value = "abcd1234!";
		document.getElementById("idPwd2").value = "abcd1234!";
		document.getElementById("store_name").value = "Jacob company";
		$("#address_city").val("台北市").change();
		document.getElementById("address_area").value = "中正區";
		document.getElementById("address_road").value = "中正路";
		document.getElementById("tel").value = "02-1234567";
		document.getElementById("phone").value = "0919123456";
		document.getElementById("opentime_start").value = "08:00";
		document.getElementById("opentime_end").value = "20:00";
		document.getElementById("contact_person").value = "Mark";
	};

	//信箱
	function checkEmail() {
		let email = document.getElementById("email");
		let spEmail = document.getElementById("spanEmail");
		let check =
			checkSpace(spEmail, email.value) &&
			checkEmailFormat(spEmail, email);

		if (check) {
			showRight(spEmail);
		}
	}

	function checkEmailFormat(element, email) {
		let reg = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/g;
		if (reg.test(email.value)) {
			return true;
		}
		element.innerHTML = "email 格式錯誤";
	}

	//密碼

	function checkPwd() {
		let pwd = document.getElementById("password");
		let spPwd = document.getElementById("idspPwd1");

		let check =
			checkSpace(spPwd, pwd.value) &&
			checkTextLenth(spPwd, pwd.value, 8)
		if (check) {
			showRight(spPwd);
		}
	}

	function checkSpace(element, text) {
		if (text) {
			return true;
		}
		element.innerHTML = "欄位不可空白";
	}

	function checkTextLenth(element, text, length) {
		if (text.length >= length) {
			return true;
		}
		element.innerHTML = `長度至少${length}個字以上`;
	}

	function showRight(element) {
		element.innerHTML = "填寫正確";
	}

	function checkPwdReapeat() {
		let pwd1 = document.getElementById("password");
		let pwd2 = document.getElementById("idPwd2");
		let spPwd = document.getElementById("idspPwd2");

		let check =
			checkSpace(spPwd, pwd2.value) &&
			checkSameValue(spPwd, pwd1, pwd2);

		if (check) {
			showRight(spPwd);
		}

	}

	function checkSameValue(element, value1, value2) {
		if (value1.value === value2.value) {
			return true;
		}
		element.innerHTML = "密碼不相符";
	}

	function checkContactPerson() {
		let id = document.getElementById("contact_person");
		let spId = document.getElementById("idSpName");
		let check = checkName() && checkChinese();
		if (check) {
			showRight(spId);
		}
	}

	function checkName() {
		let name = document.getElementById("contact_person");
		let spName = document.getElementById("idspName");

		let check =
			checkSpace(spName, name.value) &&
			checkTextLenth(spName, name.value, 2) &&
			checkChinese(spName, name.value);

		if (check) {
			showRight(spName);
		}
	}

	function checkChinese(element, text) {
		let reg = /^[\u4E00-\u9FA5]+$/;
		if (reg.test(text)) {
			return true;
		}
		//element.innerHTML = "請填寫中文";
	}

	function register() {
		if (validate()) {
			var email = document.getElementById('email').value;
			var password = document.getElementById('password').value; //Password
			var Store_name = document.getElementById('Store_name').value;
			var country = document.getElementById('country').value; //Address_city
			var area = document.getElementById('area').value; //Address_area
			var Address_road = document.getElementById('Address_road').value;
			var Tel = document.getElementById('Tel').value;
			var Phone = document.getElementById('Phone').value;
			var Opentime_start = document.getElementById('Opentime_start').value;
			var Opentime_end = document.getElementById('Opentime_end').value;
			var idName = document.getElementById('idName').value; //contact_person
			//var progressbarTWInput = document.getElementById('progressbarTWInput').value;

			var myData = {
				"email": email,
				"password": password,
				"Store_name": Store_name,
				"country": country,
				"area": area,
				"Address_road": Address_road,
				"Tel": Tel,
				"Phone": Phone,
				"Opentime_start": Opentime_start,
				"Opentime_end": Opentime_end,
				"idName": idName,
			};
			$.ajax({
				type: 'POST',
				url: '/OneOrZero/StoreSignupController',
				data: {
					jsonData: JSON.stringify(myData)
				},
				dataType: 'json',

				success: function(data) {
					if (data.isOK == "ok") {
						alert("訂單設定成功");
						window.location.href = "/OneOrZero/jsp/SignUpOK.jsp";
					} else {
						alert("輸入資料有誤");
						window.location.href = "/OneOrZero//jsp/StoreSignUp.jsp";
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(xhr.status + "\n" + thrownError);
				}
			});
		}

	}

	function validate() {
		return checkEmail() && checkPwd() && checkName() && checkPwdReapeat() && checkContactPerson();
	}

	function checkEmpty(form, ...fields) {
		return fields
			.map(field => form[field])
			.every(field => field);
	}


	//營業時間

	function checkTimeEnd() {
		var t1 = new Date();
		var timeStart = document.getElementById("opentime_start").value;
		var timeEnd = document.getElementById("opentime_end").value;
		var parts = timeStart.split(":");
		t1.setHours(parts[0], parts[1], 0, 0);
		var t2 = new Date();
		parts = timeEnd.split(":");
		t2.setHours(parts[0], parts[1], 0, 0);
		if (timeStart == "" || timeEnd == "") {
			spanTime.innerHTML = "請輸入您的營業時間";
			return false;
		}

		if (t2.getTime() <= t1.getTime()) {
			spanTime.innerHTML = "結束時間不能小於或等於開始營業時間";
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

	function validate() {
		console.log("validate");
		let form = $('form').serializeArray()
			.reduce((result, property) => {
				result[property.name] = property.value;
				return result;
			}, {});
		console.log(form)
		return checkEmpty(form, 'email', 'password');
	}

	function checkEmpty(form, ...fields) {
		console.log("checkEmpty")
		return fields
			.map(field => form[field])
			.every(field => field);
	}

	$("#progressbarTWInput").change(function() {

		readURL(this);
	});

	//當使用者圖片選擇完畢,在畫面上show出來預覽

	function register() {
		let check = validate();
		if (check) {
			document.forms["SignUpForm"].submit();
		} else {
			return false;
		}
	}

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#showImg").attr("src", e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	$("#storeImage").change(function() {
		readURL(this);
	});

	//地區選擇

	function bindCountryEvent() {
		$("#address_city").off("change").change(function() {
			$("#address_area").html('<option value="NONE" label="請選擇..." />')
			if ($(this).val() !== 'empty') {
				tw_city.districts[$(this).val()].forEach(function(area) {
					$("#address_area").append(`<option value"${area}">${area}</option>`);
				})
			}
		})
	}

	$(document).ready(function() {
		let countryElement = document.getElementById("address_city");
		$(countryElement).append('<option value="NONE" label="請選擇..." />')
		tw_city.counties.forEach(function(country) {
			$(countryElement).append(`<option value="${country.key}">${country.value}</option>`);
		})
		$("#address_area").append('<option value="NONE" label="請選擇..." />')
		bindCountryEvent();
		$("#opentime_start").change(function() {
			checkTimeEnd();
		})
		$("#opentime_end").change(function() {
			checkTimeEnd();
		})
	})
};



