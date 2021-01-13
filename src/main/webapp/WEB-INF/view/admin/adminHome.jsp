<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home Page</title>
    </head>
    <body>
        <p>
            <a href="${pageContext.request.contextPath}/admin/restaurants">Restaurants</a>
        </p>
        <p>
            <a href="${pageContext.request.contextPath}/admin/users">Users</a>
        </p>
        <p>
            <a href="${pageContext.request.contextPath}/manager">Back</a>
        </p>  
    </body>
</html>
