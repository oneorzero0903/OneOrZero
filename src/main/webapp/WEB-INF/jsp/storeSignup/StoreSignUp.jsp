<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        .wrap {
            text-align: center;
        }
    </style>
    <title>商家註冊</title>
</head>
<script src="https://code.jquery.com/jquery-3.1.0.js"> </script>
<script src="/OneOrZero/js/StoreSignup.js"></script>
<body>
    <div class="wrap">
        <h2>商家註冊</h2>
        <form action="form.html">
            <label for="email">請輸入信箱</label>
            <input type="email" name="email" id="email" class="email" placeholder="請輸入信箱">
            <br>
            <label for="password">請輸入密碼</label>
            <input type="password" id="idPwd1" name="password" placeholder="請輸入密碼" onblur="checkPwd();" onkeyup="checkPwd();" />
            <span id="idspPwd1"></span>
            <br>
            <label for="password1">請再次輸入密碼</label>
            <input type="password" id="idPwd2" placeholder="請再次輸入密碼" onblur="checkPwdReapeat();"
                onkeyup="checkPwdReapeat();" />
            <span id="idspPwd2"></span>
            <br>
            <label for="text">公司名稱</label>
            <input type="text" name="corporation" id="Store_name" class="corporation" placeholder="請輸入公司名稱">
            <div class="st1">

                <label for="" class="t1">所在縣市</label>
                <select name="country" id="country">
                    <option value="">==============</option>
                    <option value="Taipei City">Taipei City</option>
                    <option value="New Taipei City">New Taipei City</option>
                </select>
                <br>
                <label for="" class="t1">所在地區</label>
                <select name="area" id="area">
                    <option value="Zhong Zheng">中正區</option>
                </select>
                <br>
                <br>
                <label for="" class="t1">所在地路名</label>
                <input type="text" name="road" id="Address_road" placeholder="請輸入路名">
                <br> <label for="tel" class="tel">公司電話</label>
                <input type="tel" name="tel" id="Tel" placeholder="請輸入公司電話">
                <br>
                <label for="cellphone" class="cellphone">行動電話</label>
                <input type="tel" name="cellphone" id="Phone" placeholder="請輸入行動電話">
                <br>
            </div>
            <div class="st1">
                <label for="" class="t1">營業開始時間</label>
                <input type="time" name="opentime" id="Opentime_start" size="30">
            </div>
            <div class="st1">
                <label for="" class="t1" >營業結束時間</label>
                <input type="time" name="endtime" id="Opentime_end" size="30">
            </div>
            <div class="st1">
                <label for="">聯絡人</label>
                <input type="text" name="idName" id="idName" placeholder="請輸入姓名" onblur="checkContactPerson()"
                    onkeyup="checkContactPerson()">
                <span id="idspName"></span>
                <br>
                <span class="st1">(1.不可空白，2.至少2個字以上，3.必須全部為中文字)</span>
            </div>
            <!--  <label for="">上傳照片</label>
                <input type="file" name="file0" id="progressbarTWInput" multiple="multiple" /><br>
                <img src="" id="img0">-->
                <br>
                <div id="btn">
                    <input type="button" value="確認送出" class="sure" onclick="register()">
                    <input type="reset" value="取消重填" class="cancel">
                </div>
            </form>
    </div>
</body>
</html>