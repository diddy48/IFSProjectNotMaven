<%-- 
    Document   : statistiche
    Created on : 24-apr-2018, 18.26.50
    Author     : roman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gestione NC: Statistiche</title>
        <jsp:include page="links.jsp"/>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <jsp:include page="grafici.jsp"/>
                </div>
            </div>
        </div>

    </body>
</html>
