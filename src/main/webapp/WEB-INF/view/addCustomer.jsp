<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Form</title>
    </head>
    <body>
        <form:form action="${pageContext.request.contextPath}/signup" method="post" modelAttribute="customer">
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
            <form:hidden path="userRole.id" value="2" readonly="true" />
            <br>
            <input type="submit" value="Submit"/>
        </form:form>
    </body>
</html>
