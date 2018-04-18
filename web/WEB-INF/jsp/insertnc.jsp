<%-- 
    Document   : insertnc
    Created on : 17-apr-2018, 13.39.47
    Author     : FSEVERI\romano3927
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <form action="<c:url value='/leader/addNC' />" method="GET" modelAttribute="nc">
                    <div class="form-group">
                        <label for="titolo">Titolo della Non Conformità</label>
                        <input class="form-control" type="text" name="titolo" id="titolo" placeholder="Titolo NC" required/>
                    </div>
                    <div class="form-group">
                        <label>Descrizione</label>
                        <textarea class="form-control" rows="5" name="descrizione"  placeholder="Inserisci la descrizione" required></textarea>
                    </div>
                    <div class="form-group">
                        <label>Data Apertura</label>
                        <input class="form-control" type="date" name="dataA"  placeholder="Inserisci la descrizione" required/>
                    </div>
                    <div class="form-group">
                        <label>Data Chiusura</label>
                        <input class="form-control" type="date" name="dataC"  placeholder="Inserisci la descrizione" />
                    </div>
                    <div class="form-group">
                        <label>Priorità</label>
                        <select class="form-control selectpicker" name="priorita">
                            <option value="${nc.priorita.B}">Bassa</option>
                            <option value="${nc.priorita.M}">Media</option>
                            <option value="${nc.priorita.A}">Alta</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Codice Prodotto</label>
                        <input class="form-control" type="text" name="codiceProdotto"  placeholder="Inserisci la descrizione" required/>
                    </div>
                    <div class="form-group">
                        <label>Costo Non Conformità</label>
                        <input class="form-control" type="text" name="costoNC"  placeholder="Inserisci la descrizione" />
                    </div>
                    <div class="form-group">
                        <label>Reparto Prodotto</label>
                        <select class="form-control" name="repartoP">
                            <option value="${nc.repartoP.Progettazione}">Progettazione</option>
                            <option value="${nc.repartoP.Produzione}">Produzione</option>
                            <option value="${nc.repartoP.LogisticaE}">Logistica in Entrata</option>
                            <option value="${nc.repartoP.LogisticaU}">Logistica in Uscita</option>
                            <option value="${nc.repartoP.Commerciale}">Commerciale</option>
                            <option value="${nc.repartoP.Amministrativo}">Amministrativo</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Azioni di Contenimento</label>
                        <textarea class="form-control" rows="5" name="aContenimento"  placeholder="Inserisci la descrizione" ></textarea>
                    </div>
                    <div class="form-group">
                        <label>Cause</label>
                        <textarea class="form-control" rows="5" name="cause"  placeholder="Inserisci la descrizione" ></textarea>
                    </div>
                    <div class="form-group">
                        <label>Azioni Correttive</label>
                        <textarea class="form-control" rows="5" name="aCorrettive"  placeholder="Inserisci la descrizione" ></textarea>
                    </div>
                    <div class="form-group">
                        <label>Azioni Preventive</label>
                        <textarea class="form-control" rows="5" name="aPreventive"  placeholder="Inserisci la descrizione" ></textarea>
                    </div>
                    <div class="form-group">
                        <label>Intesa e Comprensione</label>
                        <textarea class="form-control" rows="5" name="intesaComp"  placeholder="Inserisci la descrizione" ></textarea>
                    </div>
                    <div class="form-group">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="tipo" id="interna" value="${nc.tipo.I}" checked>
                            <label class="form-check-label" for="interna">Interna</label></div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="tipo" id="reclamo" value="${nc.tipo.R}">
                            <label class="form-check-label" for="reclamo">Reclamo</label></div>
                    </div>
                    <div class="form-group">
                        <label>Cliente</label>
                        <input class="form-control" type="text" name="cliente"  placeholder="Inserisci la descrizione"/>
                    </div>
                    <div class="form-group">
                        <label>Richiedente</label>
                        <input class="form-control" type="text" name="richiedente"  placeholder="Inserisci la descrizione"/>
                    </div>
                    <div class="form-group">
                        <label>Team Leader</label>
                        <input class="form-control" type="text" name="teamLeader"  placeholder="Inserisci la descrizione" required/>
                    </div>
                    <input type="submit" class="btn btn-default" name="submit" value="Inserisci NC"/>
                </form>
            </div>
        </div>
    </body>
</html>
