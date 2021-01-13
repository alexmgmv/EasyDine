<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurant Working Hours</title>
    </head>
    <body>
        <form:form action="${pageContext.request.contextPath}/manager/workingHours" method="post" modelAttribute="hours">  
            <form:hidden id="id" path="restaurantId" readonly="true"/><br>
            Monday: <form:input type="Time" path="mondayOpen" /> to <form:input type="Time" path="mondayClose" /><br>
            Tuesday: <form:input type="Time" path="tuesdayOpen" /> to <form:input type="Time" path="tuesdayClose" /><br>
            Wednesday: <form:input type="Time" path="wednesdayOpen" /> to <form:input type="Time" path="wednesdayClose" /><br>
            Thursday: <form:input type="Time" path="thursdayOpen" /> to <form:input type="Time" path="thursdayClose" /><br>
            Friday: <form:input type="Time" path="fridayOpen" /> to <form:input type="Time" path="fridayClose" /><br>
            Saturday: <form:input type="Time" path="saturdayOpen" /> to <form:input type="Time" path="saturdayClose" /><br>
            Sunday: <form:input type="Time" path="sundayOpen" /> to <form:input type="Time" path="sundayClose" /><br>
            <input type="submit" value="edit">
        </form:form>
        <p>
            <a href="${pageContext.request.contextPath}/manager">Back</a>
        </p>  
    </body>
</html>
