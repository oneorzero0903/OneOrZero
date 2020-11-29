window.onload = function () {
    var mainDiv = document.getElementById("mainDiv");
<<<<<<< HEAD
    //各區域的咖啡店總數 change
    genAreaAmountChart();
    $("#area1").change(function () {
        genAreaAmountChart();
    })
    //每月應收帳款及實收帳款 change
    genIncomeChart();
    $("#incomecity").off("change").change(function () {
        $("#incomemonth").val("01");
        genIncomeChart();
    })
    $("#incomemonth").off("change").change(function () {
        genIncomeChart();
    })
    //商品各個項目銷售 Top N change
    genSaleBeansChart();
    $("#coffeeproduct").change(function () {
        genSaleBeansChart();
    })
=======
    genAreaAmountChart();

    $("#area1").change(function () {
        genAreaAmountChart();
    })
>>>>>>> f1b340708c8dd0adc4ffdf8f55f1fd7540ba6612

    $(document).ready(function () {
        let countryElement = document.getElementById("address_city1");
        $("#address_area1").empty();
        tw_city.counties.forEach(function (country) {
            $(countryElement).append(`<option value="${country.key}">${country.value}</option>`);
        })
        bindCountryEvent();

        tw_city.districts[$("#address_city1").val()].forEach(function (area) {
            $("#address_area1").append(`<option value"${area}">${area}</option>`);
        })
<<<<<<< HEAD
        //各區訂位數
        queryOrderAmountByDays();
        queryOrderAmountByTimes();
        $("#address_area1").off("change").on("change", function () {
            queryOrderAmountByDays();
            queryOrderAmountByTimes();
        })
=======
>>>>>>> f1b340708c8dd0adc4ffdf8f55f1fd7540ba6612
        $("#opentime_start").change(function () {
            checkTimeEnd();
        })
        $("#opentime_end").change(function () {
            checkTimeEnd();
        })
    })
<<<<<<< HEAD
}
// 商品各個項目銷售 Top N
function genSaleBeansChart() {
    var selectType = $("#coffeeproduct").val();
    var title = $("#coffeeproduct :selected").text();
    $.ajax({
        url: '../report/computedProductItems?pType=' + selectType,
    }).done(function (response) {
        if (response) {
            var datas = [];
            for (var i = 0; i < response.length; i++) {
                var data = {
                    name: response[i].name,
                    y: response[i].quantity
                };
                datas.push(data);
            }
            saleBeansTopN(title, datas);
        }
    });
}
// 商品各個項目銷售 Top N -套入圖表
function saleBeansTopN(title, beansData) {
    Highcharts.chart('products', {
        chart: {
            type: 'pie'
        },
        title: {
            text: title
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                showInLegend: true
            }
        },
        series: [{
            name: '數量',
            colorByPoint: true,
            data: beansData
        }]
    });
}
=======

    //各區域顧客訂位狀況-時間
    var chart = Highcharts.chart('TimeOrders', {
        title: {
            text: '中正區咖啡廳訂位'
        },
        xAxis: {
            categories: ['00~02時', '02~04時', '04~06時', '06~08時', '08~10時', '10~12時', '12~14時', '14~16時', '16~18時', '18~20時', '20~22時', '22~24時']
        },
        yAxis: {
            title: {
                text: '次數'
            }
        },
        series: [{
            type: 'column',
            colorByPoint: true,
            data: [0, 0, 1, 0, 2, 5, 13, 7, 15, 4, 6, 1],
            showInLegend: false
        }]
    });
    //各區域顧客訂位狀況-日期
    var chart = Highcharts.chart('DayOrders', {

        title: {
            text: '中正區咖啡廳訂位'
        },
        xAxis: {
            categories: ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六', '星期日']
        },
        yAxis: {
            title: {
                text: '次數'
            }
        },

        series: [{
            type: 'column',
            colorByPoint: true,
            data: [20, 12, 6, 18, 3, 19, 23],
            showInLegend: false
        }]
    });


    //每月應收帳款及實收帳款總收
    Highcharts.chart('payment', {
        chart: {
            type: 'line'
        },
        title: {
            text: '台北市各區總收入'
        },
        xAxis: {
            categories: ['中正區', '大同區', '中山區', '松山區', '大安區', '萬華區', '信義區', '士林區', '北投區', '內湖區', '南港區', '文山區']
        },
        yAxis: {
            title: {
                text: '金額'
            }
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: true
                },
                enableMouseTracking: false
            }
        },
        series: [{
            name: '應收金額',
            data: [700000, 690000, 950000, 145000, 184000, 215000, 252000, 265000, 233000, 183000, 139000, 96000]
        }, {
            name: '實收金額',
            data: [450000, 510000, 570000, 145000, 179000, 210000, 251000, 230000, 225000, 160000, 110000, 480000]
        }]
    });

    genSaleBeansChart();
}

>>>>>>> f1b340708c8dd0adc4ffdf8f55f1fd7540ba6612
//各區域的咖啡店總數
function genAreaAmountChart() {
    var selectArea = $("#area1").val();
    $.ajax({
        url: '../report/computedAreaAmountByCity?city=' + selectArea,
    }).done(function (response) {
        if (response) {
            var taipeiarea = response;
            var area = [];
            var amount = [];
            for (var i = 0; i < taipeiarea.length; i++) {
                area[i] = taipeiarea[i].area;
                amount[i] = taipeiarea[i].amount;
            }
            genCoffeeShopTotalChart(selectArea + '各區咖啡廳數量', area, amount);
        }
    });
}
<<<<<<< HEAD
//各區域的咖啡店總數 -套入圖表
=======

