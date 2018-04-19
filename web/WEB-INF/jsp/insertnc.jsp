<%-- 
    Document   : insertnc
    Created on : 17-apr-2018, 13.39.47
    Author     : FSEVERI\romano3927
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
                <form:form method="GET" modelAttribute="nc" action="/leader/addNC">
                    <form:input path="numeroNC" readonly="true" disabled="true" />
                    <form:hidden path="numeroNC"/>
                    <div class="form-group">
                        <label for="titolo">Titolo della Non Conformità</label>
                        <input class="form-control" type="text" name="titolo" id="titolo" placeholder="Titolo NC" value="${not empty nc.titolo ? nc.titolo : "" }" required/>
                    </div>
                    <div class="form-group">
                        <label>Descrizione</label>
                        <textarea class="form-control" rows="5" name="descrizione" value="${not empty nc.descrizione ? nc.descrizione : "" }" placeholder="Inserisci la descrizione" required></textarea>
                    </div>
                    <div class="form-group">
                        <label>Data Apertura</label>
                        <input class="form-control" type="date" name="dataA" value="${not empty nc.dataA ? nc.dataA : "" }" required/>
                    </div>
                    <div class="form-group">
                        <label>Data Chiusura</label>
                        <input class="form-control" type="date" value="${not empty nc.dataC ? nc.dataC : "" }" name="dataC"  />
                    </div>
                    <div class="form-group">
                        <label>Priorità</label>
                        <form:select class="form-control" path="priorita" items="${priorita}"/>
                    </div>
                    <div class="form-group">
                        <label>Codice Prodotto</label>
                        <input class="form-control" type="text" name="codiceProdotto" value="${not empty nc.codiceProdotto ? nc.codiceProdotto : "" }" placeholder="Inserisci il codice del prodotto" required/>
                    </div>
                    <div class="form-group">
                        <label>Costo Non Conformità</label>
                        <input class="form-control" type="text" name="costoNC" value=""  placeholder="Inserisci il costo della Non Conformità" />
                    </div>
                    <div class="form-group">
                        <label>Reparto Prodotto</label>
                        <form:select class="form-control" path="repartoP" items="${reparti}"/>
                    </div>
                    <div class="form-group">
                        <label>Azioni di Contenimento</label>
                        <textarea class="form-control" rows="5" name="aContenimento" value=""  placeholder="Inserisci " ></textarea>
                    </div>
                    <div class="form-group">
                        <label>Cause</label>
                        <textarea class="form-control" rows="5" name="cause" value=""  placeholder="Inserisci" ></textarea>
                    </div>
                    <div class="form-group">
                        <label>Azioni Correttive</label>
                        <textarea class="form-control" rows="5" name="aCorrettiva" value=""  placeholder="Inserisci" ></textarea>
                    </div>
                    <div class="form-group">
                        <label>Azioni Preventive</label>
                        <textarea class="form-control" rows="5" name="aPreventiva" value=""  placeholder="Inserisci " ></textarea>
                    </div>
                    <div class="form-group">
                        <label>Intesa e Comprensione</label>
                        <textarea class="form-control" rows="5" name="intesaComp" value=""  placeholder="Inserisci" ></textarea>
                    </div>
                    <div class="form-group">
                        <c:forEach items="${tipo}" var="t">
                            <div class="form-check form-check-inline">
                                <form:radiobutton class="form-check-input" path="tipo"  value="${t.key}" label="${t.value}" checked=""/>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="form-group">
                        <label>Cliente</label>
                        <input class="form-control" type="text" name="cliente" value=""  placeholder="Inserisci il nome del cliente"/>
                    </div>
                    <div class="form-group">
                        <label>Richiedente</label>
                        <form:select class="form-control" path="richiedente" items="${dipendenti}"/>
                    </div>
                    <div class="form-group">
                        <label>Team Leader</label>
                        <form:select class="form-control" path="teamLeader" items="${dipendenti}"/>
                    </div>
                    <input type="submit" class="btn btn-default" name="submit" value="Inserisci NC"/>
                </form:form>
            </div>
        </div>
    </body>
</html>
