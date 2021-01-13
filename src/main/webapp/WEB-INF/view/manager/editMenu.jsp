<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Edit Form</title>
    </head>
    <body> 
        <form:form action="${pageContext.request.contextPath}/manager/editMenu" method="post" modelAttribute="menu">   
            <form:hidden path="restaurant.id" readonly="true"/>
            <form:hidden path="id" readonly="true"/>
            <form:hidden path="menuItem.id" readonly="true" />
            <br>
            Description: <form:input path="description" />
            <br>
            Price: <form:input type="number" path="price" min="0.0" step="0.1" />
            <br>
            <input type="submit" value="edit">
        </form:form>
        <p>
            <a href="${pageContext.request.contextPath}/manager">Back</a>
        </p>  
    </body>
</html>