>>>>>>> f1b340708c8dd0adc4ffdf8f55f1fd7540ba6612
function genCoffeeShopTotalChart(title, categories, amount) {
    Highcharts.chart('coffeeShopTotal', {
        title: {
            text: title
        },
        chart: {
            type: 'column'
        },
        xAxis: {
            categories: categories
        },
        yAxis: {
            title: {
                text: '數量'
            }
        },
        series: [{
<<<<<<< HEAD
            name: '數量',
            data: amount,
            showInLegend: false,
=======
            data: amount
>>>>>>> f1b340708c8dd0adc4ffdf8f55f1fd7540ba6612
        }]
    });
}
//城市、地區切換
function bindCountryEvent() {
    $("#address_city1").off("change").change(function () {
        if ($(this).val() !== 'empty') {
            $("#address_area1").empty();
            tw_city.districts[$(this).val()].forEach(function (area) {
                $("#address_area1").append(`<option value"${area}">${area}</option>`);
            })
<<<<<<< HEAD
            queryOrderAmountByDays();
            queryOrderAmountByTimes();
        }
    })
}
//城市、月份切換


//每月各區收益
function genIncomeChart() {
    var selectCity = $("#incomecity").val();
    var selectMonth = $("#incomemonth").val();
    $.ajax({
        url: '../report/computedPaymentAreaMonth?month=' + selectMonth + '&city=' + selectCity
    }).done(function (response) {
        if (response) {
            var area = response.map(result => result.area);
            var receivable = response.map(result => result.receivable);
            var actual = response.map(result => result.actual);
            cityincomeChart(selectCity + '各區收益', area, receivable, actual);
        }
    });
}
//每月各區收益-套入圖表
function cityincomeChart(city, area, receivable, actual) {
    Highcharts.chart('income', {
        chart: {
            type: 'line'
        },
        title: {
            text: city
        },
        xAxis: {
            categories: area
        },
        yAxis: {
            title: {
                text: '金額'
            }
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: true
                },
                enableMouseTracking: false
            }
        },
        series: [{
            name: '應收金額',
            data: receivable
        }, {
            name: '實收金額',
            data: actual
        }]
    });
}

function queryOrderAmountByDays() {
    var area = $("#address_area1").val();
    $.ajax({
        url: '../report/computedOrderAmountByDays?area=' + area
    }).done(function (response) {
        if (response) {
            genOrderAmountByDaysChart(area, response.map(result => result.day), response.map(result => result.amount));
        }
    });
}

function queryOrderAmountByTimes() {
    var area = $("#address_area1").val();
    $.ajax({
        url: '../report/computedOrderAmountByTimes?area=' + area
    }).done(function (response) {
        if (response) {
            genOrderAmountByTimesChart(area, response.map(result => result.time), response.map(result => result.amount));
        }
    });
}

function genOrderAmountByDaysChart(area, days, amount) {
    //各區域顧客訂位狀況-日期
    Highcharts.chart('DayOrders', {

        title: {
            text: area + '咖啡廳訂位'
        },
        xAxis: {
            categories: days
        },
        yAxis: {
            title: {
                text: '次數'
            }
        },

        series: [{
            name: '次數',
            type: 'column',
            colorByPoint: true,
            data: amount,
            showInLegend: false
        }]
    });
}

function genOrderAmountByTimesChart(area, times, amount) {
    //各區域顧客訂位狀況-時間
    Highcharts.chart('TimeOrders', {
        title: {
            text: area + '咖啡廳訂位'
        },
        xAxis: {
            categories: times
        },
        yAxis: {
            title: {
                text: '次數'
            }
        },
        series: [{
            name: '次數',
            type: 'column',
            colorByPoint: true,
            data: amount,
            showInLegend: false
=======
        }
    })
}

// 商品各個項目銷售 Top N
function genSaleBeansChart() {
    var selectType = $("#coffeeproduct").val();
    var title = $("#coffeeproduct :selected").text();
    $.ajax({
        url: '../report/computedProductItems?type=' + selectType,
    }).done(function (response) {
        if (response) {
            console.log(response);
            // var taipeiarea = response;
            // var area = [];
            // var amount = [];
            // for (var i = 0; i < taipeiarea.length; i++) {
            //     area[i] = taipeiarea[i].area;
            //     amount[i] = taipeiarea[i].amount;
            // }
        }
    });
    saleBeansTopN(title, [{
        name: '果樹女神咖啡豆',
        y: 300
    }, {
        name: '百蜜花園咖啡豆',
        y: 235
    }, {
        name: '義式咖啡豆',
        y: 410
    }, {
        name: '花香耶加雪菲咖啡豆',
        y: 199
    }, {
        name: '黃金曼特寧咖啡豆',
        y: 450
    }]);
}

function saleBeansTopN(title, beansData) {
    Highcharts.chart('products', {
        chart: {
            type: 'pie'
        },
        title: {
            text: title
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                showInLegend: true
            }
        },
        series: [{
            name: 'Quantity',
            colorByPoint: true,
            data: beansData
>>>>>>> f1b340708c8dd0adc4ffdf8f55f1fd7540ba6612
        }]
    });
}