<html>
    <head>
    <p><h1><center>Grafici Non-Conformit&agrave</center></h1></h1></p>
</head>	
<style>
    .chartdiv {
        width: 100%;
        height: 500px;
    }
</style>

<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<jsp:include page="links.jsp"/>


<script>
    /* "nc": va messo il numero, non la percentuale, perché se la calcola lui dopo (tecnicamente) */
    var chart1 = AmCharts.makeChart("chartReparto", {
        "type": "pie",
        "theme": "light",
        "dataProvider": [{
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
            }],
        "valueField": "nc",
        "titleField": "reparto",
        "balloon": {
            "fixedPosition": true
        },
        "export": {
            "enabled": true
        }
    });

    var chart2 = AmCharts.makeChart("chartFase", {
        "type": "pie",
        "theme": "light",
        "dataProvider": [{
                "fase": "Aperte",
                "nc": 50
            }, {
                "fase": "intermedie",
                "nc": 30
            }, {
                "fase": "Chiuse",
                "nc": 20
            }],
        "valueField": "nc",
        "titleField": "fase",
        "balloon": {
            "fixedPosition": true
        },
        "export": {
            "enabled": true
        }
    });
</script>
<div class="row">
    <div class="col-md-6">
        <div class="chartdiv " id="chartReparto"></div>
    </div>
    <div class="col-md-6">
        <div class="chartdiv" id="chartFase"></div>
    </div>
</div>
</html>
