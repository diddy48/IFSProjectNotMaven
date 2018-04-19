<html>
	<head>
		<title>Grafico Non-Conformit&agrave per reparto</title>
		<p><h1><center>Grafico Non-Conformit&agrave per reparto</center></h1></h1></p>
	</head>	
<style>
#chartdiv {
  width: 100%;
  height: 500px;
}
</style>

<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>


<script>
	/* "nc": va messo il numero, non la percentuale, perché se la calcola lui dopo (tecnicamente) */
var chart = AmCharts.makeChart( "chartdiv", {
  "type": "pie",
  "theme": "light",
  "dataProvider": [ {
    "reparto": "Produzione",
    "nc": 501.9
  }, {
    "reparto": "Progettazione",
    "nc": 301.9
  }, {
    "reparto": "Logistica in entrata",
    "nc": 201.1
  }, {
    "reparto": "Logistica in uscita",
    "nc": 165.8
  }, {
    "reparto": "Commerciale",
    "nc": 139.9
  }, {
    "reparto": "Amministrativo",
    "nc": 128.3
  }   ],
  "valueField": "nc",
  "titleField": "reparto",
   "balloon":{
   "fixedPosition":true
  },
  "export": {
    "enabled": true
  }
} );
</script>


<div id="chartdiv"></div>
</html>
