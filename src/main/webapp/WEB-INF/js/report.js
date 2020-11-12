//各區域的咖啡店總數
	window.onload = function() {
		var mainDiv = document.getElementById("mainDiv");
		genAreaAmountChart();

		function genAreaAmountChart() {
			var selectArea = $("#area1").val();
			$.ajax({
				url : '../report/computedAreaAmountByCity?city=' + selectArea,
			}).done(function(response) {
				if (response) {
					var taipeiarea = response;
					var area = [];
					var amount = [];
					for (var i = 0; i < taipeiarea.length; i++) {
						area[i] = taipeiarea[i].area;
						amount[i] = taipeiarea[i].amount;
					}
					genBarChart(selectArea + '各區咖啡廳數量', area, amount);
				}
			});
		}
		function genBarChart(title, categories, amount) {
			Highcharts.chart('container', {
				title : {
					text : title
				},
				chart : {
					type : 'column'
				},
				xAxis : {
					categories : categories
				},
				yAxis : {
					title : {
						text : '數量'
					}
				},
				series : [ {
					showInLegend : false,
					data : amount
				} ]
			});
		}
		$("#area1").change(function() {
			genAreaAmountChart();
		})
	}
	
//各區域顧客訂位狀況



//每月應收帳款及實收帳款總收


//商品各個項目銷售