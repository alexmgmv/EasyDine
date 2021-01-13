<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Manager Form</title>
    </head>
    <body>
        <form:form action="${pageContext.request.contextPath}/admin/addManager" method="post" modelAttribute="manager">
            Username: <form:input path="username" required="required" />
            <br>
            Password: <form:password path="password" required="required" />
            <br>
            First Name: <form:input path="firstName" />
            <br>
            Last Name: <form:input path="lastName" />
            <br>
            Phone: <form:input path="phone" />
            <br>
            E-Mail: <form:input path="mail" />
            <br>
            Address: <form:input path="address" />
            <br>
            Region: <form:input path="region" />
            <br>
            City: <form:input path="city" />
            <br>
            <form:hidden path="userRole.id" value="3" readonly="true" />
            <form:hidden path="credits" value="0" readonly="true" />
            <br>
            <input type="submit" value="save"/>
        </form:form>
        <p>
            <a href="${pageContext.request.contextPath}/admin">Back</a>
        </p> 
    </body>
</html>
