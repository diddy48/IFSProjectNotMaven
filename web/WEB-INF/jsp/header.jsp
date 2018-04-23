<%-- 
    Document   : header
    Created on : 21-apr-2018, 23.25.52
    Author     : roman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<nav class="navbar navbar-expand-md sticky-top  navbar-dark bg-primary">
    <a class="navbar-brand" href="<c:url value="/"/>">Gestione delle Non Conformità</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <sec:authorize access="!isAnonymous()">
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
    </sec:authorize>
    <sec:authorize access="isAnonymous()">
        <div class="navbar-collapse collapse order-3 dual-collapse2">
            <ul class="navbar-nav ml-auto">

                <li class="nav-item ">
                    <a class="nav-link active" href="<c:url value="/login"/>"> Accedi</a>
                </li>
            </ul>
        </div>
    </sec:authorize>
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
