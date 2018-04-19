<html>
	<head>
		<title>Grafico Non-Conformit&agrave</title>
		<p><h1><center>Grafico Non-Conformit&agrave</center></h1></h1></p>
	</head>	
	
<style>
#chartdiv {
  width: 100%;
  height: 500px;
}

.amcharts-export-menu-top-right {
  top: 10px;
  right: 0;
}
</style>

<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>

<script>
var chart = AmCharts.makeChart("chartdiv", {
  "type": "serial",
  "theme": "light",
  "marginRight": 70,
  "dataProvider": [{
    "month": "Gennaio",
    "nc": 45,
    "color": "#FF0F00"
  }, {
    "month": "Febbraio",
    "nc": 58,
    "color": "#FF6600"
  }, {
    "month": "Marzo",
    "nc": 134,
    "color": "#FF9E01"
  }, {
    "month": "Aprile",
    "nc": 72,
    "color": "#FCD202"
  }, {
    "month": "Maggio",
    "nc": 115,
    "color": "#F8FF01"
  }, {
    "month": "Giugno",
    "nc": 54,
    "color": "#B0DE09"
  }, {
    "month": "Luglio",
    "nc": 94,
    "color": "#04D215"
  }, {
    "month": "Agosto",
    "nc": 52,
    "color": "#0D8ECF"
  }, {
    "month": "Settembre",
    "nc": 63,
    "color": "#0D52D1"
  }, {
    "month": "Ottobre",
    "nc": 65,
    "color": "#2A0CD0"
  }, {
    "month": "Novrembre",
    "nc": 87,
    "color": "#8A0CCF"
  }, {
    "month": "Dicembre",
    "nc": 300,
    "color": "#CD0D74"
  }],
  "valueAxes": [{
    "axisAlpha": 0,
    "position": "left",
    "title": "Numero Non-Conformita'"
  }],
  "startDuration": 1.3,
  "graphs": [{
    "balloonText": "<b>[[category]]: [[value]]</b>",
    "fillColorsField": "color",
    "fillAlphas": 0.9,
    "lineAlpha": 0.2,
    "type": "column",
    "valueField": "nc"
  }],
  "chartCursor": {
    "categoryBalloonEnabled": false,
    "cursorAlpha": 0,
    "zoomable": false
  },
  "categoryField": "month",
  "categoryAxis": {
    "gridPosition": "start",
    "labelRotation": 45
  },
  "export": {
    "enabled": true
  }

});
</script>

<div id="chartdiv"></div>	

</html>
