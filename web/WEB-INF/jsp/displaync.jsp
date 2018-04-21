<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<form id="form1">
        <div id="dvContainer">

            <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
            <script type="text/javascript">
                $("#btnPrint").live("click", function () {
                    var divContents = $("#dvContainer").html();
                    var printWindow = window.open('', '', 'height=900,width=800');
                    printWindow.document.write('<html><head><link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">');
                    printWindow.document.write('</head><body class="container-fluid" >');
                    printWindow.document.write(divContents);
                    printWindow.document.write('</body></html>');
                    printWindow.document.close();
                    printWindow.print();
                });
            </script>

            <div class="row">
                <div class="col-md-10 offset-md-1">
                    <h2>Tabella Non-Conformit&agrave </h2><br></br>
                    <table class="table table-bordered table-striped" >
                        <tr>
                            <td colspan="16">Codice NC:${nc.numeroNC}</td>
                        </tr>
                        <tr>
                            <td colspan="8">Titolo:${nc.titolo}</td>
                            <td colspan="4">Tipo:${nc.tipo}</td>
                            <td colspan="4">Fase: ${fase}</td>
                        </tr>
                        <tr>
                            <td colspan="8">Data apertura:${nc.dataA}</td>
                            <td colspan="8" rowspan="3">Descrizione:${nc.descrizione}</td>
                        </tr>
                        <tr>
                            <td colspan="8">Data chiusura:${nc.dataC}</td>
                        </tr>
                        <tr>
                            <td colspan="8">Priorit&agrave:${nc.priorita}</td>
                        </tr>
                        <tr>
                            <td colspan="8" rowspan="2">Team di lavoro:</td>
                            <td colspan="8">Codice prodotto:${nc.codiceProdotto}</td>
                        </tr>
                        <tr>
                            <td colspan="8">Reparto prodotto:${nc.repartoP}</td>
                        </tr>
                        <tr style="height:70px;background:lightgray">
                            <td colspan="16"></td>
                        </tr>
                        <tr>
                            <td colspan="16" rowspan="3">Cause:${nc.cause}</td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td colspan="16" rowspan="3">Azioni di contenimento:${nc.aContenimento}</td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td colspan="16" rowspan="3">Azioni correttive:${nc.aCorrettiva}</td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td colspan="16" rowspan="3">Azioni preventive:${nc.aPreventiva}</td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td colspan="16" rowspan="3">Intesa e comprensione:${nc.intesaComp}</td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td colspan="16" rowspan="3">Costo:${nc.costoNC}</td>
                        </tr>

                    </table>
                </div>
                <br/>
                <br/>
            </div>
        </div>
        <br/><br/>
        <div class="row">
            <div class="col-md-2  offset-md-1">
                <input class="btn btn-default btn-block btn-primary" type="button" value="Stampa" id="btnPrint" />
            </div>
        </div>
    </form>
</html>