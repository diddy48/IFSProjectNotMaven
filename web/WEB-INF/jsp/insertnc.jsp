<%-- 
    Document   : insertnc
    Created on : 17-apr-2018, 13.39.47
    Author     : FSEVERI\romano3927
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        <title>Nuova NC</title>
    </head>
    <body>
        <form action="<c:url value='/login' />" method="GET">
            <div class="form-control">
                <label>Titolo NC</label>
                <input type="text" name="titolo"  placeholder="Titolo NC" required/>
            </div>
            <div class="form-control">
                <label>Descrizione</label>
                <textarea class="form-control" rows="5" name="descrizione"  placeholder="Inserisci la descrizione" required></textarea>
            </div>
            <div class="form-control">
                <label>Data Apertura</label>
                <input type="date" name="dataA"  placeholder="Inserisci la descrizione" required/>
            </div>
            <div class="form-control">
                <label>Data Chiusura</label>
                <input type="date" name="dataC"  placeholder="Inserisci la descrizione" />
            </div>
            <div class="form-control">
                <label>Priorità</label>
                <input type="text" name="priorita"  placeholder="Inserisci la descrizione" required/>
            </div>
            <div class="form-control">
                <label>Codice Prodotto</label>
                <input type="text" name="codiceProdotto"  placeholder="Inserisci la descrizione" required/>
            </div>
            <div class="form-control">
                <label>Costo Non Conformità</label>
                <input type="text" name="costoNC"  placeholder="Inserisci la descrizione" />
            </div>
            <div class="form-control">
                <label>Reparto Prodotto</label>
                <input type="text" name="repartoP"  placeholder="Inserisci la descrizione" required/>
            </div>
            <div class="form-control">
                <label>Azioni di Contenimento</label>
                <textarea class="form-control" rows="5" name="aContenimento"  placeholder="Inserisci la descrizione" ></textarea>
            </div>
            <div class="form-control">
                <label>Cause</label>
                <textarea class="form-control" rows="5" name="cause"  placeholder="Inserisci la descrizione" ></textarea>
            </div>
            <div class="form-control">
                <label>Azioni Correttive</label>
                <textarea class="form-control" rows="5" name="aCorrettive"  placeholder="Inserisci la descrizione" ></textarea>
            </div>
            <div class="form-control">
                <label>Azioni Preventive</label>
                <textarea class="form-control" rows="5" name="aPreventive"  placeholder="Inserisci la descrizione" ></textarea>
            </div>
            <div class="form-control">
                <label>Intesa e Comprensione</label>
                <textarea class="form-control" rows="5" name="intesaComp"  placeholder="Inserisci la descrizione" ></textarea>
            </div>
            <div class="form-control">
                <label>Tipo</label>
                <input type="text" name="tipo"  placeholder="Inserisci la descrizione" required/>
            </div>
            <div class="form-control">
                <label>Cliente</label>
                <input type="text" name="cliente"  placeholder="Inserisci la descrizione"/>
            </div>
            <div class="form-control">
                <label>Richiedente</label>
                <input type="text" name="richiedente"  placeholder="Inserisci la descrizione"/>
            </div>
            <div class="form-control">
                <label>Team Leader</label>
                <input type="text" name="teamLeader"  placeholder="Inserisci la descrizione" required/>
            </div>
    </form>
</body>
</html>
