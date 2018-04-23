<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
    <head>
        <title>Gestione Nc: Dipendenti</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
    </head>
    <body><jsp:include page="header.jsp"/>
        <!--<nav class="navbar navbar-expand-md sticky-top  navbar-dark bg-primary">
            <a class="navbar-brand" href="<c:url value="/"/>">Gestione delle Non Conformità</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="<c:url value="/"/>"> Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Non-Conformità
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="<c:url value="/leader/insertNC?submit=Inserisci" />">Inserisci una nuova NC</a>
                        </div>
                    </li>
                    <!--<li class="nav-item">
                        <a class="nav-link disabled" href="#">Disabled</a>
                    </li>
                </ul>
            </div>
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <div class="navbar-collapse collapse order-3 dual-collapse2">
                    <ul class="navbar-nav ml-auto">

                        <li class="nav-item ">
                            <a class="nav-link" href="javascript:formSubmit()"> Esci</a>
                        </li>
                    </ul>
                </div>
            </c:if>
        </nav>-->
        <div class="container-fluid">
            <h1>Dipendenti</h1>  
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <h3>
                    Benvenuto : ${pageContext.request.userPrincipal.name}
                </h3>
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
                                    <td>${String.valueOf(u.dataNascita).substring(0,10)}</td>
                                    <td>${u.username.username}</td>
                                    <td><a href="<c:url value="/showNC?matricola=${u.matricola}"/>" > NC Commissionate</a></td>
                                </tr>
                            </c:forEach>
                        </table>

                    </c:if>
                </div>
            </div>
        </div>
    </body>
</html>