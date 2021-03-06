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
                <div class="col-lg-8 offset-lg-2">
                    <br/>
                    <h1>Inserisci i dati del dipendente</h1>
                    <hr/>
                    <c:url value="/admin/addDip"  var="insert"/>
                    <form action="${insert}"  method="POST" modelAttribute="{dip,user}">
                        <div class="form-group">
                            <form:label path="user.username">Username </form:label>
                            <form:input path="user.username" maxlength="30" required="true" class="form-control" placeholder="Inserisci lo username del dipendente" />
                        </div>
                        <div class="form-group">
                            <form:label path="dip.nome">Nome: </form:label>
                            <form:input path="dip.nome" required="true" maxlength="30" class="form-control" placeholder="Inserisci il nome del dipendente" />
                        </div>
                        <div class="form-group">
                            <form:label path="dip.cognome">Cognome </form:label>
                            <form:input path="dip.cognome" required="true" maxlength="30" class="form-control" placeholder="Inserisci il nome del dipendente" />
                        </div>
                        <div class="form-group">
                            <form:label path="user.password">Password: </form:label>
                            <form:input path="user.password" type="password" required="true" class="form-control" placeholder="Inserisci la password del dipendente" />
                        </div>                    
                        <div class="form-group">
                            <form:label path="dip.cf">Codice Fiscale:  </form:label>
                            <form:input path="dip.cf" required="true" maxlength="16" class="form-control" placeholder="Inserisci il codice fiscale del dipendente" />
                        </div>
                        <form:input path="user.enabled" required="true" hidden="true" value="1" />
                        <div class="form-group">
                            <form:label path="dip.dataNascita">Data di nascita </form:label>
                            <form:input type="date" path="dip.dataNascita" required="true" class="form-control" />
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <input class="btn btn-primary" type="submit" name="submit" value="Inserisci"/>
                    </form>
                    <c:if test="${not empty error}" >
                        <h4 class="text-danger">${error}</h4>
                    </c:if>
                </div>
            </div>

            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
