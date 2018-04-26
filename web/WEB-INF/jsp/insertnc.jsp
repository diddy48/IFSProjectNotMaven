<%-- 
    Document   : insertnc
    Created on : 17-apr-2018, 13.39.47
    Author     : FSEVERI\romano3927
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="com.app.objects.*"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="links.jsp" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
        <title>Nuova NC</title>
    </head>
    <body >
        <jsp:include page="header.jsp" />
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <br/>
                    <h1>${submit} una Non Conformità</h1>
                    <hr/>
                    <c:if test="${not empty added}">
                        <div class="error text-success">${added}</div>
                    </c:if>
                    <c:if test="${not empty error}">
                        <div class="error text-danger">${error}</div>
                    </c:if>
                    <c:if test="${not empty update}">
                        <div class="error text-success">${update}</div>
                    </c:if>
                    <c:url value="/leader/addNC" var="action"/>
                    <form:form method="GET" modelAttribute="nc" action="${action}" enctype="multipart/form-data">      
                        <c:if test="${numeroNC!=0}">
                            <div class="form-group" >
                                <form:label path="numeroNC" >Numero NC</form:label>
                                <form:input class="form-control" path="numeroNC" readonly="true" />
                            </div>
                        </c:if>
                        <div class="form-group"  hidden="true" >
                            <form:label path="enabled">Abilitata</form:label>
                            <form:input class="form-control" path="enabled" readonly="true" value="1"/>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-8">
                                <form:label path="titolo">Titolo della Non Conformità</form:label>
                                <form:input class="form-control" path="titolo" placeholder="Inserisci il titolo" required="required" />
                            </div>
                            <div class="form-group col-md-2 offset-md-1">
                                <br/>
                                <c:forEach items="${tipo}" var="t">
                                    <div class="form-check">
                                        <form:radiobutton class="form-check-input" path="tipo"  value="${t.key}" label="${t.value}"  required="true"/>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="form-group col-md-12">
                                <form:label path="descrizione">Descrizione</form:label>
                                <form:textarea class="form-control" path="descrizione" rows="5" placeholder="Inserisci la descrizione" required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-3">
                                <form:label path="dataA">Data Apertura</form:label>
                                <input class="form-control" type="date" name="dataA" required="true" value="${nc.dataA}"/>
                            </div>
                            <div class="form-group col-md-3">
                                <form:label id ="dataC" path="dataC">Data Chiusura</form:label><!--value="${not empty nc.dataC ? nc.dataC : "" }"-->
                                <input class="form-control" type="date"  name="dataC" value="${nc.dataA}"  />
                            </div>
                            <div class="form-group col-md-3">
                                <form:label path="priorita">Priorità</form:label>
                                <form:select class="form-control" path="priorita" items="${priorita}"/>
                            </div>
                            <div class="form-group col-md-3">
                                <form:label path="codiceProdotto">Codice Prodotto</form:label>                       
                                <form:input class="form-control" path="codiceProdotto" placeholder="Inserisci il codice del prodotto" required="required" />
                            </div>
                            <div class="form-group col-md-3">
                                <form:label path="costoNC">Costo Non Conformità</form:label>
                                <form:input class="form-control" path="costoNC" placeholder="Inserisci il costo della Non Conformità" />
                            </div>
                            <div class="form-group col-md-6">
                                <form:label path="repartoP">Reparto Prodotto</form:label>
                                <form:select class="form-control" path="repartoP" items="${reparti}"/>
                            </div>
                            <div class="form-group col-md-3">
                                <form:label path="teamLeader.matricola">Team Leader</form:label>
                                <form:select class="form-control" path="teamLeader.matricola" required="true" >
                                    <form:option value="" label="-- Seleziona il team leader --" disabled="true" selected="true" />
                                    <form:options items="${dipendenti}" />
                                </form:select>
                            </div>
                        </div>
                        <div class="row">
                            <div class=" col-md-6 form-group">
                                <form:label path="aContenimento">Azioni di Contenimento</form:label>
                                <form:textarea class="form-control" path="aContenimento" rows="5" placeholder="Inserisci la descrizione" />
                            </div>
                            <div class="col-md-6 form-group">
                                <form:label path="cause">Cause</form:label>
                                <form:textarea class="form-control" path="cause" rows="5" placeholder="Inserisci la descrizione" />
                            </div>
                            <div class="col-md-6 form-group">
                                <form:label path="aCorrettiva">Azioni Correttive</form:label>
                                <form:textarea class="form-control" path="aCorrettiva" rows="5" placeholder="Inserisci la descrizione" />
                            </div>
                            <div class="col-md-6 form-group">
                                <form:label path="aPreventiva">Azioni Preventive</form:label>
                                <form:textarea class="form-control" path="aPreventiva" rows="5" placeholder="Inserisci la descrizione" />
                            </div>
                            <div class="col-md-6 form-group">
                                <form:label path="intesaComp">Intesa e Comprensione</form:label>
                                <form:textarea class="form-control" path="intesaComp" rows="5" placeholder="Inserisci la descrizione" />
                            </div>
                            <div class=" col-md-6">
                                <div class="form-group" hidden=${(submit=='Modifica')&&(nc.cliente!=null) ? "" : "hidden"}>
                                    <form:label path="cliente">Cliente</form:label>
                                    <form:input class="form-control" path="cliente" placeholder="Inserisci il nome del cliente"/>
                                </div>
                                <div class="form-group" hidden=${(submit=='Modifica')&&(nc.richiedente!=null) ? "" : "hidden"}>
                                    <form:label path="richiedente.matricola">Richiedente</form:label>
                                    <form:select class="form-control" path="richiedente.matricola">
                                        <form:option value="" label="-- Seleziona il richiedente --" disabled="true" selected="true" />
                                        <form:options items="${dipendenti}" />
                                    </form:select>
                                </div>
                                <div class="form-group">
                                    <form:label path="membri">Team di Lavoro</form:label>
                                    <form:select class="form-control" multiple="true" path="membri">
                                        <form:option value="" label="-- Seleziona i membro --"  selected="true" />
                                        <form:options items="${dipendenti}"/>
                                    </form:select>
                                </div>
                                <div class="form-group">
                                    <form:label path="responsabili">Responsabili</form:label>
                                    <form:select class="form-control" multiple="true" path="responsabili">
                                        <form:option value="" label="-- Seleziona i responsabili --" selected="true" />
                                        <form:options items="${dipendenti}"/>
                                    </form:select>
                                </div>
                            </div>
                        </div>
                        <c:choose>
                            <c:when test="${submit=='Modifica'}">
                                <input type="submit" class="btn-block btn btn-default" name="update" value="Aggiorna NC"/>
                            </c:when>
                            <c:otherwise>
                                <input type="submit" class="btn-block btn btn-default" name="insert" value="Inserisci NC"/>
                            </c:otherwise> 
                        </c:choose> 
                    </form:form>
                </div>
            </div>
            <footer class="footer pt-4 mt-4">
                <div class="footer-copyright py-3 text-center">
                    © 2018 Copyright: <h5 class="text-primary">Gabriele Romano</h5>
                </div>
            </footer>
        </div>
    </body>
</html>
<script>
    $(document).on("change", "input[type=radio]", function () {
        var tipo = $('[name="tipo"]:checked').val();
        if (tipo === "I") {
            $('[name="richiedente.matricola"]').parent().prop("hidden", "");
            $('[name="richiedente.matricola"]').prop("required", "true");
            $('[name="cliente"]').parent().prop("hidden", "hidden");
            $('[name="cliente"]').prop("required", "");
        } else {
            $('[name="richiedente.matricola"]').parent().prop("hidden", "hidden");
            $('[name="richiedente.matricola"]').prop("required", "");
            $('[name="cliente"]').parent().prop("hidden", "");
            $('[name="cliente"]').prop("required", "true");
        }
    });

    /*$(document).on("click", "input[name=dataC]", function () {
     var dataC = $('[name="dataC"]').val();
     if (dataC != null) {
     $('[name="costoNC"]').prop("required", "true");
     }
     });*/
</script>
