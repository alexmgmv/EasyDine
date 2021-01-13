<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Restaurant Form</title>
    </head>
    <body>
        <form:form action="${pageContext.request.contextPath}/admin/addRestaurantType" method="post" modelAttribute="type">
            Food Category: <form:input path="foodCategory" required="required" />
            <br>
            <input type="submit" value="save">
        </form:form>
        <p>
            <a href="${pageContext.request.contextPath}/admin">Back</a>
        </p>  
    </body>
</html>
