function checkPwd() {
    let pwd = document.getElementById("idPwd1");
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
    let pwd1 = document.getElementById("idPwd1");
    let pwd2 = document.getElementById("idPwd2");
    let spPwd = document.getElementById("idspPwd2");

    let check =
        pwd1.value === pwd2.value;

    if (check) {
        showRight(spPwd);

    } else {
        spPwd.innerHTML = "密碼不相符";
    }

}

function checkContactPerson() {
    let id = document.getElementById("idName");
    let spId = document.getElementById("idSpName");
    let check = checkName() && checkChinese();
    if (check) {
        showRight(spId);
    }
}

function checkName() {
    let name = document.getElementById("idName");
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
    element.innerHTML = "請填寫中文";
}

function register() {
    let check = validate();
    if (check) {
        var email = document.getElementById('email').value;
        var idPwd1 = document.getElementById('idPwd1').value; //Password
        var Store_name = document.getElementById('Store_name').value;
        var country = document.getElementById('country').value; //Address_county
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
            "idPwd1": idPwd1,
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
            url: '${pageContext.request.contextPath}/StoreSignupController',
            data: { jsonData: JSON.stringify(myData) },
            dataType: 'json',

            success:
                function (data) {
                    if (data.isOK == "ok") {
                        alert("註冊成功");
                        window.location.href = "${pageContext.request.contextPath}/jsp/SignUpOK.jsp";
                    } else {
                        alert("輸入資料有誤");
                        window.location.href = "${pageContext.request.contextPath}/jsp/StoreSignUp.jsp";					
                    }
                },
            error:
                function (xhr, ajaxOptions, thrownError) {
                    alert(xhr.status + "\n" + thrownError);
                }
        });
    }

}

function validate() {
    console.log("validate")
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


$("#progressbarTWInput").change(function () {

    readURL(this);
});



function readURL(input) {

    if (input.files && input.files[0]) {

        var reader = new FileReader();

        reader.onload = function (e) {

            $("#img0").attr('src', e.target.result);

        }

        reader.readAsDataURL(input.files[0]);

    }

}

$("#country").change(function () {
    if ($(this).val() === 'Tpe') {
        $("#area").html("<option>Tpe</option>")
    } else if ($(this).val() === 'Tph') {
        $("#area").html("<option>Tph</option>")
    }
})

function checkSubmit() {
    checkName();
    checkPwd();
}