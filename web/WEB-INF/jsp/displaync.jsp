<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <title>Mostra NC</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <link rel="icon" href="<c:url value="/resources/img/vite-icona-vettore-clipart_csp50198116.png"/>" type="image/png"/>
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
            <br/>
            <div class="row">
                <div class="col-md-10 offset-md-1">
                    <h2>Non-Conformit&agrave in dettaglio</h2><br/>
                    <table class="table table-bordered table-striped" >
                        <tr>
                            <td colspan="16"><span class="font-weight-bold">Codice NC: </span>${nc.numeroNC}</td>
                        </tr>
                        <tr>
                            <td colspan="8"><span class="font-weight-bold">Titolo: </span>${nc.titolo}</td>
                            <td><span class="font-weight-bold">Fase: </span>${fase}</td>
                            <td><span class="font-weight-bold">Tipo: </span>${nc.tipo.descrizione}</td>
                            <c:choose>
                                <c:when test="${nc.richiedente==null}"><td colspan="4"><span class="font-weight-bold">Cliente: </span>${nc.cliente}</td></c:when>
                                <c:otherwise><td colspan="4"><span class="font-weight-bold">Richiedente: </span>${richiedente}</td></c:otherwise>
                            </c:choose>
                        </tr>
                        <tr>
                            <td colspan="8"><span class="font-weight-bold">Data apertura: </span>${nc.dataA}</td>
                            <td colspan="8" rowspan="3"><span class="font-weight-bold">Descrizione: </span>${nc.descrizione}</td>
                        </tr>
                        <tr>
                            <td colspan="8"><span class="font-weight-bold">Data chiusura: </span>${nc.dataC!=null?nc.dataC : "Non definita"}</td>
                        </tr>
                        <tr>
                            <td colspan="8"><span class="font-weight-bold">Priorit&agrave: </span>${nc.priorita.descrizione}</td>
                        </tr>
                        <tr>
                            <td colspan="4" rowspan="2"><span class="font-weight-bold">Team di lavoro: </span>
                                <c:if test="${empty nc.membri}">
                                    <span class="text-info">Non � stato assegnato alcun team di lavor oper questa non conformita</span>
                                </c:if>
                                <ul>
                                    <c:forEach items="${membri}" var="membro">
                                        <li>${membro}</li><% // ${membro.pkAppartenere.membro.nome} ${membro.pkAppartenere.membro.cognome}%>
                                        </c:forEach>
                                </ul>
                            </td>
                            <td colspan="6" rowspan="2"><span class="font-weight-bold">Responsabili:  </span>
                                <c:if test="${empty nc.responsabili}">
                                    <span class="text-info">Non � stato assegnato alcun responsabile per questa non conformita</span>
                                </c:if>
                                <ul>
                                    <c:forEach items="${responsabili}" var="resp">
                                        <li>${resp}</li>
                                        </c:forEach>
                                </ul>
                            </td>
                            <td colspan="6"><span class="font-weight-bold">Codice prodotto: </span>${nc.codiceProdotto}</td>
                        </tr>
                        <tr>
                            <td colspan="8"><span class="font-weight-bold">Reparto prodotto: </span>${nc.repartoP.descrizione}</td>
                        </tr>
                        <tr style="height:70px;background:lightgray">
                            <td colspan="16"></td>
                        </tr>
                        <tr>
                            <td colspan="16" rowspan="3"><span class="font-weight-bold">Cause: </span>${nc.cause==null || nc.cause==''  ? "Non ancora definite" :nc.cause}</td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td colspan="16" rowspan="3"><span class="font-weight-bold">Azioni di contenimento: </span>${nc.aContenimento==null || nc.aContenimento=='' ? "Non ancora definite" :nc.aContenimento}</td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td colspan="16" rowspan="3"><span class="font-weight-bold">Azioni correttive: </span>${nc.aCorrettiva==null || nc.aCorrettiva=='' ? "Non ancora definite" :nc.aCorrettiva}</td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td colspan="16" rowspan="3"><span class="font-weight-bold">Azioni preventive: </span>${nc.aPreventiva==null || nc.aPreventiva=='' ? "Non ancora definite" :nc.aPreventiva}</td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td colspan="16" rowspan="3"><span class="font-weight-bold">Intesa e comprensione: </span>${nc.intesaComp==null || nc.intesaComp=='' ? "Non ancora definita" :nc.intesaComp}</td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td colspan="16" rowspan="3"><span class="font-weight-bold">Costo: </span>${nc.costoNC==null ? "Non definito":nc.costoNC}</td>
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