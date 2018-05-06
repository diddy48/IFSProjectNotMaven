<%-- 
    Document   : nc
    Created on : 22-mar-2018, 21.37.45
    Author     : roman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gestione NC: Nc commissionate</title>

        <jsp:include page="links.jsp" />
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div  class="container-fluid">
            <h1>Le tue Non Conformità</h1>  
            <hr>
            <div class="row">
                <div class="col-md-12">
                    <c:if test="${!empty ncLeader}">
                        <h3>NC di cui è leader</h3>
                        <table class="table table-striped table-bordered">
                            <tr>
                                <th>Numero NC</th>
                                <th>Titolo</th>
                                <th>Descrizione</th>
                                <th>Data Apertura</th>
                                <th>Data Chiusura</th>
                                <th>Priorità</th>
                                <th>Codice Prodotto</th>
                                <!--<th>Costo NC</th>
                                <th>Reparto Prodotto</th>
                                <th>Azioni di Contenimento</th>
                                <th>Cause</th>
                                <th>Azioni Correttive</th>
                                <th>Azioni Preventive</th>
                                <th>Intesa e Comprensione</th>-->
                                <th>Tipo</th>
                                <th>Cliente</th>
                                <th>Richiedente</th>

                            </tr>
                            <c:forEach items="${ncLeader}" var="nc">
                                <tr>
                                    <td>${nc.numeroNC}</td>
                                    <td>${nc.titolo}</td>
                                    <td>${nc.descrizione}</td>
                                    <td>${String.valueOf(nc.dataA).substring(0,10)}</td>
                                    <td>${nc.dataC==null ? "Non definita" : String.valueOf(nc.dataC).substring(0,10)}</td>
                                    <td>${nc.priorita=="B" ? "Bassa" : (nc.priorita=="M" ? "Media" : (nc.priorita=="A" ? "Alta" : ""))}</td>
                                    <td>${nc.codiceProdotto}</td>
                                    <!--<td>${nc.costoNC}</td>
                                    <td>${nc.repartoP}</td>
                                    <td>${nc.aContenimento}</td>
                                    <td>${nc.cause}</td>
                                    <td>${nc.aCorrettiva}</td>
                                    <td>${nc.aPreventiva}</td>
                                    <td>${nc.intesaComp}</td>-->
                                    <td>${nc.tipo}</td>
                                    <td>${nc.tipo=="R" ? nc.cliente : "Non presente"}</td>
                                    <td>${nc.tipo=="I" ? nc.richiedente.matricola: "Non presente"}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>
                    <br/>
                    <c:if test="${!empty ncRichiede}">
                        <h3>NC che ha richiesto</h3>
                        <table class="table table-striped table-bordered">
                            <tr>
                                <th>Numero NC</th>
                                <th>Titolo</th>
                                <th>Descrizione</th>
                                <th>Data Apertura</th>
                                <th>Data Chiusura</th>
                                <th>Priorità</th>
                                <th>Codice Prodotto</th>
                                <th>Tipo</th>
                                <th>Cliente</th>
                                <th>Team Leader</th>

                            </tr>
                            <c:forEach items="${ncRichiede}" var="nc">
                                <tr>
                                    <td>${nc.numeroNC}</td>
                                    <td>${nc.titolo}</td>
                                    <td>${nc.descrizione}</td>
                                    <td>${String.valueOf(nc.dataA).substring(0,10)}</td>
                                    <td>${nc.dataC==null ? "Non definita" : String.valueOf(nc.dataC).substring(0,10)}</td>
                                    <td>${nc.priorita=="B" ? "Bassa" : (nc.priorita=="M" ? "Media" : (nc.priorita=="A" ? "Alta" : ""))}</td>
                                    <td>${nc.codiceProdotto}</td>
                                    <td>${nc.tipo}</td>
                                    <td>${nc.tipo=="R" ? nc.cliente : "Non presente"}</td>
                                    <td>${nc.teamLeader.matricola}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>
                    <br/>
                    <c:if test="${!empty ncResponsabile}">
                        <h3>NC di cui è responsabile</h3>
                        <table class="table table-striped table-bordered">
                            <tr>
                                <th>Numero NC</th>
                                <th>Titolo</th>
                                <th>Descrizione</th>
                                <th>Data Apertura</th>
                                <th>Data Chiusura</th>
                                <th>Priorità</th>
                                <th>Codice Prodotto</th>
                                <th>Tipo</th>
                                <th>Cliente</th>
                                <th>Richiedente</th>
                                <th>Team Leader</th>

                            </tr>
                            <c:forEach items="${ncResponsabile}" var="nc">
                                <tr>
                                    <td>${nc.numeroNC}</td>
                                    <td>${nc.titolo}</td>
                                    <td>${nc.descrizione}</td>
                                    <td>${String.valueOf(nc.dataA).substring(0,10)}</td>
                                    <td>${nc.dataC==null ? "Non definita" : String.valueOf(nc.dataC).substring(0,10)}</td>
                                    <td>${nc.priorita=="B" ? "Bassa" : (nc.priorita=="M" ? "Media" : (nc.priorita=="A" ? "Alta" : ""))}</td>
                                    <td>${nc.codiceProdotto}</td>
                                    <td>${nc.tipo}</td>
                                    <td>${nc.tipo=="R" ? nc.cliente : "Non presente"}</td>
                                    <td>${nc.tipo=="I" ? nc.richiedente.matricola: "Non presente"}</td>
                                    <td>${nc.teamLeader.matricola}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>
                    <br/>
                    <c:if test="${!empty ncMembro}">
                        <h3>NC a cui fa parte come mebro del team di lavoro</h3>
                        <table class="table table-striped table-bordered">
                            <tr>
                                <th>Numero NC</th>
                                <th>Titolo</th>
                                <th>Descrizione</th>
                                <th>Data Apertura</th>
                                <th>Data Chiusura</th>
                                <th>Priorità</th>
                                <th>Codice Prodotto</th>
                                <th>Tipo</th>
                                <th>Cliente</th>
                                <th>Richiedente</th>
                                <th>Team Leader</th>
                            </tr>
                            <c:forEach items="${ncMembro}" var="nc">
                                <tr>
                                    <td>${nc.numeroNC}</td>
                                    <td>${nc.titolo}</td>
                                    <td>${nc.descrizione}</td>
                                    <td>${String.valueOf(nc.dataA).substring(0,10)}</td>
                                    <td>${nc.dataC==null ? "Non definita" : String.valueOf(nc.dataC).substring(0,10)}</td>
                                    <td>${nc.priorita=="B" ? "Bassa" : (nc.priorita=="M" ? "Media" : (nc.priorita=="A" ? "Alta" : ""))}</td>
                                    <td>${nc.codiceProdotto}</td>
                                    <td>${nc.tipo}</td>
                                    <td>${nc.tipo=="R" ? nc.cliente : "Non presente"}</td>
                                    <td>${nc.tipo=="I" ? nc.richiedente.matricola: "Non presente"}</td>
                                    <td>${nc.teamLeader.matricola}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>
                    <c:if test="${empty ncResponsabile && empty ncLeader && empty ncRichiede && empty ncMembro}">
                        <h3 class="text-info">Non è presente non conformità di alcun tipo al momento</h3>
                    </c:if>
                </div>
            </div>
            
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
