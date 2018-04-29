
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
    <p><h1><center>Grafici Non-Conformit&agrave</center></h1></h1></p>
</head>	
<style>
    .chartdiv {
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
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>

<script>
    /* "nc": va messo il numero, non la percentuale, perchÃ© se la calcola lui dopo (tecnicamente) */
    var chart1 = AmCharts.makeChart("chartReparto", {
        "type": "pie",
        "theme": "light",
        "dataProvider": [{
                "reparto": "Amministrativo",
                "nc": ${calcNCReparto[0]}
            }, {
                "reparto": "Commerciale",
                "nc": ${calcNCReparto[1]}
            }, {
                "reparto": "Logistica in entrata",
                "nc": ${calcNCReparto[2]}
            }, {
                "reparto": "Logistica in uscita",
                "nc": ${calcNCReparto[3]}
            }, {
                "reparto": "Produzione",
                "nc": ${calcNCReparto[4]}
            }, {
                "reparto": "Progettazione",
                "nc": ${calcNCReparto[5]}
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
                "nc": ${calcNCFase[0]}
            }, {
                "fase": "intermedie",
                "nc": ${calcNCFase[1]}
            }, {
                "fase": "Chiuse",
                "nc": ${calcNCFase[2]}
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

    var chart = AmCharts.makeChart("chartMese", {
        "type": "serial",
        "theme": "light",
        "marginRight": 70,
        "dataProvider": [{
                "month": "Gennaio",
                "nc": ${calcNCMese[0]},
                "color": "#FF0F00"
            }, {
                "month": "Febbraio",
                "nc": ${calcNCMese[1]},
                "color": "#FF6600"
            }, {
                "month": "Marzo",
                "nc": ${calcNCMese[2]},
                "color": "#FF9E01"
            }, {
                "month": "Aprile",
                "nc": ${calcNCMese[3]},
                "color": "#FCD202"
            }, {
                "month": "Maggio",
                "nc": ${calcNCMese[4]},
                "color": "#F8FF01"
            }, {
                "month": "Giugno",
                "nc": ${calcNCMese[5]},
                "color": "#B0DE09"
            }, {
                "month": "Luglio",
                "nc": ${calcNCMese[6]},
                "color": "#04D215"
            }, {
                "month": "Agosto",
                "nc": ${calcNCMese[7]},
                "color": "#0D8ECF"
            }, {
                "month": "Settembre",
                "nc": ${calcNCMese[8]},
                "color": "#0D52D1"
            }, {
                "month": "Ottobre",
                "nc": ${calcNCMese[9]},
                "color": "#2A0CD0"
            }, {
                "month": "Novrembre",
                "nc": ${calcNCMese[10]},
                "color": "#8A0CCF"
            }, {
                "month": "Dicembre",
                "nc": ${calcNCMese[11]},
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
<br/>
<div class="row">
    <div class="col-md-6">
        <center><h1>In base al Reparto</h1></center>
        <div class="chartdiv " id="chartReparto">
            <c:if test="${empty calcNCReparto}">
                <br/>
                <br/>
                <br/>
                <center><h4 class="text-info">Non sono presenti non conformita tali da fornire dati</h4></center>
                </c:if>
        </div>
    </div>
    <div class="col-md-6">
        <center><h1>In base alla Fase</h1></center>
        <div class="chartdiv" id="chartFase">
            <c:if test="${empty calcNCReparto}">
                <br/>
                <br/>
                <br/>
                <center><h4 class="text-info">Non sono presenti non conformita tali da fornire dati</h4></center>
                </c:if>
        </div>
    </div>
</div>
<div class="row">
    <div class="col">
        <center><h1>In base al Mese</h1></center>
        <div class="chartDiv" id="chartMese">
            <c:if test="${empty calcNCReparto}">
                <br/>
                <br/>
                <br/>
                <center><h4 class="text-info">Non sono presenti non conformita tali da fornire dati</h4></center>
                </c:if>
        </div>	
    </div>
</div>
</html>
