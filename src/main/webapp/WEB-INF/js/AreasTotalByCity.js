Highcharts.chart('container', {
  chart: {
    type: 'column'
  },
  xAxis: {
    categories: ['中正區', '大同區', '中山區', '松山區', '大安區', '萬華區', '信義區', '士林區', '北投區', '內湖區', '南港區', '文山區']
  },

  plotOptions: {
    series: {
      pointWidth: 20
    }
  },

  series: [{
    data: [1, 2, 5, 3, 4, 1, 2, 3, 2, 1, 4, 5]
  }]
});
