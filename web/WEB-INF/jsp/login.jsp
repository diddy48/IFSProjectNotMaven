<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
    <head>
        <title>Login</title>
        <jsp:include page="links.jsp" />
        <style>
            .error {
                padding: 15px;
                margin-bottom: 20px;
                border: 1px solid transparent;
                border-radius: 4px;
                color: #a94442;
                background-color: #f2dede;
                border-color: #ebccd1;
            }

            .msg {
                padding: 15px;
                margin-bottom: 20px;
                border: 1px solid transparent;
                border-radius: 4px;
                color: #31708f;
                background-color: #d9edf7;
                border-color: #bce8f1;
            }


        </style>
        <!-- 
        
                #login-box {
                    width: 300px;
                    padding: 20px;
                    margin: 100px auto;
                    background: #fff;
                    -webkit-border-radius: 2px;
                    -moz-border-radius: 2px;
                    border: 1px solid #000;
                }
        -->
    </head>
    <body onload='document.loginForm.username.focus();'>
        <jsp:include page="header.jsp" />
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-8 offset-2 " id="login-box">
                    <br/>
                    <h3>Login</h3>
                    <c:if test="${not empty error}">
                        <div class="error text-danger">${error}</div>
                    </c:if>
                    <c:if test="${not empty msg}">
                        <p class="msg text-info">${msg}</p>
                    </c:if>

                    <form name='loginForm' action="<c:url value='/login' />" method='POST'>

                        <div class="form-group">
                            <label for="exampleInputEmail1">Nome utente:</label>
                            <input class="form-control" type='text' name='username' placeholder="Inserisci il nome utente" required>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Password:</label>
                            <input class="form-control" type='password' name='password' placeholder="Inserisci la password" required/>
                        </div>
                        <input class="btn btn-default" name="submit" type="submit" value="Accedi" />


                        <input type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}" />

                    </form>
                </div>
            </div>
                               
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>