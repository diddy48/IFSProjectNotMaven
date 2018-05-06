<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
    <head>
        <title>Gestione Nc: Dipendenti</title>
        <jsp:include page="links.jsp"/>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container-fluid">
            <h1>Gestisci i Dipendenti</h1>  <br/>
            <c:url value="/user/showNC" var="showNC"/>
            <c:url value="/admin/deleteDip" var="delete"/>
            <div class="row">
                <div class="col-md-8">
                    <c:if test="${!empty dipendenti}">
                        <table class="table table-striped table-bordered">

                            <tr>
                                <th>Matricola</th>
                                <th>Codice Fiscale</th>
                                <th>Nome</th>
                                <th>Cognome</th>
                                <th>Data di nascita</th>
                                <th>Username</th>

                            </tr>
                            <c:forEach items="${dipendenti}" var="u">
                                <tr>
                                    <td name ="matricola">${u.matricola}</td>
                                    <td>${u.cf}</td>
                                    <td>${u.nome}</td>
                                    <td>${u.cognome}</td>
                                    <td>${String.valueOf(u.dataNascita).substring(0,10)}</td>
                                    <td>${u.username.username}</td>
                                    <td>
                                                <form action="${delete}" method="GET">
                                                    <input type="text" name="matricola" value="${u.matricola}" hidden="true"/>
                                                    <input class="btn btn-danger btn-block" type="submit" name="submit" value="Elimina" />
                                                </form> 
                                                <form action="${showNC}" method="GET">
                                                    <input type="text" name="matricola" value="${u.matricola}" hidden="true"/>
                                                    <input class="btn btn-secondary btn-block" type="submit" name="submit" value="NC commissionate" />
                                                </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>

                    </c:if>
                </div>
            </div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>