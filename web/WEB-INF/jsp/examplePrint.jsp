<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <c:url value="/resources/js/jspdf.js" var="jspdf" />
    <c:url value="/resources/js/jquery-2.1.3.js" var="jquery" />
    <c:url value="/resources/js/pdfFromHTML.js" var="pdfFromHTML" />
    <head>
        <title>HTML to PDF</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

    </head>
    <body class="container-fluid">

        <div id="HTMLtoPDF">

            <h2>Tabella gruppo NC:</h2>

            <!--<table border=1 cellspacing=0>
                <colgroup id="a" span="5"></colgroup>
                <thead>
                    <tr><th>Nome</th><th>Cognome</th></tr>
                </thead>
                <tbody>
                    <tr><td>Giandomenico</td><td>Modugno</td></tr>
                    <tr><td>Gabriele</td><td>Romano</td></tr>
                    <tr><td>Octavian</td><td>Stegarescu</td></tr>
                    <tr><td>Danu</td><td>Mawatage</td></tr>
                </tbody>
            </table>-->
            <div class="row">
                <div class="col-md-10">
                    <table class="table table-bordered">
                        <tr>
                            <td class="tg-k4yd" colspan="16">Codice NC:</td>
                        </tr>
                        <tr>
                            <td class="tg-k4yd" colspan="8">Titolo:</td>
                            <td class="tg-k4yd" colspan="4">Tipo:</td>
                            <td class="tg-k4yd" colspan="4">Stato:</td>
                        </tr>
                        <tr>
                            <td class="tg-k4yd" colspan="8">Data apertura:</td>
                            <td class="tg-k4yd" colspan="8" rowspan="3">Descrizione:</td>
                        </tr>
                        <tr>
                            <td class="tg-k4yd" colspan="8">Data chiusura:</td>
                        </tr>
                        <tr>
                            <td class="tg-k4yd" colspan="8">Priorit&agrave:</td>
                        </tr>
                        <tr>
                            <td class="tg-k4yd" colspan="8" rowspan="2">Team di lavoro:</td>
                            <td class="tg-k4yd" colspan="8">Codice prodotto:</td>
                        </tr>
                        <tr>
                            <td class="tg-k4yd" colspan="8">Reparto prodotto:</td>
                        </tr>
                        <tr>
                            <td class="tg-l711" colspan="16"></td>
                        </tr>
                        <tr>
                            <td class="tg-k4yd" colspan="16" rowspan="3">Cause:</td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td class="tg-k4yd" colspan="16" rowspan="3">Azioni di contenimento:</td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td class="tg-k4yd" colspan="16" rowspan="3">Azioni correttive:</td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td class="tg-k4yd" colspan="16" rowspan="3">Azioni preventive:</td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td class="tg-dx8v" colspan="16" rowspan="3">I eR:</td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td class="tg-yw4l" colspan="16" rowspan="3">Costo:</td>
                        </tr>

                    </table>

                </div>
            </div>
        </div>
        <br>
        <input type="submit" value="Scarica PDF" onclick="HTMLtoPDF()" >
        <br/>
        <!-- <a href=""></a>-->


        <script src="${jspdf}"></script>
        <script src="${jquery}"></script>
        <script src="${pdfFromHTML}"></script>
    </body>
</html>