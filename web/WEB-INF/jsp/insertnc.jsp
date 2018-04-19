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
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        <title>Nuova NC</title>
    </head>
    <body class="container-fluid">
        <h1>Inserisci una nuova Non Conformità</h1>
        <hr>
        <div class="row">
            <div class="col-md-8 offset-2">
                <c:if test="${not empty added}">
                    <div class="error text-success">${added}</div>
                </c:if>
                <c:url value="/leader/addNC" var="add"/>
                <form:form method="GET" modelAttribute="nc" action="${add}" enctype="multipart/form-data">
                    <form:input path="numeroNC" readonly="true" disabled="true" hidden="true" />
                    <div class="form-group">
                        <form:label path="titolo">Titolo della Non Conformità</form:label>
                        <form:input class="form-control" path="titolo" placeholder="Inserisci il titolo" required="required" />
                    </div>
                    <div class="form-group">
                        <form:label path="descrizione">Descrizione</form:label>
                        <form:textarea class="form-control" path="descrizione" rows="5" placeholder="Inserisci la descrizione" required="required" />
                    </div>
                    <div class="form-group">
                        <form:label path="dataA">Data Apertura</form:label>
                        <input class="form-control" type="date" name="dataA" required/>
                    </div>
                    <div class="form-group">
                        <form:label path="dataC">Data Chiusura</form:label><!--value="${not empty nc.dataC ? nc.dataC : "" }"-->
                        <input class="form-control" type="date"  name="dataC"  />
                    </div>
                    <div class="form-group">
                        <form:label path="priorita">Priorità</form:label>
                        <form:select class="form-control" path="priorita" items="${priorita}"/>
                    </div>
                    <div class="form-group">
                        <form:label path="codiceProdotto">Codice Prodotto</form:label>                       
                        <form:input class="form-control" path="codiceProdotto" placeholder="Inserisci il codice del prodotto" required="required" />
                    </div>
                    <div class="form-group">
                        <form:label path="costoNC">Costo Non Conformità</form:label>
                        <form:input class="form-control" path="costoNC" placeholder="Inserisci il costo della Non Conformità" />
                    </div>
                    <div class="form-group">
                        <form:label path="repartoP">Reparto Prodotto</form:label>
                        <form:select class="form-control" path="repartoP" items="${reparti}"/>
                    </div>
                    <div class="form-group">
                        <form:label path="aContenimento">Azioni di Contenimento</form:label>
                        <form:textarea class="form-control" path="aContenimento" rows="5" placeholder="Inserisci la descrizione" />
                    </div>
                    <div class="form-group">
                        <form:label path="cause">Cause</form:label>
                        <form:textarea class="form-control" path="cause" rows="5" placeholder="Inserisci la descrizione" />
                    </div>
                    <div class="form-group">
                        <form:label path="aCorrettiva">Azioni Correttive</form:label>
                        <form:textarea class="form-control" path="aCorrettiva" rows="5" placeholder="Inserisci la descrizione" />
                    </div>
                    <div class="form-group">
                        <form:label path="aPreventiva">Azioni Preventive</form:label>
                        <form:textarea class="form-control" path="aPreventiva" rows="5" placeholder="Inserisci la descrizione" />
                    </div>
                    <div class="form-group">
                        <form:label path="intesaComp">Intesa e Comprensione</form:label>
                        <form:textarea class="form-control" path="intesaComp" rows="5" placeholder="Inserisci la descrizione" />
                    </div>
                    <div class="form-group">
                        <c:forEach items="${tipo}" var="t">
                            <div class="form-check form-check-inline">
                                <form:radiobutton class="form-check-input" path="tipo"  value="${t.key}" label="${t.value}" checked=""/>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="form-group">
                        <form:label path="cliente">Cliente</form:label>
                        <form:input class="form-control" path="cliente" placeholder="Inserisci il nome del cliente" />
                    </div>
                    <div class="form-group">
                        <form:label path="richiedente">Richiedente</form:label>
                        <form:select class="form-control" path="richiedente" items="${dipendenti}"/>
                    </div>
                    <div class="form-group">
                        <form:label path="teamLeader">Team Leader</form:label>
                        <form:select class="form-control" path="teamLeader" items="${dipendenti}"/>
                    </div>
                    <input type="submit" class="btn btn-default" name="submit" value="Inserisci NC"/>
                </form:form>
            </div>
        </div>
    </body>
</html>
