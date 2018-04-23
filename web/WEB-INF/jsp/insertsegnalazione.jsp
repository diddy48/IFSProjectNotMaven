<%-- 
    Document   : insertsegnalazione
    Created on : 23-apr-2018, 15.43.11
    Author     : roman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserisci una nuova segnalazione</title>
        <jsp:include page="links.jsp"/>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container-fluid">
            <h1>Inserisci una segnalazione</h1>
            <hr>
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <c:url value="/user/addNC" var="action"/>
                    <form:form method="GET" modelAttribute="nc" action="${action}" enctype="multipart/form-data">      
                        <div class="form-group"  hidden="true" >
                            <form:label path="enabled">Abilitata</form:label>
                            <form:input class="form-control" path="enabled" readonly="true" value="0"/>
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
                                    <input class="form-control" type="date" name="dataA" required=""/>
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
                                <form:label path="repartoP">Reparto Prodotto</form:label>
                                <form:select class="form-control" path="repartoP" items="${reparti}"/>
                            </div>
                            <div class="form-group col-md-6">
                                <form:label path="teamLeader.matricola">Team Leader</form:label>
                                <form:select class="form-control" path="teamLeader.matricola" required="true" >
                                    <form:option value="" label="-- Seleziona il team leader --" disabled="true" selected="true" />
                                    <form:options items="${dipendenti}" />
                                </form:select>
                            </div>
                            <div class=" col-md-6">
                                <div class="form-group" hidden="hidden"}>
                                    <form:label path="cliente">Cliente</form:label>
                                    <form:input class="form-control" path="cliente" placeholder="Inserisci il nome del cliente"/>
                                </div>
                                <div class="form-group" hidden="hidden"}>
                                    <form:label path="richiedente.matricola">Richiedente</form:label>
                                    <form:select class="form-control" path="richiedente.matricola">
                                        <form:option value="" label="-- Seleziona il richiedente --" disabled="true" selected="true" />
                                        <form:options items="${dipendenti}" />
                                    </form:select>
                                </div>
                            </div>
                        </div>
                        <input type="submit" class="btn-block btn btn-default" name="insert" value="Segnala Non conformita"/>
                    </form:form>
                </div>
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
