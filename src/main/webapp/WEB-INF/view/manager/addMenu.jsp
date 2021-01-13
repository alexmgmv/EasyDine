<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Menu Form</title>
    </head>
    <body>
        <form:form action="${pageContext.request.contextPath}/manager/addMenu" method="post" modelAttribute="menuPR">
            <form:hidden path="restaurant.id" readonly="true" />
            <br>
            <label for="menuItem">Menu Item: </label>
            <form:select id="menuItem" path="menuItem.id" items="${allMenuItems}" itemLabel="title" itemValue="id" />
            <br>
            Description: <form:input path="description" />
            <br>
            Price: <form:input type="number" path="price" min="0.0" step="0.1" />
            <br>
            <input type="submit" value="add">
        </form:form>
    </body>
</html>
