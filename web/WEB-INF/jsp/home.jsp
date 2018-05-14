<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
    <head>
        <title>Gestione NC: Nc commissionate</title>
        <jsp:include page="links.jsp" />
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div  class="container-fluid">
            <!-- https://docs.spring.io/spring-security/site/docs/3.0.x/reference/el-access.html per se authority-->
            <sec:authorize access="isAnonymous()">
                <div class="row">
                    <div class="col">
                        <jsp:include page="grafici.jsp"/>
                    </div>
                </div>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_USER')">
                <c:url value="/leader/deleteNC" var="delete"/>
                <c:url value="/leader/insertNC" var="update"/>
                <c:url value="/user/displayNC" var="display"/>
                <c:url value="/leader/enable" var="enable"/>
                
                <c:url value="/resources/img/greenDot.png" var="b"/>
                <c:url value="/resources/img/yellowDot.png" var="m"/>
                <c:url value="/resources/img/redDot.png" var="a"/>
                        <!-- For login user -->
                        <h1>
                            Dashboard
                        </h1>
            <hr>
                <div class="row">
                    <div class="col-lg-4 col-sm-12">
                        <h3>Nc Aperte</h3>
                        <div class="table-responsive">
                            <c:choose>
                                <c:when test="${not empty ncAperte}">
                                    <table class="table table-striped table-bordered">
                                        <th>Numero NC</th>
                                        <th>Titolo</th>
                                        <th>Data Apertura</th>
                                        <th>Priorità</th>
                                        <th>Azioni</th>

                                        </tr>
                                        <c:forEach items="${ncAperte}" var="nc">
                                            <tr>
                                                <td>${nc.numeroNC}</td>
                                                <td>${nc.titolo}</td>
                                                <td>${nc.dataA}</td>
                                                <td><center><img src="${nc.priorita=="B" ? b : (nc.priorita=="M" ? m : (nc.priorita=="A" ? a : ""))}" width="30px" height="30px" /></center></td>
                                                <td>
                                                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                                                        <form action="${delete}" method="POST">
                                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                            <input type="text" name="numeroNC" value="${nc.numeroNC}" hidden="hidden"/>
                                                            <input class="btn btn-danger btn-block" type="submit" name="delete" value="Elimina" />
                                                        </form>
                                                    </sec:authorize>
                                                    <sec:authorize access="hasRole('ROLE_LEADER')">
                                                        <c:if test="${nc.teamLeader.matricola==dipLoggato.matricola|| dipLoggato.matricola==1}">
                                                        <form action="${update}" method="GET">
                                                            <input type="text" name="numeroNC" value="${nc.numeroNC}" hidden="hidden"/>
                                                            <input class="btn btn-primary btn-block" type="submit" name="submit" value="Modifica" />
                                                        </form>
                                                        </c:if>
                                                    </sec:authorize>
                                                    <form action="${display}" method="GET">
                                                        <input type="text" name="fase" value="Aperta" hidden="true"/>
                                                        <input type="text" name="numeroNC" value="${nc.numeroNC}" hidden="hidden"/>
                                                        <input class="btn btn-secondary btn-block" type="submit" name="submit" value="Visualizza NC" />
                                                    </form> 
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </c:when>
                                <c:otherwise>
                                    <h4>Non sono presenti non conformità aperte al momento</h4>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-12">
                        <h3>Nc Intermedie</h3>                        
                        <div class="table-responsive">
                            <c:choose>
                                <c:when test="${not empty ncIntermedie}">
                                    <table class="table table-striped table-bordered">
                                        <th>Numero NC</th>
                                        <th>Titolo</th>
                                        <th>Data Apertura</th>
                                        <th>Priorità</th>
                                        <th>Azioni</th>

                                        </tr>
                                        <c:forEach items="${ncIntermedie}" var="nc">
                                            <tr>
                                                <td>${nc.numeroNC}</td>
                                                <td>${nc.titolo}</td>
                                                <td>${nc.dataA}</td>
                                                <td><center><img src="${nc.priorita=="B" ? b : (nc.priorita=="M" ? m : (nc.priorita=="A" ? a : ""))}" width="30px" height="30px" /></center></td>
                                                <td>

                                                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                                                        <form action="${delete}" method="POST">
                                                            <input type="text" name="numeroNC" value="${nc.numeroNC}" hidden="hidden"/>
                                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                            <input class="btn btn-danger btn-block" type="submit" name="delete" value="Elimina" />
                                                        </form>
                                                    </sec:authorize>
                                                    <sec:authorize access="hasRole('ROLE_LEADER')">
                                                        <c:if test="${nc.teamLeader.matricola==dipLoggato.matricola|| dipLoggato.matricola==1}">
                                                        <form action="${update}" method="GET">
                                                            <input type="text" name="numeroNC" value="${nc.numeroNC}" hidden="hidden"/>
                                                            <input class="btn btn-primary btn-block" type="submit" name="submit" value="Modifica" />
                                                        </form>
                                                        </c:if>
                                                    </sec:authorize>
                                                    <form action="${display}" method="GET">
                                                        <input type='text' name="fase" value="Intermedia" hidden="true"/>
                                                        <input type="text" name="numeroNC" value="${nc.numeroNC}" hidden="hidden"/>
                                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                        <input class="btn btn-secondary btn-block" type="submit" name="submit" value="Visualizza NC" />
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </c:when>
                                <c:otherwise>
                                    <h4>Non sono presenti non conformità intermedie al momento</h4>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-12">
                        <h3>Nc Chiuse</h3>                        
                        <div class="table-responsive">
                            <c:choose>
                                <c:when test="${not empty ncChiuse}">
                                    <table class="table table-striped table-bordered">
                                        <th>Numero NC</th>
                                        <th>Titolo</th>
                                        <th>Data Apertura/Chiusura</th>
                                        <th>Priorità</th>
                                        <th>Azioni</th>

                                        </tr>
                                        <c:forEach items="${ncChiuse}" var="nc">
                                            <tr>
                                                <td>${nc.numeroNC}</td>
                                                <td>${nc.titolo}</td>
                                                <td>${nc.dataA} - ${nc.dataC}</td>
                                                <td><center><img src="${nc.priorita=="B" ? b : (nc.priorita=="M" ? m : (nc.priorita=="A" ? a : ""))}" width="30px" height="30px" /></center></td>
                                                <td>
                                                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                                                        <form action="${delete}" method="POST">
                                                            <input type="text" name="numeroNC" value="${nc.numeroNC}" hidden="hidden"/>
                                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                            <input class="btn btn-danger btn-block" type="submit" name="delete" value="Elimina" />
                                                        </form>
                                                    </sec:authorize>
                                                    <sec:authorize access="hasRole('ROLE_LEADER')">
                                                        <c:if test="${nc.teamLeader.matricola==dipLoggato.matricola|| dipLoggato.matricola==1}">
                                                        <form action="${update}" method="GET">
                                                            <input type="text" name="numeroNC" value="${nc.numeroNC}" hidden="hidden"/>
                                                            <input class="btn btn-primary btn-block" type="submit" name="submit" value="Modifica" />
                                                        </form>
                                                        </c:if>
                                                    </sec:authorize>
                                                    <form action="${display}" method="GET">
                                                        <input type='text' name="fase" value="Chiusa" hidden="true"/>
                                                        <input type="text" name="numeroNC" value="${nc.numeroNC}" hidden="hidden"/>
                                                        <input class="btn btn-secondary btn-block" type="submit" name="submit" value="Visualizza NC" />
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </c:when>
                                <c:otherwise>
                                    <h4>Non sono presenti non conformità chiuse al momento</h4>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
                <c:if test="${not empty insert}">
                    <div class="error text-success">${insert}</div>
                </c:if>
                <c:if test="${not empty error}">
                    <div class="error text-danger">${error}</div>
                </c:if>
            </sec:authorize>
            <br/>
            <sec:authorize access="hasRole('ROLE_LEADER')">
                <div class="row">
                    <div class="col-lg-8 col-sm-12">
                        <h3>Le tue segnalazioni</h3>
                        <div class="table-responsive">
                            <c:choose>
                                <c:when test="${not empty segnalazioni}">
                                    <table class="table table-striped table-bordered">
                                        <th>Numero NC</th>
                                        <th>Titolo</th>
                                        <th>Descrizione</th>
                                        <th>Data Apertura</th>
                                        <th>Priorità</th>
                                        <th>Azioni</th>

                                        </tr>
                                        <c:forEach items="${segnalazioni}" var="nc">
                                            <tr>
                                                <td>${nc.numeroNC}</td>
                                                <td>${nc.titolo}</td>
                                                <td>${nc.descrizione}</td>
                                                <td>${nc.dataA}</td>
                                                <td>${nc.priorita=="B" ? "Bassa" : (nc.priorita=="M" ? "Media" : (nc.priorita=="A" ? "Alta" : ""))}</td>
                                                <td>
                                                    <c:choose>
                                                    <c:when test="${nc.teamLeader.matricola == dipLoggato.matricola || dipLoggato.matricola==1}">
                                                        <div class="row">
                                                            <div class=" col-md-6 ">
                                                                <form action="${delete}" method="POST">
                                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                                    <input type="text" name="numeroNC" value="${nc.numeroNC}" hidden="hidden"/>
                                                                    <input class="btn btn-danger btn-block" type="submit" name="delete" value="Elimina" />
                                                                </form>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <form action="${enable}" method="GET">
                                                                    <input type="text" name="numeroNC" value="${nc.numeroNC}" hidden="hidden"/>
                                                                    <input class="btn btn-primary btn-block" type="submit" name="submit" value="Abilita" />
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </c:when>
                                                        <c:otherwise>
                                                            <h6 class="text-info">Non è possibile modificare le proprietà di questa segnalazione</h6>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </c:when>
                                <c:otherwise>
                                    <h4>Non sono presenti segnalazioni al momento</h4>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </sec:authorize>

            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>