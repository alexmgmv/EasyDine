<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Replace Manager Form</title>
    </head>
    <body>
        <form:form action="${pageContext.request.contextPath}/admin/replace" method="post" modelAttribute="restaurant">
            Restaurant title: <form:input path="businessTitle" readonly="true" />
            <br>
            <label for="manager">Manager: </label>
            <form:select id="manager" path="manager.id" items="${managers}" itemLabel="username" itemValue="id" />
            <a href="${pageContext.request.contextPath}/admin/addManager">Add Manager</a>
            <br>
            <form:hidden path="id" readonly="true" />
            <form:hidden path="seatCapacity" readonly="true" />
            <form:hidden path="restaurantType.id" readonly="true" />
            <br>
            <input type="submit" value="save">
        </form:form>
        <p>
            <a href="${pageContext.request.contextPath}/admin">Back</a>
        </p>  
    </body>
</html>
