<%-- 
    Document   : insertDip
    Created on : 23-apr-2018, 19.29.36
    Author     : roman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="links.jsp"/>
        <title>Inserisci un nuovo dipendente</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-8 offset-2">
                <br/>
                <h1>Inserisci i dati del dipendente</h1>
                    <c:url value="/admin/addDip"  var="insert"/>
                    <form action="${insert}"  method="POST">
                        <div class="form-group">
                            <form:label path="dip.username">Username </form:label>
                            <form:input path="dip.username" required="true" class="form-control" placeholder="Inserisci lo username del dipendente" />
                        </div>
                        <div class="form-group">
                            <form:label path="dip.nome">Nome: </form:label>
                            <form:input path="dip.nome" required="true" class="form-control" placeholder="Inserisci il nome del dipendente" />
                        </div>
                        <div class="form-group">
                            <form:label path="dip.cognome">Nome: </form:label>
                            <form:input path="dip.cognome" required="true" class="form-control" placeholder="Inserisci il nome del dipendente" />
                        </div>
                        <div class="form-group">
                            <form:label path="user.password">Password: </form:label>
                            <form:input path="user.password" required="true" class="form-control" placeholder="Inserisci la password del dipendente" />
                        </div>
                        <div class="form-group">
                            <form:label path="dip.cf">Codice Fiscale:  </form:label>
                            <form:input path="dip.cf" required="true" class="form-control" placeholder="Inserisci il codice fiscale del dipendente" />
                        </div>
                        <div class="form-group">
                            <form:label path="dip.dataNascita">Data di nascita </form:label>
                            <input type="date" name="dip.dataNascita" required="true" class="form-control" placeholder="Inserisci la data di nascita del dipendente" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
