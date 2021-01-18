<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en"> 
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>

    <body>
        <main class="container">
            <div class="text-center mt-5">
                <c:if test="${successMsg != null}" >
                    <h3 class="text-success">${successMsg}</h3>
                </c:if>

                <c:if test="${failMsg != null}" >
                    <h3 class="text-danger">${failMsg}</h3>
                </c:if>

                <c:if test="${param.error != null}" >
                    <h3 class="text-danger">Credentials are not correct!!!</h3>
                </c:if>

                <c:if test="${param.logout != null}" >
                    <h3 class="text-success">You logged out successfully!</h3>
                </c:if>
            </div>
            
            <div class="jumbotron mx-auto my-auto col text-center bg-light">
                <h3 class="text-primary">Please log-in!</h3>
                <div class="my-5">
                    <form:form id="login" action="${pageContext.request.contextPath}/authenticate" method="POST">
                        <label for="username"><b>Username</b></label>
                        <br>
                        <input type="text" placeholder="Enter username" name="username" required/>
                        <br><br>
                        <label for="password"><b>Password</b></label>
                        <br>
                        <input type="password" placeholder="Enter password" name="password" required/>
                        <br><br>
                    </form:form>
                </div>            
                <div class="row text-center">
                    <span class="col">Not registered?<br><a href="${pageContext.request.contextPath}/signup">Sign-Up!</a><br>And get free credits for in-app purchases!</span>
                    <span class="col"><button type="submit" class="btn btn-primary" form="login">Login</button></span>
                    <span class="col"><a class="btn btn-primary" href="${pageContext.request.contextPath}/chat">Chat</a></span>
                </div>
            </div>

        </main>

    </body>
</html>
