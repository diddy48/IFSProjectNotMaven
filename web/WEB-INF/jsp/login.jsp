<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
    <head>
        <title>Login Page</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

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

            #login-box {
                width: 300px;
                padding: 20px;
                margin: 100px auto;
                background: #fff;
                -webkit-border-radius: 2px;
                -moz-border-radius: 2px;
                border: 1px solid #000;
            }
        </style>
    </head>
    <body class="container-fluid" onload='document.loginForm.username.focus();'>

        <h1>Gestione NC Login</h1>
        <div class="row">
            <div class="col-md-6 col-md-offset-3" id="login-box">

                <h3>Login with Username and Password</h3>

                <c:if test="${not empty error}">
                    <div class="error">${error}</div>
                </c:if>
                <c:if test="${not empty msg}">
                    <div class="msg">${msg}</div>
                </c:if>

                <form name='loginForm'
                      action="<c:url value='/login' />" method='POST'>

                    <div class="form-group">
                        <label for="exampleInputEmail1">User:</label>
                        <input class="form-control" type='text' name='username' required>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Password:</label>
                        <input class="form-control" type='password' name='password' required/>
                    </div>
                    <input class="btn btn-default" name="submit" type="submit" value="Submit" />


                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}" />

                </form>
            </div>
        </div>

    </body>
</html>