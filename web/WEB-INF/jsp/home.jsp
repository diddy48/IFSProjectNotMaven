<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
    <head>
        <title>Gestione NC: Nc commissionate</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
    </head>


    <body>
        <nav class="navbar navbar-expand-md sticky-top  navbar-dark bg-primary">
            <a class="navbar-brand" href="<c:url value="/"/>">Gestione delle Non Conformità</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="<c:url value="/"/>"> Home <span class="sr-only">(current)</span></a>
                    </li>
                    <sec:authorize access="!hasRole('ROLE_ADMIN') && !isAnonymous()">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Non-Conformità
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="<c:url value="/showNC/${dip.matricola}"/>"> Mostra le tue Non Conformità </a>
                                <sec:authorize access="hasRole('ROLE_LEADER')">
                                    <a class="dropdown-item" href="<c:url value="/leader/insertNC?submit=Inserisci" />">Inserisci una nuova NC</a>

                                </sec:authorize>
                            </div>
                        </li>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Non-Conformità
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="<c:url value="/leader/insertNC?submit=Inserisci" />">Inserisci una nuova NC</a>
                            </div>
                        </li>
                    </sec:authorize>
                    <!--<li class="nav-item">
                        <a class="nav-link disabled" href="#">Disabled</a>
                    </li>-->
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
        </nav>
        <div  class="container-fluid">
            <!-- https://docs.spring.io/spring-security/site/docs/3.0.x/reference/el-access.html per se authority-->
            <sec:authorize access="isAnonymous()">
                <div class="row">
                    <div class="col-md-8">
                        <br/>
                        <h3><a href="<c:url value="/login"/>">Accedi</a> per visualizzare le NC</h3>
                    </div>
                </div>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_USER')">
                <c:url value="/leader/deleteNC" var="delete"/>
                <c:url value="/leader/insertNC" var="update"/>
                <c:url value="/displayNC" var="display"/>
                <div class="row">
                    <div class="col-md-7">
                        <!-- For login user -->
                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                            <h1>
                                Benvenuto ${pageContext.request.userPrincipal.name}
                            </h1>
                        </c:if>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <h3>Nc Aperte</h3>
                        <div class="table-responsive">
                            <c:choose>
                                <c:when test="${not empty ncAperte}">
                                    <table class="table table-striped table-bordered">
                                        <th>Numero NC</th>
                                        <th>Titolo</th>
                                        <th>Data Apertura</th>
                                        <th>Data Chiusura</th>
                                        <th>Priorità</th>
                                        <th>Codice Prodotto</th>
                                        <th>Azioni</th>

                                        </tr>
                                        <c:forEach items="${ncAperte}" var="nc">
                                            <tr>
                                                <td>${nc.numeroNC}</td>
                                                <td>${nc.titolo}</td>
                                                <td>${nc.dataA}</td>
                                                <td>${nc.dataC==null ? "Non definita" : nc.dataC}</td>
                                                <td>${nc.priorita=="B" ? "Bassa" : (nc.priorita=="M" ? "Media" : (nc.priorita=="A" ? "Alta" : ""))}</td>
                                                <td>${nc.codiceProdotto}</td>
                                                <td>
                                                    <form action="${delete}" method="GET">
                                                        <input type="text" name="numeroNC" value="${nc.numeroNC}" hidden="hidden"/>
                                                        <input class="btn btn-danger" type="submit" name="delete" value="Elimina" />
                                                    </form>

                                                    <form action="${update}" method="GET">
                                                        <input type="text" name="numeroNC" value="${nc.numeroNC}" hidden="hidden"/>
                                                        <input class="btn btn-primary" type="submit" name="submit" value="Modifica" />
                                                    </form>

                                                    <form action="${display}" method="GET">
                                                        <input type="text" name="fase" value="Aperta" hidden="true"/>
                                                        <input type="text" name="numeroNC" value="${nc.numeroNC}" hidden="hidden"/>
                                                        <input class="btn btn-secondary" type="submit" name="submit" value="Visualizza NC" />
                                                    </form> 
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </c:when>
                                <c:otherwise>
                                    <h4>Non sono presenti NC aperte</h4>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <h3>Nc Intermedie</h3>                        
                        <div class="table-responsive">
                            <c:choose>
                                <c:when test="${not empty ncIntermedie}">
                                    <table class="table table-striped table-bordered">
                                        <th>Numero NC</th>
                                        <th>Titolo</th>
                                        <th>Data Apertura</th>
                                        <th>Data Chiusura</th>
                                        <th>Priorità</th>
                                        <th>Codice Prodotto</th>
                                        <th>Azioni</th>

                                        </tr>
                                        <c:forEach items="${ncIntermedie}" var="nc">
                                            <tr>
                                                <td>${nc.numeroNC}</td>
                                                <td>${nc.titolo}</td>
                                                <td>${nc.dataA}</td>
                                                <td>${nc.dataC==null ? "Non definita" : nc.dataC}</td>
                                                <td>${nc.priorita=="B" ? "Bassa" : (nc.priorita=="M" ? "Media" : (nc.priorita=="A" ? "Alta" : ""))}</td>
                                                <td>${nc.codiceProdotto}</td>
                                                <td>
                                                    <form action="${delete}" method="GET">
                                                        <input type="text" name="numeroNC" value="${nc.numeroNC}" hidden="hidden"/>
                                                        <input class="btn btn-danger" type="submit" name="delete" value="Elimina" />
                                                    </form>

                                                    <form action="${update}" method="GET">
                                                        <input type="text" name="numeroNC" value="${nc.numeroNC}" hidden="hidden"/>
                                                        <input class="btn btn-primary" type="submit" name="submit" value="Modifica" />
                                                    </form>
                                                    <form action="${display}" method="GET">
                                                        <input type='text' name="fase" value="Intermedia" hidden="true"/>
                                                        <input type="text" name="numeroNC" value="${nc.numeroNC}" hidden="hidden"/>
                                                        <input class="btn btn-secondary" type="submit" name="submit" value="Visualizza NC" />
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </c:when>
                                <c:otherwise>
                                    <h4>Non sono presenti NC intermedie</h4>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <h3>Nc Chiuse</h3>                        
                        <div class="table-responsive">
                            <c:choose>
                                <c:when test="${not empty ncChiuse}">
                                    <table class="table table-striped table-bordered">
                                        <th>Numero NC</th>
                                        <th>Titolo</th>
                                        <th>Data Apertura</th>
                                        <th>Data Chiusura</th>
                                        <th>Priorità</th>
                                        <th>Codice Prodotto</th>
                                        <th>Azioni</th>

                                        </tr>
                                        <c:forEach items="${ncChiuse}" var="nc">
                                            <tr>
                                                <td>${nc.numeroNC}</td>
                                                <td>${nc.titolo}</td>
                                                <td>${nc.dataA}</td>
                                                <td>${nc.dataC==null ? "Non definita" : nc.dataC}</td>
                                                <td>${nc.priorita=="B" ? "Bassa" : (nc.priorita=="M" ? "Media" : (nc.priorita=="A" ? "Alta" : ""))}</td>
                                                <td>${nc.codiceProdotto}</td>
                                                <td>
                                                    <form action="${delete}" method="GET">
                                                        <input type="text" name="numeroNC" value="${nc.numeroNC}" hidden="hidden"/>
                                                        <input class="btn btn-danger" type="submit" name="delete" value="Elimina" />
                                                    </form>

                                                    <form action="${update}" method="GET">
                                                        <input type="text" name="numeroNC" value="${nc.numeroNC}" hidden="hidden"/>
                                                        <input class="btn btn-primary" type="submit" name="submit" value="Modifica" />
                                                    </form>
                                                    <form action="${display}" method="GET">
                                                        <input type='text' name="fase" value="Chiusa" hidden="true"/>
                                                        <input type="text" name="numeroNC" value="${nc.numeroNC}" hidden="hidden"/>
                                                        <input class="btn btn-secondary" type="submit" name="submit" value="Visualizza NC" />
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </c:when>
                                <c:otherwise>
                                    <h4>Non sono presenti NC chiuse</h4>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <br/>
                <h2>Clicca <a href="<c:url value="/admin/home"/>">qui</a> per vedere i Dipendenti</h2>
            </sec:authorize>
        </div>
    </body>
</html>

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