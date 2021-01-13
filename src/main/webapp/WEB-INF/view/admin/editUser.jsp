<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Information</title>
    </head>
    <body> 
        <form:form action="${pageContext.request.contextPath}/admin/editUser" method="post" modelAttribute="user">
            <form:hidden path="id" readonly="true" />
            <br>
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
            App Credits: <form:input path="credits" readonly="true" />
            <br>
            <form:hidden path="userRole" readonly="true"/>
            <br>
            <input type="submit" value="edit">
        </form:form>
        <p>
            <a href="${pageContext.request.contextPath}/admin">Back</a>
        </p>  
    </body>
</html>
