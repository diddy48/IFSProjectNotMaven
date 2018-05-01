<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <title>Access denied!!</title>
        <jsp:include page="links.jsp"/>
    </head>
    <body class="container-fluid">
        <div class="row">
            <div class="col-md-12">
        <h1>HTTP Status 403 - Access is denied</h1>
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
        <c:choose>
            <c:when test="${empty username}">
                <h2>You do not have permission to access this page!</h2>
            </c:when>
            <c:otherwise>
                <h2>Username : ${username} <br/>Non hai i permessi per accedere a questa pagina!</h2>
                </c:otherwise>
            </c:choose>

        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <h2>
                <a href="javascript:formSubmit()"> Esci</a>
            </h2>
        </c:if>
            </div>
        </div>
    </body>
</html>