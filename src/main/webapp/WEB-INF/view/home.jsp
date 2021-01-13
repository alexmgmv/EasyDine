<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>home page</title>
    </head>
    <body>
        <h1>Welcome to Easy Dine Web Application!</h1>
        <hr>

        <security:authorize access="hasRole('admin')">
            <p>
                <a href="${pageContext.request.contextPath}/admin">Enter</a>
            </p>
        </security:authorize>
        <security:authorize access="hasRole('manager')">
            <p>
                <a href="${pageContext.request.contextPath}/manager">Enter</a>
            </p>
        </security:authorize>
        <security:authorize access="hasRole('customer')">
            <p>
                <a href="${pageContext.request.contextPath}/customer">Enter</a>
            </p>
        </security:authorize>
        <p>
            <form:form action="${pageContext.request.contextPath}/logout" method="post">
                <input type="submit" value="Logout"/>
            </form:form>
        </p>
    </body>
</html>
