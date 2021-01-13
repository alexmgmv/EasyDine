<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Home Page</title>
    </head>
    <body>
         <div align="center">
            <h1>${managerMsg}</h1>
        </div> 
        <br>
        <p>
            <a href="${pageContext.request.contextPath}/manager/info">Edit Personal Info</a>
        </p>
        <p>
            <a href="${pageContext.request.contextPath}/manager/restaurant">Manage Restaurant</a>
        </p>
        <p>
            <form:form action="${pageContext.request.contextPath}/logout" method="post">
                <input type="submit" value="Logout"/>
            </form:form>
        </p> 
    </body>
</html>
