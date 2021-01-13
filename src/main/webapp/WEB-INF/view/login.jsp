<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <div align="center">
            <c:if test="${customerMsg != null}" >
                <h1>${customerMsg}</h1>
            </c:if>
            <h3>Please Login</h3>
            <c:if test="${param.error != null}" >
                <strong>Credentials are not correct!!!</strong>
            </c:if>
            <c:if test="${param.logout != null}" >
                <strong>You logged out successfully!!!</strong>
            </c:if>

            <form:form action="${pageContext.request.contextPath}/authenticate" method="POST">
                <p>
                    Username : <input type="text" name="username"/>
                </p>
                <p>
                    Password : <input type="password" name="password"/>
                </p>
                <p>
                    <input type="submit" value="Login"/>
                </p>
            </form:form>

            <p>
                <a href="${pageContext.request.contextPath}/signup">Sign-Up</a>
            </p>
            <p>
                <a href="${pageContext.request.contextPath}/chat">Chat</a>
            </p>
        </div>
    </body>
</html>
