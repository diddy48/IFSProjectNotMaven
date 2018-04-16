<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
    <head>
        <title>Gestione Nc: Dipedenti</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    </head>
    <body class="container-fluid">
        <c:url value="/logout" var="logoutUrl" />
        <form action="${logoutUrl}" method="post" id="logoutForm">
            <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}" />
        </form>
        <script>
            function formSubmit() {
                document.getElementById("logoutForm").submit();
            }
        </script>
        <h2>Dipendenti</h2>  
        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <h2>
                Welcome : ${pageContext.request.userPrincipal.name}
            </h2>
        </c:if>

        <div class="row">
            <div class="col-md-7">
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
                                <td>${u.dataNascita}</td>
                                <td>${u.username}</td>
                                <td><a href="<c:url value="/showNC?matricola=${u.matricola}"/>" > NC Commissionate</a></td>
                            </tr>
                        </c:forEach>
                    </table>

                </c:if>
            </div>
        </div>
        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <h2>
                <a href="javascript:formSubmit()"> Esci</a>
            </h2>
        </c:if>

    </body>
</body>
</html>